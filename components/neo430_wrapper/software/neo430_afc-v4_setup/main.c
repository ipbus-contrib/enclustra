// Hacked from "Wishbone Explorer" , part of the NEO430 project by S Nolting ( see below )
// David Cussans, Jan 2020

// #################################################################################################
// #  < Wishbone bus explorer >                                                                    #
// # ********************************************************************************************* #
// # Manual access to the registers of modules, which are connected to Wishbone bus. This is also  #
// # a neat example to illustrate the construction of a console-like user interface.               #
// # ********************************************************************************************* #
// # This file is part of the NEO430 Processor project: https://github.com/stnolting/neo430        #
// # Copyright by Stephan Nolting: stnolting@gmail.com                                             #
// #                                                                                               #
// # This source file may be used and distributed without restriction provided that this copyright #
// # statement is not removed from the file and that any derivative work contains the original     #
// # copyright notice and the associated disclaimer.                                               #
// #                                                                                               #
// # This source file is free software; you can redistribute it and/or modify it under the terms   #
// # of the GNU Lesser General Public License as published by the Free Software Foundation,        #
// # either version 3 of the License, or (at your option) any later version.                       #
// #                                                                                               #
// # This source is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;      #
// # without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.     #
// # See the GNU Lesser General Public License for more details.                                   #
// #                                                                                               #
// # You should have received a copy of the GNU Lesser General Public License along with this      #
// # source; if not, download it from https://www.gnu.org/licenses/lgpl-3.0.en.html                #
// # ********************************************************************************************* #
// #  Stephan Nolting, Hannover, Germany                                               06.10.2017  #
// #################################################################################################


// Libraries
#include <stdint.h>
#include <string.h>
#include "neo430_cmd_buffer.h"
#include "neo430.h"
#include "neo430_i2c.h"
#include "neo430_wishbone_mac_ip.h"
#include <stdbool.h>

// Configuration
#define BAUD_RATE 19200

uint64_t uid;
uint32_t ipAddr;
uint16_t gpo; // value to write to general purpose output
bool useRARP;

/* ------------------------------------------------------------
 * Function to read EEPROM and set MAC,IP addresses
 * ------------------------------------------------------------ */
int setMacIP(void){

  bool status;
  
    // Grab control of I2C bus
  status = set_internal_i2c_mux( false);

  enable_i2c_mux( 0x90 ); // TCA9548 I2C Mux. port 4 is the clock x-bar, port 7 is FMC #1 , port 6 is FMC #2. SO should need to write 0x90. ( 0xD0 activates both FMC 1 and 2)
	
  // first connect up reference clock and connect monitor output to port 10 (clk from MIB)
  write_xbar(10);
  
  // set IPBus reset
  neo430_wishbone_writeIPBusReset(true);

  // Then read MAC address
  uid = read_UID();
  uid = ( uid == 0 ) ? 0x020ddba11644 : uid; // if can't read UID, then set to dummy value.
  // and write to control lines
  neo430_wishbone_writeMACAddr(uid);

#if (FORCE_RARP == 0) && (FORCE_IPADDR ==0)
  // then read IP address
  ipAddr = read_Prom();
  // and write to control lines
  neo430_wishbone_writeIPAddr(ipAddr);
#endif

#if FORCE_IPADDR !=0
  neo430_wishbone_writeIPAddr(FORCE_IPADDR);
#endif


  // if the IP address is set to 255.255.255.255 or 0.0.0.0 then use RARP
  useRARP = (((ipAddr == 0xFFFFFFFF) || (ipAddr == 0) || FORCE_RARP==1 ) && FORCE_IPADDR == 0) ? true : false;
  neo430_wishbone_writeRarpFlag(useRARP);

  //  // then read the value to write to general purpose output (used for endpoint addr in DUNE)
  //gpo = read_PromGPO();
  //neo430_gpio_port_set(gpo);

  // Release I2C bus
  status = set_internal_i2c_mux( true);

  // then release IPBus reset line
  neo430_wishbone_writeIPBusReset(false);

  return 0;
}

void set_i2c_ctrl(){ // set whether NEO430 or IPBus is controlling I2C bus from FPGA

  neo430_uart_br_print("0 for NEO, 1 IPBus ");
  neo430_uart_scan(command, 2,1); // 1 character reply  '\0'

  if (!strcmp(command, "0")) {
      set_internal_i2c_mux(false);
	} else {
      set_internal_i2c_mux(true);
    }
    

}

/* ------------------------------------------------------------
 * INFO Main function
 * ------------------------------------------------------------ */
int main(void) {

  uint16_t length = 0;
  uint16_t selection = 0;

  // setup UART
  neo430_uart_setup(BAUD_RATE);
  //  USI_CT = (1<<USI_CT_EN);
 
  neo430_uart_br_print( // "\n-------------------------------------\n"
                          "- AFC Control Terminal v0.30 -\n"
                          "------------------------------\n\n");

  // check if WB unit was synthesized, exit if no WB is available
  if (!(SYS_FEATURES & (1<<SYS_WB32_EN))) {
    neo430_uart_br_print("Error! No WB");
    return 1;
  }


  // set for 32 bit transfer
  //wb_config = 4;

  // set up I2C pre-scale
  setup_i2c();

  // read EEPROM and write to IPBus IP and MAC addresses
  setMacIP();
    
  for (;;) {

    neo430_uart_br_print("\nEnter a command:> ");

    //length = uart_scan(command, MAX_CMD_LENGTH);
    length = neo430_uart_scan(command, MAX_CMD_LENGTH,1);
    neo430_uart_br_print("\n");

    if (!length) // nothing to be done
     continue;

        // decode input
    selection = 0;
    if (!strcmp(command, "help"))
      selection = 1;
    if (!strcmp(command, "enable"))
      selection = 2;
    if (!strcmp(command, "id"))
      selection = 3;
#if FORCE_RARP == 0
    if (!strcmp(command, "write"))
      selection = 4;
    if (!strcmp(command, "read"))
      selection = 5;
#endif
    if (!strcmp(command, "xbar"))
      selection = 6;
    //if (!strcmp(command, "readgpo"))
    //  selection = 7;
    if (!strcmp(command, "dump"))
      selection = 7;    
    if (!strcmp(command, "set"))
      selection = 8;
    if (!strcmp(command, "i2cmux"))
      selection = 9;
    if (!strcmp(command, "reset"))
      selection = 10;

        // execute command
    switch(selection) {

      case 1: // print help menu
        neo430_uart_br_print("Commands:\n"
                      "help  - show this text\n"
                      "enable - enable AFC I2C Mux\n"
                      "id    - Read UID\n"
#if FORCE_RARP == 0
                      "write - write IP addr to PROM\n"
                      "read  - read IP addr from PROM\n"
#endif
		      "xbar  - setup clock xbar\n"
		     //"readgpo  - read GPO value from PROM\n"
		     // "dump  - dump EEPROM\n" // comment out to save memory			     
                      "set   - Set MAC+IP addr from PROM\n"
		      "i2cmux\n"
                      "reset  - reset CPU\n"
                      );
        break;

      case 2: // Enable I2C Mux
	     
	enable_i2c_mux( 0xF0 ); // TCA9548 I2C Mux. port 4 is the clock x-bar, port 7 is FMC #1 , port 6 is FMC #2. SO should need to write 0x90. ( 0xD0 activates both FMC 1 and 2) 
        break;

      case 3: // read from Unique ID address
	uid = read_UID();
	print_MAC_address(uid);
        break;

#if FORCE_RARP == 0
      case 4: // write to PROM
	     write_Prom();
        break;

      case 5: // read from PROM
	     ipAddr = read_Prom();
	     print_IP_address(ipAddr);
	     break;
#endif

      case 6: // configure clock cross-bar on AFC
	
	neo430_uart_br_print("Enter x-bar mon port (hex)\n");
	neo430_uart_scan(command, 2,1); // 2 hex chars for address plus '\0'
	uint8_t data = hex_str_to_uint8(command);
	write_xbar(data);
	break;
	     
      case 7:  // dump entire contents of PROM
	// dump_Prom(); // ditch to save space
	break;
	
      case 8: // set MAC , IP address , RARP flag
        setMacIP();
        break;

      case 9:  // select between NEO and IPBus for I2C control
	set_i2c_ctrl();
	break;
	
      case 10: // restart
	while ((UART_CT & (1<<UART_CT_TX_BUSY)) != 0); // wait for current UART transmission
        neo430_soft_reset();
        break;

      default: // invalid command
        neo430_uart_br_print("bad cmd. 'help' for list.\n");
        break;
    }
    


  }
     return 0;
}

