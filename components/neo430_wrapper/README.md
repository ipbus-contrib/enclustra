## neo430_wrapper - uses neo430 soft core CPU to set MAC address ( and optionally IP ) address from contents of I2C PROM ##

Assumes that there is a PROM containing the MAC address attached to the I2C bus. This can either be:

* [Microchip 24AA025E](https://www.microchip.com/wwwproducts/en/24AA025), which can also store IP address (if not using RARP)
* CrypoEEPROM on AX3 with memory map described in section 4.4 of [AX3 manual](https://download.enclustra.com/public_files/FPGA_Modules/Mars_AX3/Mars_AX3_User_Manual_V05.pdf)

Address of the EEPROM on I2C bus given by the `UID_I2C_ADDR` generic.

The MAC address is always read from the EEPROM  unique ID area. This guarantees a unique ( and value ) 48-bit MAC address. 
The MAC address can be read from the PROM and displayed by typing a coomand over a serial terminal. 

If an `24AA025E` is used the IP address can also be stored in the the PROM and can be set by typing a command over a serial terminal. 

Uses the [NEO430](https://github.com/stnolting/neo430/) soft core processor.

```
ENTITY ipbus_neo430_wrapper IS
  GENERIC( 
    CLOCK_SPEED : natural := 31250000; -- clock speed. Assumed IPBus freq. of 31.25MHz
    UID_I2C_ADDR : std_logic_vector(7 downto 0) := x"53"; -- Address on I2C bus of E24AA025E
    FORCE_RARP : boolean := False -- set True to force IPBus to use RARP
    );
  PORT( 
    clk_i      : IN     std_logic;                      -- global clock, rising edge.
    rst_i      : IN     std_logic;                      -- global reset, async, active high
    uart_txd_o : OUT    std_logic;                      -- UART from NEO to host
    uart_rxd_i : IN     std_logic;                      -- from host to NEO UART
    leds       : OUT    std_logic_vector (3 DOWNTO 0);  -- status LEDs
    scl_o      : OUT    std_logic;                      -- I2C clock from NEO
    scl_i      : IN     std_logic;                      -- the actual state of the line back to NEO
    sda_o      : OUT    std_logic;                      -- I2C data from NEO
    sda_i      : IN     std_logic;
    gp_o       : OUT    std_logic_vector(15 downto 0);  -- General purpose output. Used in DUNE to define the endpoint ID
    use_rarp_o : OUT    std_logic;                      -- If high then IPBus should use RARP, not fixed IP
    ip_addr_o  : OUT    std_logic_vector(31 downto 0);  -- IP address to give to IPBus core
    mac_addr_o : OUT    std_logic_vector(47 downto 0);  -- MAC address to give to IPBus core
    ipbus_rst_o: OUT    std_logic                       -- Reset line to IPBus core
    );
```
    
### Software (on NEO430 soft core)
    
If the software running on the soft core needs to be modified then

* Install the [GCC compiler for MSP430](https://www.ti.com/tool/MSP430-GCC-OPENSOURCE) 
* edit the code under `components/neo430_wrapper/software`
* change directory to `components/neo430_wrapper/software`
* execute the following commands: 
```
make clean_all
make compile
make install
```

### Including neo430_wrapper in ipbb firmware build

The code for the `neo430` soft core is added as a sub-module. It should be automatically downloaded when the `neo430_wrapper` code is added to the project.

### Interface to soft core CPU

Communicate with soft core using UART connected to `uart_txd_{i,o}` . 19200 baud, 8N1.

Commands available:

```
 help     - show this text
 enable   - enable I2C bridge on Enclustra
 id       - Read Unique ID
 write    - write IP addr to PROM
 read     - read IP addr from PROM
 writegpo - write GPO value to PROM
 readgpo  - read GPO value from PROM
 set      - read from PROM. Set MAC and IP address
 reset    - reset CPU
```

