---------------------------------------------------------------------------------
--
--   Copyright 2017 - Rutherford Appleton Laboratory and University of Bristol
--
--   Licensed under the Apache License, Version 2.0 (the "License");
--   you may not use this file except in compliance with the License.
--   You may obtain a copy of the License at
--
--       http://www.apache.org/licenses/LICENSE-2.0
--
--   Unless required by applicable law or agreed to in writing, software
--   distributed under the License is distributed on an "AS IS" BASIS,
--   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--   See the License for the specific language governing permissions and
--   limitations under the License.
--
--                                     - - -
--
--   Additional information about ipbus-firmare and the list of ipbus-firmware
--   contacts are available at
--
--       https://ipbus.web.cern.ch/ipbus
--
---------------------------------------------------------------------------------


-- enclustra_ax3_pm3_infra
--
-- All board-specific stuff goes here
--
-- Dave Newbold, June 2013

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use work.ipbus.all;

entity enclustra_ax3_pm3_infra is
	generic (
          CLK_AUX_FREQ : real := 40.0 ; -- Default: 40 MHz clock - LHC
          USE_NEO430 : boolean := False; -- Set to "true" in order to include NEO430
          NEO430_CLOCK_SPEED : natural := 31250000 ; -- soft core clock speed
          FORCE_RARP : boolean := False; -- Set True in order to force use of RARP, regardless of PROM
          UID_I2C_ADDR : std_logic_vector(7 downto 0) := x"53" -- Address on I2C bus of E24AA025E
		);
	port(
		osc_clk: in std_logic; -- 50MHz board crystal clock
		clk_ipb_o: out std_logic; -- IPbus clock
		rst_ipb_o: out std_logic;
		clk125_o: out std_logic;
		rst125_o: out std_logic;
		clk_aux_o: out std_logic; -- 50MHz clock
		rst_aux_o: out std_logic;
		nuke: in std_logic; -- The signal of doom
		soft_rst: in std_logic; -- The signal of lesser doom
		leds: out std_logic_vector(1 downto 0); -- status LEDs
		rgmii_txd: out std_logic_vector(3 downto 0);
		rgmii_tx_ctl: out std_logic;
		rgmii_txc: out std_logic;
		rgmii_rxd: in std_logic_vector(3 downto 0);
		rgmii_rx_ctl: in std_logic;
		rgmii_rxc: in std_logic;
		uart_txd_o : out std_logic; -- UART connection between soft core and serial terminal
		uart_rxd_i : in std_logic :='0' ; --* Tie
		uid_scl_o: out std_logic; -- I2C bus connected to EEPROM storing MAC address and (if desired IP address)
		uid_sda_o: out std_logic;
		uid_scl_i: in std_logic :='0' ; --* Tie
		uid_sda_i: in std_logic :='0' ; --* Tie
		gp_o: out std_logic_vector(11 downto 0); -- General purpose output from soft-core CPU
        mac_addr: in std_logic_vector(47 downto 0) := (others =>'0'); -- MAC address --* Tie
        ip_addr: in std_logic_vector(31 downto 0) := (others =>'0'); -- IP address  --* Tie
		ipb_in: in ipb_rbus; -- ipbus
		ipb_out: out ipb_wbus
	);

end enclustra_ax3_pm3_infra;

architecture rtl of enclustra_ax3_pm3_infra is

    -- Can't use direct instantiation ( entity work.ipbus_neo430_wrapper ) since if USE_NEO430 is False, then don't want to have to include ipbus_neo430_wrapper.vhd
    COMPONENT ipbus_neo430_wrapper IS
    GENERIC( 
        CLOCK_SPEED : natural := 31250000;
        UID_I2C_ADDR : std_logic_vector(7 downto 0) := x"53" -- Address on I2C bus of E24AA025E
        );
    PORT( 
        clk_i      : IN     std_logic;                      -- global clock, rising edge
        rst_i      : IN     std_logic;                      -- global reset, async, active high
        uart_txd_o : OUT    std_logic;                      -- UART from NEO to host
        uart_rxd_i : IN     std_logic;                      -- from host to NEO UART
        leds       : OUT    std_logic_vector (3 DOWNTO 0);  -- status LEDs
        scl_o      : OUT    std_logic;                      -- I2C clock from NEO
        scl_i      : IN     std_logic;                      -- the actual state of the line back to NEO
        sda_o      : OUT    std_logic;                      -- I2C data from NEO
        sda_i      : IN     std_logic;
        gp_o       : OUT    std_logic_vector(11 downto 0);  -- General purpose output. Used in DUNE to define the endpoint ID
        use_rarp_o : OUT    std_logic;                      -- If high then IPBus should use RARP, not fixed IP
        ip_addr_o  : OUT    std_logic_vector(31 downto 0);  -- IP address to give to IPBus core
        mac_addr_o : OUT    std_logic_vector(47 downto 0);  -- MAC address to give to IPBus core
        ipbus_rst_o: OUT    std_logic                       -- Reset line to IPBus core
        );
    end component;

	signal clk125_fr, clk125, clk125_90, clk200, clk_aux, clk_ipb, clk_ipb_i, locked, rst125, rst_aux, rst_ipb, rst_ipb_ctrl, rst_eth, onehz, pkt: std_logic;
	signal mac_tx_data, mac_rx_data: std_logic_vector(7 downto 0);
	signal mac_tx_valid, mac_tx_last, mac_tx_error, mac_tx_ready, mac_rx_valid, mac_rx_last, mac_rx_error: std_logic;
	signal led_p: std_logic_vector(0 downto 0);
	signal s_mac_addr, s_neo430_mac_addr: std_logic_vector(47 downto 0); -- MAC address
	signal s_ip_addr , s_neo430_ip_addr:  std_logic_vector(31 downto 0); -- IP address
	signal internal_nuke, neo430_nuke: std_logic := '0';
    signal neo430_RARP_select , RARP_select : std_logic := '0'; -- set high to use RARP
    
--    attribute mark_debug: string;
--    attribute mark_debug of RARP_select : signal is "true";
--    attribute mark_debug of neo430_RARP_select : signal is "true";
--    attribute mark_debug of rst_ipb_ctrl : signal is "true";
--    attribute mark_debug of internal_nuke : signal is "true";

begin

--	DCM clock generation for internal bus, ethernet

	clocks: entity work.clocks_7s_extphy_se
		generic map(
			CLK_AUX_FREQ => CLK_AUX_FREQ
			)
		port map(
			sysclk => osc_clk,
			clko_125 => clk125,
			clko_125_90 => clk125_90,
			clko_200 => clk200,
			clko_aux => clk_aux,
			clko_ipb => clk_ipb_i,
			locked => locked,
			nuke => internal_nuke,
			soft_rst => soft_rst,
			rsto_125 => rst125,
			rsto_aux => rst_aux,
			rsto_ipb => rst_ipb,
			rsto_ipb_ctrl => rst_ipb_ctrl,
			onehz => onehz
		);

	clk_ipb <= clk_ipb_i; -- Best to align delta delays on all clocks for simulation
	clk_ipb_o <= clk_ipb_i;
	rst_ipb_o <= rst_ipb;
	clk125_o <= clk125;	
	rst125_o <= rst125;
	clk_aux_o <= clk_aux;	
	rst_aux_o <= rst_aux;

	stretch: entity work.led_stretcher
		generic map(
			WIDTH => 1
		)
		port map(
			clk => clk125,
			d(0) => pkt,
			q => led_p
		);

	leds <= (led_p(0), locked and onehz);

-- Soft core to read MAC and IP address
    gen_softcore: if USE_NEO430 generate
	soft_core_cpu: ipbus_neo430_wrapper
		generic map(
                  CLOCK_SPEED =>  NEO430_CLOCK_SPEED, -- 31.25MHz IPBus clock
                  UID_I2C_ADDR => UID_I2C_ADDR 
                  )
		port map(
			clk_i => clk_ipb,	-- global clock, rising edge
			rst_i => '0',		-- CPU reset. Active high. Async
			uart_txd_o => uart_txd_o,-- UART from NEO to host
      		uart_rxd_i => uart_rxd_i,-- from host to NEO UART
      		leds       => open, -- status LEDs
	    	scl_o      => uid_scl_o,                      -- I2C clock from NEO
	    	scl_i      => uid_scl_i,                       -- the actual state of the line back to NEO
    		sda_o      => uid_sda_o,                        -- I2C data from NEO
    		sda_i      => uid_sda_i,
    		use_rarp_o => neo430_RARP_select,
    		gp_o       => gp_o,
    		ip_addr_o  => s_neo430_ip_addr,
    		mac_addr_o => s_neo430_mac_addr,
    		ipbus_rst_o => neo430_nuke
			);
    end generate gen_softcore;
    
-- If soft core not used need to tie I2C line high.
    gen_neo_i2c: if USE_NEO430 = false generate
        uid_scl_o <= '1';
        uid_sda_o <= '1';
    end generate gen_neo_i2c;
    
    
	-- combine resets
	internal_nuke <= nuke or neo430_nuke;

-- Ethernet MAC core and PHY interface
	
	eth: entity work.eth_7s_rgmii
		port map(
			clk125 => clk125,
			clk125_90 => clk125_90,
			clk200 => clk200,
			rst => rst125,
			rgmii_txd => rgmii_txd,
			rgmii_tx_ctl => rgmii_tx_ctl,
			rgmii_txc => rgmii_txc,
			rgmii_rxd => rgmii_rxd,
			rgmii_rx_ctl => rgmii_rx_ctl,
			rgmii_rxc => rgmii_rxc,
			tx_data => mac_tx_data,
			tx_valid => mac_tx_valid,
			tx_last => mac_tx_last,
			tx_error => mac_tx_error,
			tx_ready => mac_tx_ready,
			rx_data => mac_rx_data,
			rx_valid => mac_rx_valid,
			rx_last => mac_rx_last,
			rx_error => mac_rx_error
		);
	
-- ipbus control logic

	ipbus: entity work.ipbus_ctrl
		port map(
			mac_clk => clk125,
			rst_macclk => rst125,
			ipb_clk => clk_ipb,
			rst_ipb => rst_ipb_ctrl,
			mac_rx_data => mac_rx_data,
			mac_rx_valid => mac_rx_valid,
			mac_rx_last => mac_rx_last,
			mac_rx_error => mac_rx_error,
			mac_tx_data => mac_tx_data,
			mac_tx_valid => mac_tx_valid,
			mac_tx_last => mac_tx_last,
			mac_tx_error => mac_tx_error,
			mac_tx_ready => mac_tx_ready,
			ipb_out => ipb_out,
			ipb_in => ipb_in,
			RARP_select => RARP_select,
			mac_addr => s_mac_addr,
			ip_addr => s_ip_addr,
			pkt => pkt
		);

    -- If we are using the NEO430 soft core, get the MAC,IP addresses from there
    -- Otherwise use the input ports.
    s_mac_addr <= s_neo430_mac_addr when USE_NEO430 else mac_addr;
    s_ip_addr  <= s_neo430_ip_addr  when USE_NEO430 else ip_addr;
    
    RARP_select <= '1' when (neo430_RARP_select='1' or FORCE_RARP) else '0';
    
end rtl;
