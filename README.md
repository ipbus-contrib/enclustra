# Enclustra PM3+AX3

This repository contains firmware designed to work with the IPBus firmware system ( see github.com/ipbus )
It implements an IPBus master on an Enclustra PM3+AX3 combination. Optionally, the MAC and IP addresses can be retrived from PROM

This firmware is supported on
a best-effort basis, and is provided on an "AS IS" BASIS, WITHOUT
WARRANTY OF ANY KIND, either express or implied, including, without
limitation, any warranties or conditions of TITLE, NON-INFRINGEMENT,
MERCHANTABILITY, or FITNESS FOR A PARTICULAR PURPOSE.

### How do I get set up? ###

The master firmware uses the [ipbb](https://github.com/ipbus/ipbb) build tool, and requires the ipbus system firmware.

The following example procedure should build an example bitfile for the Enclustra AX3 module mounted on a PM3 base board.

Note that a reasonably up-to-date operating system (e.g. Centos7) is required.    

If you are going to build on a computer outside of the CERN network, then you will need to run kerberos (kinit username@CERN.CH)).

These instructions assume that you have your Xilinx Vivado licensing already setup for your environment and have a licence for the Xilinx tri-mode Gigabit Ethernet core.

These instructions have been tested with Vivado 2020.2

	mkdir work
	cd work
	curl -L https://github.com/ipbus/ipbb/archive/dev/2021i.tar.gz | tar xvz
	source ipbb-dev-2021i/env.sh 
	ipbb init build
	cd build

	ipbb add git https://github.com/ipbus/ipbus-firmware.git -b  v1.9
	ipbb add git git@github.com:ipbus-contrib/enclustra.git 
	
	# These next steps compile the software running on the neo430. 
        # Don't need to recompile if using a FMC with E24AA025E4 at I2C address 0x53
	# (or you have changed the source *.c code.)
	# You will need msp430-gcc installed for this.
	pushd src/enclustra/components/neo430_wrapper/software/neo430_ipbus_address_terminal/
	make clean_all 
	make install 
	#
	# To build for AT24C256 (or similar) that needs two address bytes written to address a memory location:
	# and has MAC(UID) stored at addrfess 0x10
	# make install CFLAGS="-DPROMUIDADDR=0x10 -DPROMNADDRBYTES=2"
	#
	# To force RARP:
	# make install CFLAGS="-DFORCE_RARP=1"

	popd

	# Create IPBB project....

	# This example assumes an AX3 with Artix 35 and an E24AA025E4 EEPROM at I2C address 0x53 (e.g. on pc053 FMC)  connected to uid_scl , uid_sda lines 
	ipbb proj create vivado top_a35-macprom-example enclustra:projects/example top_enclustra_ax3_pm3_a35_macprom.dep
	
	# This example uses a fixed IP ( no NEO430 core)
	# ipbb proj create vivado top_a35-example enclustra:projects/example top_enclustra_ax3_pm3_a35.dep

	cd proj/top_a35-macprom-example-macprom
	ipbb vivado generate-project
	ipbb vivado impl
	ipbb vivado bitfile
	ipbb vivago memcfg
	ipbb vivado package
	deactivate

### Which Components Do I Use in My Design ? ###

This repository contains a version of the IPBus infrastructure block that reads MAC and IP address from PROM : [enclustra_ax3_pm3_infra.vhd](boards/enclustra_ax3_pm3/synth/firmware/hdl/enclustra_ax3_pm3_infra.vhd) . The ports are described in a [README.md](boards/enclustra_ax3_pm3/synth/firmware/hdl/README.md)

Inside [enclustra_ax3_pm3_infra.vhd](boards/enclustra_ax3_pm3/synth/firmware/hdl/enclustra_ax3_pm3_infra.vhd) there is a wrapper around the NEO430 soft core microprocessor. To use static IP set generic `USE_NEO430` to `True`

### Who do I talk to? ###

* David Cussans (david.cussans@bristol.ac.uk)
* Dave Newbold (dave.newbold@cern.ch)
* Alessandro Thea (alessandro.thea@cern.ch)

