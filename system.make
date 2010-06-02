#################################################################
# Makefile generated by Xilinx Platform Studio 
# Project:/home/aalonso/workspace/ppc44x/xilinx-ml507-updated/system.xmp
#
# WARNING : This file will be re-generated every time a command
# to run a make target is invoked. So, any changes made to this  
# file manually, will be lost when make is invoked next. 
#################################################################

# Name of the Microprocessor system
# The hardware specification of the system is in file :
# /home/aalonso/workspace/ppc44x/xilinx-ml507-updated/system.mhs
# The software specification of the system is in file :
# /home/aalonso/workspace/ppc44x/xilinx-ml507-updated/system.mss

include system_incl.make

#################################################################
# PHONY TARGETS
#################################################################
.PHONY: dummy
.PHONY: netlistclean
.PHONY: bitsclean
.PHONY: simclean
.PHONY: exporttosdk

#################################################################
# EXTERNAL TARGETS
#################################################################
all:
	@echo "Makefile to build a Microprocessor system :"
	@echo "Run make with any of the following targets"
	@echo " "
	@echo "  netlist  : Generates the netlist for the given MHS "
	@echo "  bits     : Runs Implementation tools to generate the bitstream"
	@echo "  exporttosdk: Export files to SDK"
	@echo " "
	@echo "  libs     : Configures the sw libraries for this system"
	@echo "  program  : Compiles the program sources for all the processor instances"
	@echo " "
	@echo "  init_bram: Initializes bitstream with BRAM data"
	@echo "  ace      : Generate ace file from bitstream and elf"
	@echo "  download : Downloads the bitstream onto the board"
	@echo " "
	@echo "  sim      : Generates HDL simulation models and runs simulator for chosen simulation mode"
	@echo "  simmodel : Generates HDL simulation models for chosen simulation mode"
	@echo "  behavioral_model : Generates behavioral HDL models with BRAM initialization"
	@echo "  structural_model : Generates structural simulation HDL models with BRAM initialization"
	@echo "  timing   : Generates timing simulation HDL models with BRAM initialization"
	@echo " "
	@echo "  netlistclean: Deletes netlist"
	@echo "  bitsclean: Deletes bit, ncd, bmm files"
	@echo "  hwclean  : Deletes implementation dir"
	@echo "  libsclean: Deletes sw libraries"
	@echo "  programclean: Deletes compiled ELF files"
	@echo "  swclean  : Deletes sw libraries and ELF files"
	@echo "  simclean : Deletes simulation dir"
	@echo "  clean    : Deletes all generated files/directories"
	@echo " "
	@echo "  make <target> : (Default)"
	@echo "      Creates a Microprocessor system using default initializations"
	@echo "      specified for each processor in MSS file"


bits: $(SYSTEM_BIT)

ace: $(SYSTEM_ACE)

exporttosdk: $(SYSTEM_HW_HANDOFF_DEP)

netlist: $(POSTSYN_NETLIST)

libs: $(LIBRARIES)

program: $(ALL_USER_ELF_FILES)

download: $(DOWNLOAD_BIT) dummy
	@echo "*********************************************"
	@echo "Downloading Bitstream onto the target board"
	@echo "*********************************************"
	impact -batch etc/download.cmd

init_bram: $(DOWNLOAD_BIT)

sim: $(DEFAULT_SIM_SCRIPT)
	cd simulation/behavioral; \
	$(SIM_CMD) -gui -do $(^F) &

simmodel: $(DEFAULT_SIM_SCRIPT)

behavioral_model: $(BEHAVIORAL_SIM_SCRIPT)

structural_model: $(STRUCTURAL_SIM_SCRIPT)

clean: hwclean swclean simclean
	rm -f _impact.cmd

hwclean: netlistclean bitsclean
	rm -rf implementation synthesis xst hdl
	rm -rf xst.srp $(SYSTEM).srp
	rm -f __xps/ise/_xmsgs/bitinit.xmsgs

netlistclean:
	rm -f $(POSTSYN_NETLIST)
	rm -f platgen.log
	rm -f __xps/ise/_xmsgs/platgen.xmsgs
	rm -f $(BMM_FILE)

bitsclean:
	rm -f $(SYSTEM_BIT)
	rm -f implementation/$(SYSTEM).ncd
	rm -f implementation/$(SYSTEM)_bd.bmm 
	rm -f implementation/$(SYSTEM)_map.ncd 
	rm -f __xps/$(SYSTEM)_routed

simclean: 
	rm -rf simulation/behavioral
	rm -f simgen.log
	rm -f __xps/ise/_xmsgs/simgen.xmsgs

swclean: libsclean programclean

libsclean: $(LIBSCLEAN_TARGETS)
	rm -f libgen.log
	rm -f __xps/ise/_xmsgs/libgen.xmsgs

programclean: $(PROGRAMCLEAN_TARGETS)

#################################################################
# SOFTWARE PLATFORM FLOW
#################################################################


$(LIBRARIES): $(MHSFILE) $(MSSFILE) __xps/libgen.opt
	@echo "*********************************************"
	@echo "Creating software libraries..."
	@echo "*********************************************"
	libgen $(LIBGEN_OPTIONS) $(MSSFILE)


ppc440_0_libsclean:
	rm -rf ppc440_0/

#################################################################
# SOFTWARE APPLICATION TESTAPP_MEMORY_PPC440_0
#################################################################

TestApp_Memory_ppc440_0_program: $(TESTAPP_MEMORY_PPC440_0_OUTPUT) 

$(TESTAPP_MEMORY_PPC440_0_OUTPUT) : $(TESTAPP_MEMORY_PPC440_0_SOURCES) $(TESTAPP_MEMORY_PPC440_0_HEADERS) $(TESTAPP_MEMORY_PPC440_0_LINKER_SCRIPT) \
                    $(LIBRARIES) __xps/testapp_memory_ppc440_0_compiler.opt
	@mkdir -p $(TESTAPP_MEMORY_PPC440_0_OUTPUT_DIR) 
	$(TESTAPP_MEMORY_PPC440_0_CC) $(TESTAPP_MEMORY_PPC440_0_CC_OPT) $(TESTAPP_MEMORY_PPC440_0_SOURCES) -o $(TESTAPP_MEMORY_PPC440_0_OUTPUT) \
	$(TESTAPP_MEMORY_PPC440_0_OTHER_CC_FLAGS) $(TESTAPP_MEMORY_PPC440_0_INCLUDES) $(TESTAPP_MEMORY_PPC440_0_LIBPATH) \
	$(TESTAPP_MEMORY_PPC440_0_CFLAGS) $(TESTAPP_MEMORY_PPC440_0_LFLAGS) 
	$(TESTAPP_MEMORY_PPC440_0_CC_SIZE) $(TESTAPP_MEMORY_PPC440_0_OUTPUT) 
	@echo ""

TestApp_Memory_ppc440_0_programclean:
	rm -f $(TESTAPP_MEMORY_PPC440_0_OUTPUT) 

#################################################################
# SOFTWARE APPLICATION TESTAPP_PERIPHERAL_PPC440_0
#################################################################

TestApp_Peripheral_ppc440_0_program: $(TESTAPP_PERIPHERAL_PPC440_0_OUTPUT) 

$(TESTAPP_PERIPHERAL_PPC440_0_OUTPUT) : $(TESTAPP_PERIPHERAL_PPC440_0_SOURCES) $(TESTAPP_PERIPHERAL_PPC440_0_HEADERS) $(TESTAPP_PERIPHERAL_PPC440_0_LINKER_SCRIPT) \
                    $(LIBRARIES) __xps/testapp_peripheral_ppc440_0_compiler.opt
	@mkdir -p $(TESTAPP_PERIPHERAL_PPC440_0_OUTPUT_DIR) 
	$(TESTAPP_PERIPHERAL_PPC440_0_CC) $(TESTAPP_PERIPHERAL_PPC440_0_CC_OPT) $(TESTAPP_PERIPHERAL_PPC440_0_SOURCES) -o $(TESTAPP_PERIPHERAL_PPC440_0_OUTPUT) \
	$(TESTAPP_PERIPHERAL_PPC440_0_OTHER_CC_FLAGS) $(TESTAPP_PERIPHERAL_PPC440_0_INCLUDES) $(TESTAPP_PERIPHERAL_PPC440_0_LIBPATH) \
	$(TESTAPP_PERIPHERAL_PPC440_0_CFLAGS) $(TESTAPP_PERIPHERAL_PPC440_0_LFLAGS) 
	$(TESTAPP_PERIPHERAL_PPC440_0_CC_SIZE) $(TESTAPP_PERIPHERAL_PPC440_0_OUTPUT) 
	@echo ""

TestApp_Peripheral_ppc440_0_programclean:
	rm -f $(TESTAPP_PERIPHERAL_PPC440_0_OUTPUT) 

#################################################################
# SOFTWARE APPLICATION TESTAPP_PERIPHERAL_PPC440_0_TFT
#################################################################

TestApp_Peripheral_ppc440_0_tft_program: $(TESTAPP_PERIPHERAL_PPC440_0_TFT_OUTPUT) 

$(TESTAPP_PERIPHERAL_PPC440_0_TFT_OUTPUT) : $(TESTAPP_PERIPHERAL_PPC440_0_TFT_SOURCES) $(TESTAPP_PERIPHERAL_PPC440_0_TFT_HEADERS) $(TESTAPP_PERIPHERAL_PPC440_0_TFT_LINKER_SCRIPT) \
                    $(LIBRARIES) __xps/testapp_peripheral_ppc440_0_tft_compiler.opt
	@mkdir -p $(TESTAPP_PERIPHERAL_PPC440_0_TFT_OUTPUT_DIR) 
	$(TESTAPP_PERIPHERAL_PPC440_0_TFT_CC) $(TESTAPP_PERIPHERAL_PPC440_0_TFT_CC_OPT) $(TESTAPP_PERIPHERAL_PPC440_0_TFT_SOURCES) -o $(TESTAPP_PERIPHERAL_PPC440_0_TFT_OUTPUT) \
	$(TESTAPP_PERIPHERAL_PPC440_0_TFT_OTHER_CC_FLAGS) $(TESTAPP_PERIPHERAL_PPC440_0_TFT_INCLUDES) $(TESTAPP_PERIPHERAL_PPC440_0_TFT_LIBPATH) \
	$(TESTAPP_PERIPHERAL_PPC440_0_TFT_CFLAGS) $(TESTAPP_PERIPHERAL_PPC440_0_TFT_LFLAGS) 
	$(TESTAPP_PERIPHERAL_PPC440_0_TFT_CC_SIZE) $(TESTAPP_PERIPHERAL_PPC440_0_TFT_OUTPUT) 
	@echo ""

TestApp_Peripheral_ppc440_0_tft_programclean:
	rm -f $(TESTAPP_PERIPHERAL_PPC440_0_TFT_OUTPUT) 

#################################################################
# SOFTWARE APPLICATION TESTAPP_PERIPHERAL_WB_ENCODER
#################################################################

TestApp_Peripheral_wb_encoder_program: $(TESTAPP_PERIPHERAL_WB_ENCODER_OUTPUT) 

$(TESTAPP_PERIPHERAL_WB_ENCODER_OUTPUT) : 
	@echo "Sw App TestApp_Peripheral_wb_encoder: Neither C-sources specified, nor marked for BRAM initialization. Not compiling elf file"

#################################################################
# BOOTLOOP ELF FILES
#################################################################



$(PPC440_0_BOOTLOOP): $(PPC440_BOOTLOOP)
	@mkdir -p $(BOOTLOOP_DIR)
	cp -f $(PPC440_BOOTLOOP) $(PPC440_0_BOOTLOOP)

#################################################################
# HARDWARE IMPLEMENTATION FLOW
#################################################################


$(BMM_FILE) \
$(WRAPPER_NGC_FILES): $(MHSFILE) __xps/platgen.opt \
                      $(CORE_STATE_DEVELOPMENT_FILES)
	@echo "****************************************************"
	@echo "Creating system netlist for hardware specification.."
	@echo "****************************************************"
	platgen $(PLATGEN_OPTIONS) $(MHSFILE)

$(POSTSYN_NETLIST): $(WRAPPER_NGC_FILES)
	@echo "Running synthesis..."
	bash -c "cd synthesis; ./synthesis.sh"

__xps/$(SYSTEM)_routed: $(FPGA_IMP_DEPENDENCY)
	@echo "*********************************************"
	@echo "Running Xilinx Implementation tools.."
	@echo "*********************************************"
	@cp -f $(UCF_FILE) implementation/$(SYSTEM).ucf
	@cp -f etc/fast_runtime.opt implementation/xflow.opt
	xflow -wd implementation -p $(DEVICE) -implement xflow.opt $(SYSTEM).ngc
	touch __xps/$(SYSTEM)_routed

$(SYSTEM_BIT): __xps/$(SYSTEM)_routed $(BITGEN_UT_FILE)
	xilperl $(NON_CYG_XILINX_EDK_DIR)/data/fpga_impl/observe_par.pl $(OBSERVE_PAR_OPTIONS) implementation/$(SYSTEM).par
	@echo "*********************************************"
	@echo "Running Bitgen.."
	@echo "*********************************************"
	@cp -f $(BITGEN_UT_FILE) implementation/bitgen.ut
	cd implementation; bitgen -w -f bitgen.ut $(SYSTEM); cd ..

$(DOWNLOAD_BIT): $(SYSTEM_BIT) $(BRAMINIT_ELF_FILES) __xps/bitinit.opt
	@cp -f implementation/$(SYSTEM)_bd.bmm .
	@echo "*********************************************"
	@echo "Initializing BRAM contents of the bitstream"
	@echo "*********************************************"
	bitinit -p $(DEVICE) $(MHSFILE) $(SEARCHPATHOPT) $(BRAMINIT_ELF_FILE_ARGS) \
	-bt $(SYSTEM_BIT) -o $(DOWNLOAD_BIT)
	@rm -f $(SYSTEM)_bd.bmm

$(SYSTEM_ACE): $(DOWNLOAD_BIT) $(TESTAPP_MEMORY_PPC440_0_OUTPUT) $(TESTAPP_PERIPHERAL_PPC440_0_OUTPUT) $(TESTAPP_PERIPHERAL_PPC440_0_TFT_OUTPUT) $(TESTAPP_PERIPHERAL_WB_ENCODER_OUTPUT) 
	@echo "*********************************************"
	@echo "Creating system ace file"
	@echo "*********************************************"
	xmd -tcl genace.tcl -jprog -hw $(DOWNLOAD_BIT) -elf $(TESTAPP_MEMORY_PPC440_0_OUTPUT) $(TESTAPP_PERIPHERAL_PPC440_0_OUTPUT) $(TESTAPP_PERIPHERAL_PPC440_0_TFT_OUTPUT) $(TESTAPP_PERIPHERAL_WB_ENCODER_OUTPUT)  -target ppc_hw  -ace $(SYSTEM_ACE)

#################################################################
# EXPORT_TO_SDK FLOW
#################################################################


$(CYG_SYSTEM_HW_HANDOFF): $(MHSFILE) __xps/platgen.opt
	mkdir -p $(SDK_EXPORT_DIR)
	psf2Edward -inp $(SYSTEM).xmp -edwver 1.2 -xml $(SDK_EXPORT_DIR)/$(SYSTEM).xml $(GLOBAL_SEARCHPATHOPT)
	xdsgen -inp $(SYSTEM).xmp -report $(SDK_EXPORT_DIR)/$(SYSTEM).html $(GLOBAL_SEARCHPATHOPT) -make_docs_local

$(CYG_SYSTEM_HW_HANDOFF_BIT): $(SYSTEM_BIT)
	@rm -rf $(SYSTEM_HW_HANDOFF_BIT)
	@cp -f $(SYSTEM_BIT) $(SDK_EXPORT_DIR)/

$(CYG_SYSTEM_HW_HANDOFF_BMM): implementation/$(SYSTEM)_bd.bmm
	@rm -rf $(SYSTEM_HW_HANDOFF_BMM)
	@cp -f implementation/$(SYSTEM)_bd.bmm $(SDK_EXPORT_DIR)/

#################################################################
# SIMULATION FLOW
#################################################################


################## BEHAVIORAL SIMULATION ##################

$(BEHAVIORAL_SIM_SCRIPT): $(MHSFILE) __xps/simgen.opt \
                          $(WRAPPER_NGC_FILES) \
                          $(BRAMINIT_ELF_FILES)
	@echo "*********************************************"
	@echo "Creating behavioral simulation models..."
	@echo "*********************************************"
	simgen $(SIMGEN_OPTIONS) -m behavioral $(MHSFILE)

################## STRUCTURAL SIMULATION ##################

$(STRUCTURAL_SIM_SCRIPT): $(WRAPPER_NGC_FILES) __xps/simgen.opt \
                          $(BRAMINIT_ELF_FILES)
	@echo "*********************************************"
	@echo "Creating structural simulation models..."
	@echo "*********************************************"
	simgen $(SIMGEN_OPTIONS) -sd implementation -m structural $(MHSFILE)


################## TIMING SIMULATION ##################

implementation/$(SYSTEM).ncd: __xps/$(SYSTEM)_routed

$(TIMING_SIM_SCRIPT): implementation/$(SYSTEM).ncd __xps/simgen.opt \
                      $(BRAMINIT_ELF_FILES)
	@echo "*********************************************"
	@echo "Creating timing simulation models..."
	@echo "*********************************************"
	simgen $(SIMGEN_OPTIONS) -sd implementation -m timing $(MHSFILE)

dummy:
	@echo ""

