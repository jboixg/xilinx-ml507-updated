-------------------------------------------------------------------------------
-- system.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity system is
  port (
    fpga_0_RS232_Uart_1_RX_pin : in std_logic;
    fpga_0_RS232_Uart_1_TX_pin : out std_logic;
    fpga_0_LEDs_8Bit_GPIO_IO_pin : inout std_logic_vector(0 to 7);
    fpga_0_LEDs_Positions_GPIO_IO_pin : inout std_logic_vector(0 to 4);
    fpga_0_Push_Buttons_5Bit_GPIO_IO_pin : inout std_logic_vector(0 to 4);
    fpga_0_DIP_Switches_8Bit_GPIO_IO_pin : inout std_logic_vector(0 to 7);
    fpga_0_IIC_EEPROM_Sda_pin : inout std_logic;
    fpga_0_IIC_EEPROM_Scl_pin : inout std_logic;
    fpga_0_Ethernet_MAC_PHY_tx_clk_pin : in std_logic;
    fpga_0_Ethernet_MAC_PHY_rx_clk_pin : in std_logic;
    fpga_0_Ethernet_MAC_PHY_crs_pin : in std_logic;
    fpga_0_Ethernet_MAC_PHY_dv_pin : in std_logic;
    fpga_0_Ethernet_MAC_PHY_rx_data_pin : in std_logic_vector(3 downto 0);
    fpga_0_Ethernet_MAC_PHY_col_pin : in std_logic;
    fpga_0_Ethernet_MAC_PHY_rx_er_pin : in std_logic;
    fpga_0_Ethernet_MAC_PHY_rst_n_pin : out std_logic;
    fpga_0_Ethernet_MAC_PHY_tx_en_pin : out std_logic;
    fpga_0_Ethernet_MAC_PHY_tx_data_pin : out std_logic_vector(3 downto 0);
    fpga_0_Ethernet_MAC_PHY_MDC_pin : out std_logic;
    fpga_0_Ethernet_MAC_PHY_MDIO_pin : inout std_logic;
    fpga_0_Ethernet_MAC_MDINT_pin : in std_logic;
    fpga_0_DDR2_SDRAM_DDR2_DQ_pin : inout std_logic_vector(63 downto 0);
    fpga_0_DDR2_SDRAM_DDR2_DQS_pin : inout std_logic_vector(7 downto 0);
    fpga_0_DDR2_SDRAM_DDR2_DQS_N_pin : inout std_logic_vector(7 downto 0);
    fpga_0_DDR2_SDRAM_DDR2_A_pin : out std_logic_vector(12 downto 0);
    fpga_0_DDR2_SDRAM_DDR2_BA_pin : out std_logic_vector(1 downto 0);
    fpga_0_DDR2_SDRAM_DDR2_RAS_N_pin : out std_logic;
    fpga_0_DDR2_SDRAM_DDR2_CAS_N_pin : out std_logic;
    fpga_0_DDR2_SDRAM_DDR2_WE_N_pin : out std_logic;
    fpga_0_DDR2_SDRAM_DDR2_CS_N_pin : out std_logic;
    fpga_0_DDR2_SDRAM_DDR2_ODT_pin : out std_logic_vector(1 downto 0);
    fpga_0_DDR2_SDRAM_DDR2_CKE_pin : out std_logic;
    fpga_0_DDR2_SDRAM_DDR2_DM_pin : out std_logic_vector(7 downto 0);
    fpga_0_DDR2_SDRAM_DDR2_CK_pin : out std_logic_vector(1 downto 0);
    fpga_0_DDR2_SDRAM_DDR2_CK_N_pin : out std_logic_vector(1 downto 0);
    fpga_0_SysACE_CompactFlash_SysACE_MPA_pin : out std_logic_vector(6 downto 0);
    fpga_0_SysACE_CompactFlash_SysACE_CLK_pin : in std_logic;
    fpga_0_SysACE_CompactFlash_SysACE_MPIRQ_pin : in std_logic;
    fpga_0_SysACE_CompactFlash_SysACE_CEN_pin : out std_logic;
    fpga_0_SysACE_CompactFlash_SysACE_OEN_pin : out std_logic;
    fpga_0_SysACE_CompactFlash_SysACE_WEN_pin : out std_logic;
    fpga_0_SysACE_CompactFlash_SysACE_MPD_pin : inout std_logic_vector(15 downto 0);
    fpga_0_FLASH_Mem_A_pin : out std_logic_vector(7 to 30);
    fpga_0_FLASH_Mem_CEN_pin : out std_logic;
    fpga_0_FLASH_Mem_OEN_pin : out std_logic;
    fpga_0_FLASH_Mem_WEN_pin : out std_logic;
    fpga_0_FLASH_Mem_ADV_LDN_pin : out std_logic;
    fpga_0_FLASH_Mem_DQ_pin : inout std_logic_vector(0 to 15);
    fpga_0_clk_1_sys_clk_pin : in std_logic;
    fpga_0_rst_1_sys_rst_pin : in std_logic;
    xps_tft_0_TFT_IIC_SDA : inout std_logic;
    xps_tft_0_TFT_HSYNC_pin : out std_logic;
    xps_tft_0_TFT_DVI_CLK_N_pin : out std_logic;
    xps_tft_0_TFT_DVI_DATA_pin : out std_logic_vector(11 downto 0);
    xps_tft_0_TFT_DE_pin : out std_logic;
    xps_tft_0_TFT_VSYNC_pin : out std_logic;
    xps_tft_0_TFT_DVI_CLK_P_pin : out std_logic;
    xps_tft_0_TFT_IIC_SCL : inout std_logic;
    xps_tft_0_TFT_RESET_pin : out std_logic;
    xps_ps2_0_PS2_1_CLK : inout std_logic;
    xps_ps2_0_PS2_2_DATA : inout std_logic;
    xps_ps2_0_PS2_2_CLK : inout std_logic;
    xps_ps2_0_PS2_1_DATA : inout std_logic
  );
end system;

architecture STRUCTURE of system is

  component ppc440_0_wrapper is
    port (
      CPMC440CLK : in std_logic;
      CPMC440CLKEN : in std_logic;
      CPMINTERCONNECTCLK : in std_logic;
      CPMINTERCONNECTCLKEN : in std_logic;
      CPMINTERCONNECTCLKNTO1 : in std_logic;
      CPMC440CORECLOCKINACTIVE : in std_logic;
      CPMC440TIMERCLOCK : in std_logic;
      C440MACHINECHECK : out std_logic;
      C440CPMCORESLEEPREQ : out std_logic;
      C440CPMDECIRPTREQ : out std_logic;
      C440CPMFITIRPTREQ : out std_logic;
      C440CPMMSRCE : out std_logic;
      C440CPMMSREE : out std_logic;
      C440CPMTIMERRESETREQ : out std_logic;
      C440CPMWDIRPTREQ : out std_logic;
      PPCCPMINTERCONNECTBUSY : out std_logic;
      DBGC440DEBUGHALT : in std_logic;
      DBGC440DEBUGHALTNEG : in std_logic;
      DBGC440SYSTEMSTATUS : in std_logic_vector(0 to 4);
      DBGC440UNCONDDEBUGEVENT : in std_logic;
      C440DBGSYSTEMCONTROL : out std_logic_vector(0 to 7);
      SPLB0_Error : out std_logic_vector(0 to 3);
      SPLB1_Error : out std_logic_vector(0 to 3);
      EICC440CRITIRQ : in std_logic;
      EICC440EXTIRQ : in std_logic;
      PPCEICINTERCONNECTIRQ : out std_logic;
      CPMDCRCLK : in std_logic;
      DCRPPCDMACK : in std_logic;
      DCRPPCDMDBUSIN : in std_logic_vector(0 to 31);
      DCRPPCDMTIMEOUTWAIT : in std_logic;
      PPCDMDCRREAD : out std_logic;
      PPCDMDCRWRITE : out std_logic;
      PPCDMDCRABUS : out std_logic_vector(0 to 9);
      PPCDMDCRDBUSOUT : out std_logic_vector(0 to 31);
      DCRPPCDSREAD : in std_logic;
      DCRPPCDSWRITE : in std_logic;
      DCRPPCDSABUS : in std_logic_vector(0 to 9);
      DCRPPCDSDBUSOUT : in std_logic_vector(0 to 31);
      PPCDSDCRACK : out std_logic;
      PPCDSDCRDBUSIN : out std_logic_vector(0 to 31);
      PPCDSDCRTIMEOUTWAIT : out std_logic;
      CPMFCMCLK : in std_logic;
      FCMAPUCR : in std_logic_vector(0 to 3);
      FCMAPUDONE : in std_logic;
      FCMAPUEXCEPTION : in std_logic;
      FCMAPUFPSCRFEX : in std_logic;
      FCMAPURESULT : in std_logic_vector(0 to 31);
      FCMAPURESULTVALID : in std_logic;
      FCMAPUSLEEPNOTREADY : in std_logic;
      FCMAPUCONFIRMINSTR : in std_logic;
      FCMAPUSTOREDATA : in std_logic_vector(0 to 127);
      APUFCMDECNONAUTON : out std_logic;
      APUFCMDECFPUOP : out std_logic;
      APUFCMDECLDSTXFERSIZE : out std_logic_vector(0 to 2);
      APUFCMDECLOAD : out std_logic;
      APUFCMNEXTINSTRREADY : out std_logic;
      APUFCMDECSTORE : out std_logic;
      APUFCMDECUDI : out std_logic_vector(0 to 3);
      APUFCMDECUDIVALID : out std_logic;
      APUFCMENDIAN : out std_logic;
      APUFCMFLUSH : out std_logic;
      APUFCMINSTRUCTION : out std_logic_vector(0 to 31);
      APUFCMINSTRVALID : out std_logic;
      APUFCMLOADBYTEADDR : out std_logic_vector(0 to 3);
      APUFCMLOADDATA : out std_logic_vector(0 to 127);
      APUFCMLOADDVALID : out std_logic;
      APUFCMOPERANDVALID : out std_logic;
      APUFCMRADATA : out std_logic_vector(0 to 31);
      APUFCMRBDATA : out std_logic_vector(0 to 31);
      APUFCMWRITEBACKOK : out std_logic;
      APUFCMMSRFE0 : out std_logic;
      APUFCMMSRFE1 : out std_logic;
      JTGC440TCK : in std_logic;
      JTGC440TDI : in std_logic;
      JTGC440TMS : in std_logic;
      JTGC440TRSTNEG : in std_logic;
      C440JTGTDO : out std_logic;
      C440JTGTDOEN : out std_logic;
      CPMMCCLK : in std_logic;
      MCMIREADDATA : in std_logic_vector(0 to 127);
      MCMIREADDATAVALID : in std_logic;
      MCMIREADDATAERR : in std_logic;
      MCMIADDRREADYTOACCEPT : in std_logic;
      MIMCREADNOTWRITE : out std_logic;
      MIMCADDRESS : out std_logic_vector(0 to 35);
      MIMCADDRESSVALID : out std_logic;
      MIMCWRITEDATA : out std_logic_vector(0 to 127);
      MIMCWRITEDATAVALID : out std_logic;
      MIMCBYTEENABLE : out std_logic_vector(0 to 15);
      MIMCBANKCONFLICT : out std_logic;
      MIMCROWCONFLICT : out std_logic;
      CPMPPCMPLBCLK : in std_logic;
      PLBPPCMMBUSY : in std_logic;
      PLBPPCMMIRQ : in std_logic;
      PLBPPCMMRDERR : in std_logic;
      PLBPPCMMWRERR : in std_logic;
      PLBPPCMADDRACK : in std_logic;
      PLBPPCMRDBTERM : in std_logic;
      PLBPPCMRDDACK : in std_logic;
      PLBPPCMRDDBUS : in std_logic_vector(0 to 127);
      PLBPPCMRDWDADDR : in std_logic_vector(0 to 3);
      PLBPPCMREARBITRATE : in std_logic;
      PLBPPCMSSIZE : in std_logic_vector(0 to 1);
      PLBPPCMTIMEOUT : in std_logic;
      PLBPPCMWRBTERM : in std_logic;
      PLBPPCMWRDACK : in std_logic;
      PLBPPCMRDPENDPRI : in std_logic_vector(0 to 1);
      PLBPPCMRDPENDREQ : in std_logic;
      PLBPPCMREQPRI : in std_logic_vector(0 to 1);
      PLBPPCMWRPENDPRI : in std_logic_vector(0 to 1);
      PLBPPCMWRPENDREQ : in std_logic;
      PPCMPLBABORT : out std_logic;
      PPCMPLBABUS : out std_logic_vector(0 to 31);
      PPCMPLBBE : out std_logic_vector(0 to 15);
      PPCMPLBBUSLOCK : out std_logic;
      PPCMPLBLOCKERR : out std_logic;
      PPCMPLBMSIZE : out std_logic_vector(0 to 1);
      PPCMPLBPRIORITY : out std_logic_vector(0 to 1);
      PPCMPLBRDBURST : out std_logic;
      PPCMPLBREQUEST : out std_logic;
      PPCMPLBRNW : out std_logic;
      PPCMPLBSIZE : out std_logic_vector(0 to 3);
      PPCMPLBTATTRIBUTE : out std_logic_vector(0 to 15);
      PPCMPLBTYPE : out std_logic_vector(0 to 2);
      PPCMPLBUABUS : out std_logic_vector(0 to 31);
      PPCMPLBWRBURST : out std_logic;
      PPCMPLBWRDBUS : out std_logic_vector(0 to 127);
      CPMPPCS0PLBCLK : in std_logic;
      PLBPPCS0MASTERID : in std_logic_vector(0 to 0);
      PLBPPCS0PAVALID : in std_logic;
      PLBPPCS0SAVALID : in std_logic;
      PLBPPCS0RDPENDREQ : in std_logic;
      PLBPPCS0WRPENDREQ : in std_logic;
      PLBPPCS0RDPENDPRI : in std_logic_vector(0 to 1);
      PLBPPCS0WRPENDPRI : in std_logic_vector(0 to 1);
      PLBPPCS0REQPRI : in std_logic_vector(0 to 1);
      PLBPPCS0RDPRIM : in std_logic;
      PLBPPCS0WRPRIM : in std_logic;
      PLBPPCS0BUSLOCK : in std_logic;
      PLBPPCS0ABORT : in std_logic;
      PLBPPCS0RNW : in std_logic;
      PLBPPCS0BE : in std_logic_vector(0 to 15);
      PLBPPCS0SIZE : in std_logic_vector(0 to 3);
      PLBPPCS0TYPE : in std_logic_vector(0 to 2);
      PLBPPCS0TATTRIBUTE : in std_logic_vector(0 to 15);
      PLBPPCS0LOCKERR : in std_logic;
      PLBPPCS0MSIZE : in std_logic_vector(0 to 1);
      PLBPPCS0UABUS : in std_logic_vector(0 to 31);
      PLBPPCS0ABUS : in std_logic_vector(0 to 31);
      PLBPPCS0WRDBUS : in std_logic_vector(0 to 127);
      PLBPPCS0WRBURST : in std_logic;
      PLBPPCS0RDBURST : in std_logic;
      PPCS0PLBADDRACK : out std_logic;
      PPCS0PLBWAIT : out std_logic;
      PPCS0PLBREARBITRATE : out std_logic;
      PPCS0PLBWRDACK : out std_logic;
      PPCS0PLBWRCOMP : out std_logic;
      PPCS0PLBRDDBUS : out std_logic_vector(0 to 127);
      PPCS0PLBRDWDADDR : out std_logic_vector(0 to 3);
      PPCS0PLBRDDACK : out std_logic;
      PPCS0PLBRDCOMP : out std_logic;
      PPCS0PLBRDBTERM : out std_logic;
      PPCS0PLBWRBTERM : out std_logic;
      PPCS0PLBMBUSY : out std_logic_vector(0 to 1);
      PPCS0PLBMRDERR : out std_logic_vector(0 to 1);
      PPCS0PLBMWRERR : out std_logic_vector(0 to 1);
      PPCS0PLBMIRQ : out std_logic_vector(0 to 1);
      PPCS0PLBSSIZE : out std_logic_vector(0 to 1);
      CPMPPCS1PLBCLK : in std_logic;
      PLBPPCS1MASTERID : in std_logic_vector(0 to 0);
      PLBPPCS1PAVALID : in std_logic;
      PLBPPCS1SAVALID : in std_logic;
      PLBPPCS1RDPENDREQ : in std_logic;
      PLBPPCS1WRPENDREQ : in std_logic;
      PLBPPCS1RDPENDPRI : in std_logic_vector(0 to 1);
      PLBPPCS1WRPENDPRI : in std_logic_vector(0 to 1);
      PLBPPCS1REQPRI : in std_logic_vector(0 to 1);
      PLBPPCS1RDPRIM : in std_logic;
      PLBPPCS1WRPRIM : in std_logic;
      PLBPPCS1BUSLOCK : in std_logic;
      PLBPPCS1ABORT : in std_logic;
      PLBPPCS1RNW : in std_logic;
      PLBPPCS1BE : in std_logic_vector(0 to 15);
      PLBPPCS1SIZE : in std_logic_vector(0 to 3);
      PLBPPCS1TYPE : in std_logic_vector(0 to 2);
      PLBPPCS1TATTRIBUTE : in std_logic_vector(0 to 15);
      PLBPPCS1LOCKERR : in std_logic;
      PLBPPCS1MSIZE : in std_logic_vector(0 to 1);
      PLBPPCS1UABUS : in std_logic_vector(0 to 31);
      PLBPPCS1ABUS : in std_logic_vector(0 to 31);
      PLBPPCS1WRDBUS : in std_logic_vector(0 to 127);
      PLBPPCS1WRBURST : in std_logic;
      PLBPPCS1RDBURST : in std_logic;
      PPCS1PLBADDRACK : out std_logic;
      PPCS1PLBWAIT : out std_logic;
      PPCS1PLBREARBITRATE : out std_logic;
      PPCS1PLBWRDACK : out std_logic;
      PPCS1PLBWRCOMP : out std_logic;
      PPCS1PLBRDDBUS : out std_logic_vector(0 to 127);
      PPCS1PLBRDWDADDR : out std_logic_vector(0 to 3);
      PPCS1PLBRDDACK : out std_logic;
      PPCS1PLBRDCOMP : out std_logic;
      PPCS1PLBRDBTERM : out std_logic;
      PPCS1PLBWRBTERM : out std_logic;
      PPCS1PLBMBUSY : out std_logic_vector(0 to 0);
      PPCS1PLBMRDERR : out std_logic_vector(0 to 0);
      PPCS1PLBMWRERR : out std_logic_vector(0 to 0);
      PPCS1PLBMIRQ : out std_logic_vector(0 to 0);
      PPCS1PLBSSIZE : out std_logic_vector(0 to 1);
      CPMDMA0LLCLK : in std_logic;
      LLDMA0TXDSTRDYN : in std_logic;
      LLDMA0RXD : in std_logic_vector(0 to 31);
      LLDMA0RXREM : in std_logic_vector(0 to 3);
      LLDMA0RXSOFN : in std_logic;
      LLDMA0RXEOFN : in std_logic;
      LLDMA0RXSOPN : in std_logic;
      LLDMA0RXEOPN : in std_logic;
      LLDMA0RXSRCRDYN : in std_logic;
      LLDMA0RSTENGINEREQ : in std_logic;
      DMA0LLTXD : out std_logic_vector(0 to 31);
      DMA0LLTXREM : out std_logic_vector(0 to 3);
      DMA0LLTXSOFN : out std_logic;
      DMA0LLTXEOFN : out std_logic;
      DMA0LLTXSOPN : out std_logic;
      DMA0LLTXEOPN : out std_logic;
      DMA0LLTXSRCRDYN : out std_logic;
      DMA0LLRXDSTRDYN : out std_logic;
      DMA0LLRSTENGINEACK : out std_logic;
      DMA0TXIRQ : out std_logic;
      DMA0RXIRQ : out std_logic;
      CPMDMA1LLCLK : in std_logic;
      LLDMA1TXDSTRDYN : in std_logic;
      LLDMA1RXD : in std_logic_vector(0 to 31);
      LLDMA1RXREM : in std_logic_vector(0 to 3);
      LLDMA1RXSOFN : in std_logic;
      LLDMA1RXEOFN : in std_logic;
      LLDMA1RXSOPN : in std_logic;
      LLDMA1RXEOPN : in std_logic;
      LLDMA1RXSRCRDYN : in std_logic;
      LLDMA1RSTENGINEREQ : in std_logic;
      DMA1LLTXD : out std_logic_vector(0 to 31);
      DMA1LLTXREM : out std_logic_vector(0 to 3);
      DMA1LLTXSOFN : out std_logic;
      DMA1LLTXEOFN : out std_logic;
      DMA1LLTXSOPN : out std_logic;
      DMA1LLTXEOPN : out std_logic;
      DMA1LLTXSRCRDYN : out std_logic;
      DMA1LLRXDSTRDYN : out std_logic;
      DMA1LLRSTENGINEACK : out std_logic;
      DMA1TXIRQ : out std_logic;
      DMA1RXIRQ : out std_logic;
      CPMDMA2LLCLK : in std_logic;
      LLDMA2TXDSTRDYN : in std_logic;
      LLDMA2RXD : in std_logic_vector(0 to 31);
      LLDMA2RXREM : in std_logic_vector(0 to 3);
      LLDMA2RXSOFN : in std_logic;
      LLDMA2RXEOFN : in std_logic;
      LLDMA2RXSOPN : in std_logic;
      LLDMA2RXEOPN : in std_logic;
      LLDMA2RXSRCRDYN : in std_logic;
      LLDMA2RSTENGINEREQ : in std_logic;
      DMA2LLTXD : out std_logic_vector(0 to 31);
      DMA2LLTXREM : out std_logic_vector(0 to 3);
      DMA2LLTXSOFN : out std_logic;
      DMA2LLTXEOFN : out std_logic;
      DMA2LLTXSOPN : out std_logic;
      DMA2LLTXEOPN : out std_logic;
      DMA2LLTXSRCRDYN : out std_logic;
      DMA2LLRXDSTRDYN : out std_logic;
      DMA2LLRSTENGINEACK : out std_logic;
      DMA2TXIRQ : out std_logic;
      DMA2RXIRQ : out std_logic;
      CPMDMA3LLCLK : in std_logic;
      LLDMA3TXDSTRDYN : in std_logic;
      LLDMA3RXD : in std_logic_vector(0 to 31);
      LLDMA3RXREM : in std_logic_vector(0 to 3);
      LLDMA3RXSOFN : in std_logic;
      LLDMA3RXEOFN : in std_logic;
      LLDMA3RXSOPN : in std_logic;
      LLDMA3RXEOPN : in std_logic;
      LLDMA3RXSRCRDYN : in std_logic;
      LLDMA3RSTENGINEREQ : in std_logic;
      DMA3LLTXD : out std_logic_vector(0 to 31);
      DMA3LLTXREM : out std_logic_vector(0 to 3);
      DMA3LLTXSOFN : out std_logic;
      DMA3LLTXEOFN : out std_logic;
      DMA3LLTXSOPN : out std_logic;
      DMA3LLTXEOPN : out std_logic;
      DMA3LLTXSRCRDYN : out std_logic;
      DMA3LLRXDSTRDYN : out std_logic;
      DMA3LLRSTENGINEACK : out std_logic;
      DMA3TXIRQ : out std_logic;
      DMA3RXIRQ : out std_logic;
      RSTC440RESETCORE : in std_logic;
      RSTC440RESETCHIP : in std_logic;
      RSTC440RESETSYSTEM : in std_logic;
      C440RSTCORERESETREQ : out std_logic;
      C440RSTCHIPRESETREQ : out std_logic;
      C440RSTSYSTEMRESETREQ : out std_logic;
      TRCC440TRACEDISABLE : in std_logic;
      TRCC440TRIGGEREVENTIN : in std_logic;
      C440TRCBRANCHSTATUS : out std_logic_vector(0 to 2);
      C440TRCCYCLE : out std_logic;
      C440TRCEXECUTIONSTATUS : out std_logic_vector(0 to 4);
      C440TRCTRACESTATUS : out std_logic_vector(0 to 6);
      C440TRCTRIGGEREVENTOUT : out std_logic;
      C440TRCTRIGGEREVENTTYPE : out std_logic_vector(0 to 13)
    );
  end component;

  component plb_v46_0_wrapper is
    port (
      PLB_Clk : in std_logic;
      SYS_Rst : in std_logic;
      PLB_Rst : out std_logic;
      SPLB_Rst : out std_logic_vector(0 to 15);
      MPLB_Rst : out std_logic_vector(0 to 1);
      PLB_dcrAck : out std_logic;
      PLB_dcrDBus : out std_logic_vector(0 to 31);
      DCR_ABus : in std_logic_vector(0 to 9);
      DCR_DBus : in std_logic_vector(0 to 31);
      DCR_Read : in std_logic;
      DCR_Write : in std_logic;
      M_ABus : in std_logic_vector(0 to 63);
      M_UABus : in std_logic_vector(0 to 63);
      M_BE : in std_logic_vector(0 to 31);
      M_RNW : in std_logic_vector(0 to 1);
      M_abort : in std_logic_vector(0 to 1);
      M_busLock : in std_logic_vector(0 to 1);
      M_TAttribute : in std_logic_vector(0 to 31);
      M_lockErr : in std_logic_vector(0 to 1);
      M_MSize : in std_logic_vector(0 to 3);
      M_priority : in std_logic_vector(0 to 3);
      M_rdBurst : in std_logic_vector(0 to 1);
      M_request : in std_logic_vector(0 to 1);
      M_size : in std_logic_vector(0 to 7);
      M_type : in std_logic_vector(0 to 5);
      M_wrBurst : in std_logic_vector(0 to 1);
      M_wrDBus : in std_logic_vector(0 to 255);
      Sl_addrAck : in std_logic_vector(0 to 15);
      Sl_MRdErr : in std_logic_vector(0 to 31);
      Sl_MWrErr : in std_logic_vector(0 to 31);
      Sl_MBusy : in std_logic_vector(0 to 31);
      Sl_rdBTerm : in std_logic_vector(0 to 15);
      Sl_rdComp : in std_logic_vector(0 to 15);
      Sl_rdDAck : in std_logic_vector(0 to 15);
      Sl_rdDBus : in std_logic_vector(0 to 2047);
      Sl_rdWdAddr : in std_logic_vector(0 to 63);
      Sl_rearbitrate : in std_logic_vector(0 to 15);
      Sl_SSize : in std_logic_vector(0 to 31);
      Sl_wait : in std_logic_vector(0 to 15);
      Sl_wrBTerm : in std_logic_vector(0 to 15);
      Sl_wrComp : in std_logic_vector(0 to 15);
      Sl_wrDAck : in std_logic_vector(0 to 15);
      Sl_MIRQ : in std_logic_vector(0 to 31);
      PLB_MIRQ : out std_logic_vector(0 to 1);
      PLB_ABus : out std_logic_vector(0 to 31);
      PLB_UABus : out std_logic_vector(0 to 31);
      PLB_BE : out std_logic_vector(0 to 15);
      PLB_MAddrAck : out std_logic_vector(0 to 1);
      PLB_MTimeout : out std_logic_vector(0 to 1);
      PLB_MBusy : out std_logic_vector(0 to 1);
      PLB_MRdErr : out std_logic_vector(0 to 1);
      PLB_MWrErr : out std_logic_vector(0 to 1);
      PLB_MRdBTerm : out std_logic_vector(0 to 1);
      PLB_MRdDAck : out std_logic_vector(0 to 1);
      PLB_MRdDBus : out std_logic_vector(0 to 255);
      PLB_MRdWdAddr : out std_logic_vector(0 to 7);
      PLB_MRearbitrate : out std_logic_vector(0 to 1);
      PLB_MWrBTerm : out std_logic_vector(0 to 1);
      PLB_MWrDAck : out std_logic_vector(0 to 1);
      PLB_MSSize : out std_logic_vector(0 to 3);
      PLB_PAValid : out std_logic;
      PLB_RNW : out std_logic;
      PLB_SAValid : out std_logic;
      PLB_abort : out std_logic;
      PLB_busLock : out std_logic;
      PLB_TAttribute : out std_logic_vector(0 to 15);
      PLB_lockErr : out std_logic;
      PLB_masterID : out std_logic_vector(0 to 0);
      PLB_MSize : out std_logic_vector(0 to 1);
      PLB_rdPendPri : out std_logic_vector(0 to 1);
      PLB_wrPendPri : out std_logic_vector(0 to 1);
      PLB_rdPendReq : out std_logic;
      PLB_wrPendReq : out std_logic;
      PLB_rdBurst : out std_logic;
      PLB_rdPrim : out std_logic_vector(0 to 15);
      PLB_reqPri : out std_logic_vector(0 to 1);
      PLB_size : out std_logic_vector(0 to 3);
      PLB_type : out std_logic_vector(0 to 2);
      PLB_wrBurst : out std_logic;
      PLB_wrDBus : out std_logic_vector(0 to 127);
      PLB_wrPrim : out std_logic_vector(0 to 15);
      PLB_SaddrAck : out std_logic;
      PLB_SMRdErr : out std_logic_vector(0 to 1);
      PLB_SMWrErr : out std_logic_vector(0 to 1);
      PLB_SMBusy : out std_logic_vector(0 to 1);
      PLB_SrdBTerm : out std_logic;
      PLB_SrdComp : out std_logic;
      PLB_SrdDAck : out std_logic;
      PLB_SrdDBus : out std_logic_vector(0 to 127);
      PLB_SrdWdAddr : out std_logic_vector(0 to 3);
      PLB_Srearbitrate : out std_logic;
      PLB_Sssize : out std_logic_vector(0 to 1);
      PLB_Swait : out std_logic;
      PLB_SwrBTerm : out std_logic;
      PLB_SwrComp : out std_logic;
      PLB_SwrDAck : out std_logic;
      Bus_Error_Det : out std_logic
    );
  end component;

  component xps_bram_if_cntlr_1_wrapper is
    port (
      SPLB_Clk : in std_logic;
      SPLB_Rst : in std_logic;
      PLB_ABus : in std_logic_vector(0 to 31);
      PLB_UABus : in std_logic_vector(0 to 31);
      PLB_PAValid : in std_logic;
      PLB_SAValid : in std_logic;
      PLB_rdPrim : in std_logic;
      PLB_wrPrim : in std_logic;
      PLB_masterID : in std_logic_vector(0 to 0);
      PLB_abort : in std_logic;
      PLB_busLock : in std_logic;
      PLB_RNW : in std_logic;
      PLB_BE : in std_logic_vector(0 to 15);
      PLB_MSize : in std_logic_vector(0 to 1);
      PLB_size : in std_logic_vector(0 to 3);
      PLB_type : in std_logic_vector(0 to 2);
      PLB_lockErr : in std_logic;
      PLB_wrDBus : in std_logic_vector(0 to 127);
      PLB_wrBurst : in std_logic;
      PLB_rdBurst : in std_logic;
      PLB_wrPendReq : in std_logic;
      PLB_rdPendReq : in std_logic;
      PLB_wrPendPri : in std_logic_vector(0 to 1);
      PLB_rdPendPri : in std_logic_vector(0 to 1);
      PLB_reqPri : in std_logic_vector(0 to 1);
      PLB_TAttribute : in std_logic_vector(0 to 15);
      Sl_addrAck : out std_logic;
      Sl_SSize : out std_logic_vector(0 to 1);
      Sl_wait : out std_logic;
      Sl_rearbitrate : out std_logic;
      Sl_wrDAck : out std_logic;
      Sl_wrComp : out std_logic;
      Sl_wrBTerm : out std_logic;
      Sl_rdDBus : out std_logic_vector(0 to 127);
      Sl_rdWdAddr : out std_logic_vector(0 to 3);
      Sl_rdDAck : out std_logic;
      Sl_rdComp : out std_logic;
      Sl_rdBTerm : out std_logic;
      Sl_MBusy : out std_logic_vector(0 to 1);
      Sl_MWrErr : out std_logic_vector(0 to 1);
      Sl_MRdErr : out std_logic_vector(0 to 1);
      Sl_MIRQ : out std_logic_vector(0 to 1);
      BRAM_Rst : out std_logic;
      BRAM_Clk : out std_logic;
      BRAM_EN : out std_logic;
      BRAM_WEN : out std_logic_vector(0 to 7);
      BRAM_Addr : out std_logic_vector(0 to 31);
      BRAM_Din : in std_logic_vector(0 to 63);
      BRAM_Dout : out std_logic_vector(0 to 63)
    );
  end component;

  component xps_bram_if_cntlr_1_bram_wrapper is
    port (
      BRAM_Rst_A : in std_logic;
      BRAM_Clk_A : in std_logic;
      BRAM_EN_A : in std_logic;
      BRAM_WEN_A : in std_logic_vector(0 to 7);
      BRAM_Addr_A : in std_logic_vector(0 to 31);
      BRAM_Din_A : out std_logic_vector(0 to 63);
      BRAM_Dout_A : in std_logic_vector(0 to 63);
      BRAM_Rst_B : in std_logic;
      BRAM_Clk_B : in std_logic;
      BRAM_EN_B : in std_logic;
      BRAM_WEN_B : in std_logic_vector(0 to 7);
      BRAM_Addr_B : in std_logic_vector(0 to 31);
      BRAM_Din_B : out std_logic_vector(0 to 63);
      BRAM_Dout_B : in std_logic_vector(0 to 63)
    );
  end component;

  component rs232_uart_1_wrapper is
    port (
      SPLB_Clk : in std_logic;
      SPLB_Rst : in std_logic;
      PLB_ABus : in std_logic_vector(0 to 31);
      PLB_PAValid : in std_logic;
      PLB_masterID : in std_logic_vector(0 to 0);
      PLB_RNW : in std_logic;
      PLB_BE : in std_logic_vector(0 to 15);
      PLB_size : in std_logic_vector(0 to 3);
      PLB_type : in std_logic_vector(0 to 2);
      PLB_wrDBus : in std_logic_vector(0 to 127);
      PLB_UABus : in std_logic_vector(0 to 31);
      PLB_SAValid : in std_logic;
      PLB_rdPrim : in std_logic;
      PLB_wrPrim : in std_logic;
      PLB_abort : in std_logic;
      PLB_busLock : in std_logic;
      PLB_MSize : in std_logic_vector(0 to 1);
      PLB_lockErr : in std_logic;
      PLB_wrBurst : in std_logic;
      PLB_rdBurst : in std_logic;
      PLB_wrPendReq : in std_logic;
      PLB_rdPendReq : in std_logic;
      PLB_wrPendPri : in std_logic_vector(0 to 1);
      PLB_rdPendPri : in std_logic_vector(0 to 1);
      PLB_reqPri : in std_logic_vector(0 to 1);
      PLB_TAttribute : in std_logic_vector(0 to 15);
      Sl_addrAck : out std_logic;
      Sl_SSize : out std_logic_vector(0 to 1);
      Sl_wait : out std_logic;
      Sl_rearbitrate : out std_logic;
      Sl_wrDAck : out std_logic;
      Sl_wrComp : out std_logic;
      Sl_rdDBus : out std_logic_vector(0 to 127);
      Sl_rdDAck : out std_logic;
      Sl_rdComp : out std_logic;
      Sl_MBusy : out std_logic_vector(0 to 1);
      Sl_MWrErr : out std_logic_vector(0 to 1);
      Sl_MRdErr : out std_logic_vector(0 to 1);
      Sl_wrBTerm : out std_logic;
      Sl_rdWdAddr : out std_logic_vector(0 to 3);
      Sl_rdBTerm : out std_logic;
      Sl_MIRQ : out std_logic_vector(0 to 1);
      RX : in std_logic;
      TX : out std_logic;
      Interrupt : out std_logic
    );
  end component;

  component leds_8bit_wrapper is
    port (
      SPLB_Clk : in std_logic;
      SPLB_Rst : in std_logic;
      PLB_ABus : in std_logic_vector(0 to 31);
      PLB_UABus : in std_logic_vector(0 to 31);
      PLB_PAValid : in std_logic;
      PLB_SAValid : in std_logic;
      PLB_rdPrim : in std_logic;
      PLB_wrPrim : in std_logic;
      PLB_masterID : in std_logic_vector(0 to 0);
      PLB_abort : in std_logic;
      PLB_busLock : in std_logic;
      PLB_RNW : in std_logic;
      PLB_BE : in std_logic_vector(0 to 15);
      PLB_MSize : in std_logic_vector(0 to 1);
      PLB_size : in std_logic_vector(0 to 3);
      PLB_type : in std_logic_vector(0 to 2);
      PLB_lockErr : in std_logic;
      PLB_wrDBus : in std_logic_vector(0 to 127);
      PLB_wrBurst : in std_logic;
      PLB_rdBurst : in std_logic;
      PLB_wrPendReq : in std_logic;
      PLB_rdPendReq : in std_logic;
      PLB_wrPendPri : in std_logic_vector(0 to 1);
      PLB_rdPendPri : in std_logic_vector(0 to 1);
      PLB_reqPri : in std_logic_vector(0 to 1);
      PLB_TAttribute : in std_logic_vector(0 to 15);
      Sl_addrAck : out std_logic;
      Sl_SSize : out std_logic_vector(0 to 1);
      Sl_wait : out std_logic;
      Sl_rearbitrate : out std_logic;
      Sl_wrDAck : out std_logic;
      Sl_wrComp : out std_logic;
      Sl_wrBTerm : out std_logic;
      Sl_rdDBus : out std_logic_vector(0 to 127);
      Sl_rdWdAddr : out std_logic_vector(0 to 3);
      Sl_rdDAck : out std_logic;
      Sl_rdComp : out std_logic;
      Sl_rdBTerm : out std_logic;
      Sl_MBusy : out std_logic_vector(0 to 1);
      Sl_MWrErr : out std_logic_vector(0 to 1);
      Sl_MRdErr : out std_logic_vector(0 to 1);
      Sl_MIRQ : out std_logic_vector(0 to 1);
      IP2INTC_Irpt : out std_logic;
      GPIO_IO_I : in std_logic_vector(0 to 7);
      GPIO_IO_O : out std_logic_vector(0 to 7);
      GPIO_IO_T : out std_logic_vector(0 to 7);
      GPIO2_IO_I : in std_logic_vector(0 to 31);
      GPIO2_IO_O : out std_logic_vector(0 to 31);
      GPIO2_IO_T : out std_logic_vector(0 to 31)
    );
  end component;

  component leds_positions_wrapper is
    port (
      SPLB_Clk : in std_logic;
      SPLB_Rst : in std_logic;
      PLB_ABus : in std_logic_vector(0 to 31);
      PLB_UABus : in std_logic_vector(0 to 31);
      PLB_PAValid : in std_logic;
      PLB_SAValid : in std_logic;
      PLB_rdPrim : in std_logic;
      PLB_wrPrim : in std_logic;
      PLB_masterID : in std_logic_vector(0 to 0);
      PLB_abort : in std_logic;
      PLB_busLock : in std_logic;
      PLB_RNW : in std_logic;
      PLB_BE : in std_logic_vector(0 to 15);
      PLB_MSize : in std_logic_vector(0 to 1);
      PLB_size : in std_logic_vector(0 to 3);
      PLB_type : in std_logic_vector(0 to 2);
      PLB_lockErr : in std_logic;
      PLB_wrDBus : in std_logic_vector(0 to 127);
      PLB_wrBurst : in std_logic;
      PLB_rdBurst : in std_logic;
      PLB_wrPendReq : in std_logic;
      PLB_rdPendReq : in std_logic;
      PLB_wrPendPri : in std_logic_vector(0 to 1);
      PLB_rdPendPri : in std_logic_vector(0 to 1);
      PLB_reqPri : in std_logic_vector(0 to 1);
      PLB_TAttribute : in std_logic_vector(0 to 15);
      Sl_addrAck : out std_logic;
      Sl_SSize : out std_logic_vector(0 to 1);
      Sl_wait : out std_logic;
      Sl_rearbitrate : out std_logic;
      Sl_wrDAck : out std_logic;
      Sl_wrComp : out std_logic;
      Sl_wrBTerm : out std_logic;
      Sl_rdDBus : out std_logic_vector(0 to 127);
      Sl_rdWdAddr : out std_logic_vector(0 to 3);
      Sl_rdDAck : out std_logic;
      Sl_rdComp : out std_logic;
      Sl_rdBTerm : out std_logic;
      Sl_MBusy : out std_logic_vector(0 to 1);
      Sl_MWrErr : out std_logic_vector(0 to 1);
      Sl_MRdErr : out std_logic_vector(0 to 1);
      Sl_MIRQ : out std_logic_vector(0 to 1);
      IP2INTC_Irpt : out std_logic;
      GPIO_IO_I : in std_logic_vector(0 to 4);
      GPIO_IO_O : out std_logic_vector(0 to 4);
      GPIO_IO_T : out std_logic_vector(0 to 4);
      GPIO2_IO_I : in std_logic_vector(0 to 31);
      GPIO2_IO_O : out std_logic_vector(0 to 31);
      GPIO2_IO_T : out std_logic_vector(0 to 31)
    );
  end component;

  component push_buttons_5bit_wrapper is
    port (
      SPLB_Clk : in std_logic;
      SPLB_Rst : in std_logic;
      PLB_ABus : in std_logic_vector(0 to 31);
      PLB_UABus : in std_logic_vector(0 to 31);
      PLB_PAValid : in std_logic;
      PLB_SAValid : in std_logic;
      PLB_rdPrim : in std_logic;
      PLB_wrPrim : in std_logic;
      PLB_masterID : in std_logic_vector(0 to 0);
      PLB_abort : in std_logic;
      PLB_busLock : in std_logic;
      PLB_RNW : in std_logic;
      PLB_BE : in std_logic_vector(0 to 15);
      PLB_MSize : in std_logic_vector(0 to 1);
      PLB_size : in std_logic_vector(0 to 3);
      PLB_type : in std_logic_vector(0 to 2);
      PLB_lockErr : in std_logic;
      PLB_wrDBus : in std_logic_vector(0 to 127);
      PLB_wrBurst : in std_logic;
      PLB_rdBurst : in std_logic;
      PLB_wrPendReq : in std_logic;
      PLB_rdPendReq : in std_logic;
      PLB_wrPendPri : in std_logic_vector(0 to 1);
      PLB_rdPendPri : in std_logic_vector(0 to 1);
      PLB_reqPri : in std_logic_vector(0 to 1);
      PLB_TAttribute : in std_logic_vector(0 to 15);
      Sl_addrAck : out std_logic;
      Sl_SSize : out std_logic_vector(0 to 1);
      Sl_wait : out std_logic;
      Sl_rearbitrate : out std_logic;
      Sl_wrDAck : out std_logic;
      Sl_wrComp : out std_logic;
      Sl_wrBTerm : out std_logic;
      Sl_rdDBus : out std_logic_vector(0 to 127);
      Sl_rdWdAddr : out std_logic_vector(0 to 3);
      Sl_rdDAck : out std_logic;
      Sl_rdComp : out std_logic;
      Sl_rdBTerm : out std_logic;
      Sl_MBusy : out std_logic_vector(0 to 1);
      Sl_MWrErr : out std_logic_vector(0 to 1);
      Sl_MRdErr : out std_logic_vector(0 to 1);
      Sl_MIRQ : out std_logic_vector(0 to 1);
      IP2INTC_Irpt : out std_logic;
      GPIO_IO_I : in std_logic_vector(0 to 4);
      GPIO_IO_O : out std_logic_vector(0 to 4);
      GPIO_IO_T : out std_logic_vector(0 to 4);
      GPIO2_IO_I : in std_logic_vector(0 to 31);
      GPIO2_IO_O : out std_logic_vector(0 to 31);
      GPIO2_IO_T : out std_logic_vector(0 to 31)
    );
  end component;

  component dip_switches_8bit_wrapper is
    port (
      SPLB_Clk : in std_logic;
      SPLB_Rst : in std_logic;
      PLB_ABus : in std_logic_vector(0 to 31);
      PLB_UABus : in std_logic_vector(0 to 31);
      PLB_PAValid : in std_logic;
      PLB_SAValid : in std_logic;
      PLB_rdPrim : in std_logic;
      PLB_wrPrim : in std_logic;
      PLB_masterID : in std_logic_vector(0 to 0);
      PLB_abort : in std_logic;
      PLB_busLock : in std_logic;
      PLB_RNW : in std_logic;
      PLB_BE : in std_logic_vector(0 to 15);
      PLB_MSize : in std_logic_vector(0 to 1);
      PLB_size : in std_logic_vector(0 to 3);
      PLB_type : in std_logic_vector(0 to 2);
      PLB_lockErr : in std_logic;
      PLB_wrDBus : in std_logic_vector(0 to 127);
      PLB_wrBurst : in std_logic;
      PLB_rdBurst : in std_logic;
      PLB_wrPendReq : in std_logic;
      PLB_rdPendReq : in std_logic;
      PLB_wrPendPri : in std_logic_vector(0 to 1);
      PLB_rdPendPri : in std_logic_vector(0 to 1);
      PLB_reqPri : in std_logic_vector(0 to 1);
      PLB_TAttribute : in std_logic_vector(0 to 15);
      Sl_addrAck : out std_logic;
      Sl_SSize : out std_logic_vector(0 to 1);
      Sl_wait : out std_logic;
      Sl_rearbitrate : out std_logic;
      Sl_wrDAck : out std_logic;
      Sl_wrComp : out std_logic;
      Sl_wrBTerm : out std_logic;
      Sl_rdDBus : out std_logic_vector(0 to 127);
      Sl_rdWdAddr : out std_logic_vector(0 to 3);
      Sl_rdDAck : out std_logic;
      Sl_rdComp : out std_logic;
      Sl_rdBTerm : out std_logic;
      Sl_MBusy : out std_logic_vector(0 to 1);
      Sl_MWrErr : out std_logic_vector(0 to 1);
      Sl_MRdErr : out std_logic_vector(0 to 1);
      Sl_MIRQ : out std_logic_vector(0 to 1);
      IP2INTC_Irpt : out std_logic;
      GPIO_IO_I : in std_logic_vector(0 to 7);
      GPIO_IO_O : out std_logic_vector(0 to 7);
      GPIO_IO_T : out std_logic_vector(0 to 7);
      GPIO2_IO_I : in std_logic_vector(0 to 31);
      GPIO2_IO_O : out std_logic_vector(0 to 31);
      GPIO2_IO_T : out std_logic_vector(0 to 31)
    );
  end component;

  component iic_eeprom_wrapper is
    port (
      Sda_I : in std_logic;
      Sda_O : out std_logic;
      Sda_T : out std_logic;
      Scl_I : in std_logic;
      Scl_O : out std_logic;
      Scl_T : out std_logic;
      Gpo : out std_logic_vector(31 to 31);
      IIC2INTC_Irpt : out std_logic;
      SPLB_Clk : in std_logic;
      SPLB_Rst : in std_logic;
      PLB_ABus : in std_logic_vector(0 to 31);
      PLB_UABus : in std_logic_vector(0 to 31);
      PLB_PAValid : in std_logic;
      PLB_SAValid : in std_logic;
      PLB_rdPrim : in std_logic;
      PLB_wrPrim : in std_logic;
      PLB_masterID : in std_logic_vector(0 to 0);
      PLB_abort : in std_logic;
      PLB_busLock : in std_logic;
      PLB_RNW : in std_logic;
      PLB_BE : in std_logic_vector(0 to 15);
      PLB_MSize : in std_logic_vector(0 to 1);
      PLB_size : in std_logic_vector(0 to 3);
      PLB_type : in std_logic_vector(0 to 2);
      PLB_lockErr : in std_logic;
      PLB_wrDBus : in std_logic_vector(0 to 127);
      PLB_wrBurst : in std_logic;
      PLB_rdBurst : in std_logic;
      PLB_wrPendReq : in std_logic;
      PLB_rdPendReq : in std_logic;
      PLB_wrPendPri : in std_logic_vector(0 to 1);
      PLB_rdPendPri : in std_logic_vector(0 to 1);
      PLB_reqPri : in std_logic_vector(0 to 1);
      PLB_TAttribute : in std_logic_vector(0 to 15);
      Sl_addrAck : out std_logic;
      Sl_SSize : out std_logic_vector(0 to 1);
      Sl_wait : out std_logic;
      Sl_rearbitrate : out std_logic;
      Sl_wrDAck : out std_logic;
      Sl_wrComp : out std_logic;
      Sl_wrBTerm : out std_logic;
      Sl_rdDBus : out std_logic_vector(0 to 127);
      Sl_rdWdAddr : out std_logic_vector(0 to 3);
      Sl_rdDAck : out std_logic;
      Sl_rdComp : out std_logic;
      Sl_rdBTerm : out std_logic;
      Sl_MBusy : out std_logic_vector(0 to 1);
      Sl_MWrErr : out std_logic_vector(0 to 1);
      Sl_MRdErr : out std_logic_vector(0 to 1);
      Sl_MIRQ : out std_logic_vector(0 to 1)
    );
  end component;

  component ethernet_mac_wrapper is
    port (
      PHY_tx_clk : in std_logic;
      PHY_rx_clk : in std_logic;
      PHY_crs : in std_logic;
      PHY_dv : in std_logic;
      PHY_rx_data : in std_logic_vector(3 downto 0);
      PHY_col : in std_logic;
      PHY_rx_er : in std_logic;
      PHY_rst_n : out std_logic;
      PHY_tx_en : out std_logic;
      PHY_tx_data : out std_logic_vector(3 downto 0);
      PHY_MDC : out std_logic;
      PHY_MDIO_I : in std_logic;
      PHY_MDIO_O : out std_logic;
      PHY_MDIO_T : out std_logic;
      IP2INTC_Irpt : out std_logic;
      SPLB_Clk : in std_logic;
      SPLB_Rst : in std_logic;
      PLB_ABus : in std_logic_vector(0 to 31);
      PLB_UABus : in std_logic_vector(0 to 31);
      PLB_PAValid : in std_logic;
      PLB_SAValid : in std_logic;
      PLB_rdPrim : in std_logic;
      PLB_wrPrim : in std_logic;
      PLB_masterID : in std_logic_vector(0 to 0);
      PLB_abort : in std_logic;
      PLB_busLock : in std_logic;
      PLB_RNW : in std_logic;
      PLB_BE : in std_logic_vector(0 to 15);
      PLB_MSize : in std_logic_vector(0 to 1);
      PLB_size : in std_logic_vector(0 to 3);
      PLB_type : in std_logic_vector(0 to 2);
      PLB_lockErr : in std_logic;
      PLB_wrDBus : in std_logic_vector(0 to 127);
      PLB_wrBurst : in std_logic;
      PLB_rdBurst : in std_logic;
      PLB_wrPendReq : in std_logic;
      PLB_rdPendReq : in std_logic;
      PLB_wrPendPri : in std_logic_vector(0 to 1);
      PLB_rdPendPri : in std_logic_vector(0 to 1);
      PLB_reqPri : in std_logic_vector(0 to 1);
      PLB_TAttribute : in std_logic_vector(0 to 15);
      Sl_addrAck : out std_logic;
      Sl_SSize : out std_logic_vector(0 to 1);
      Sl_wait : out std_logic;
      Sl_rearbitrate : out std_logic;
      Sl_wrDAck : out std_logic;
      Sl_wrComp : out std_logic;
      Sl_wrBTerm : out std_logic;
      Sl_rdDBus : out std_logic_vector(0 to 127);
      Sl_rdWdAddr : out std_logic_vector(0 to 3);
      Sl_rdDAck : out std_logic;
      Sl_rdComp : out std_logic;
      Sl_rdBTerm : out std_logic;
      Sl_MBusy : out std_logic_vector(0 to 1);
      Sl_MWrErr : out std_logic_vector(0 to 1);
      Sl_MRdErr : out std_logic_vector(0 to 1);
      Sl_MIRQ : out std_logic_vector(0 to 1)
    );
  end component;

  component ddr2_sdram_wrapper is
    port (
      mc_mibclk : in std_logic;
      mi_mcclk90 : in std_logic;
      mi_mcreset : in std_logic;
      mi_mcclkdiv2 : in std_logic;
      mi_mcclk_200 : in std_logic;
      mi_mcaddressvalid : in std_logic;
      mi_mcaddress : in std_logic_vector(0 to 35);
      mi_mcbankconflict : in std_logic;
      mi_mcrowconflict : in std_logic;
      mi_mcbyteenable : in std_logic_vector(0 to 15);
      mi_mcwritedata : in std_logic_vector(0 to 127);
      mi_mcreadnotwrite : in std_logic;
      mi_mcwritedatavalid : in std_logic;
      mc_miaddrreadytoaccept : out std_logic;
      mc_mireaddata : out std_logic_vector(0 to 127);
      mc_mireaddataerr : out std_logic;
      mc_mireaddatavalid : out std_logic;
      idelay_ctrl_rdy_i : in std_logic;
      idelay_ctrl_rdy : out std_logic;
      DDR2_DQ : inout std_logic_vector(63 downto 0);
      DDR2_DQS : inout std_logic_vector(7 downto 0);
      DDR2_DQS_N : inout std_logic_vector(7 downto 0);
      DDR2_A : out std_logic_vector(12 downto 0);
      DDR2_BA : out std_logic_vector(1 downto 0);
      DDR2_RAS_N : out std_logic;
      DDR2_CAS_N : out std_logic;
      DDR2_WE_N : out std_logic;
      DDR2_CS_N : out std_logic_vector(0 to 0);
      DDR2_ODT : out std_logic_vector(1 downto 0);
      DDR2_CKE : out std_logic_vector(0 to 0);
      DDR2_DM : out std_logic_vector(7 downto 0);
      DDR2_CK : out std_logic_vector(1 downto 0);
      DDR2_CK_N : out std_logic_vector(1 downto 0)
    );
  end component;

  component sysace_compactflash_wrapper is
    port (
      SPLB_Clk : in std_logic;
      SPLB_Rst : in std_logic;
      PLB_ABus : in std_logic_vector(0 to 31);
      PLB_UABus : in std_logic_vector(0 to 31);
      PLB_PAValid : in std_logic;
      PLB_SAValid : in std_logic;
      PLB_rdPrim : in std_logic;
      PLB_wrPrim : in std_logic;
      PLB_masterID : in std_logic_vector(0 to 0);
      PLB_abort : in std_logic;
      PLB_busLock : in std_logic;
      PLB_RNW : in std_logic;
      PLB_BE : in std_logic_vector(0 to 15);
      PLB_MSize : in std_logic_vector(0 to 1);
      PLB_size : in std_logic_vector(0 to 3);
      PLB_type : in std_logic_vector(0 to 2);
      PLB_lockErr : in std_logic;
      PLB_wrDBus : in std_logic_vector(0 to 127);
      PLB_wrBurst : in std_logic;
      PLB_rdBurst : in std_logic;
      PLB_wrPendReq : in std_logic;
      PLB_rdPendReq : in std_logic;
      PLB_wrPendPri : in std_logic_vector(0 to 1);
      PLB_rdPendPri : in std_logic_vector(0 to 1);
      PLB_reqPri : in std_logic_vector(0 to 1);
      PLB_TAttribute : in std_logic_vector(0 to 15);
      Sl_addrAck : out std_logic;
      Sl_SSize : out std_logic_vector(0 to 1);
      Sl_wait : out std_logic;
      Sl_rearbitrate : out std_logic;
      Sl_wrDAck : out std_logic;
      Sl_wrComp : out std_logic;
      Sl_wrBTerm : out std_logic;
      Sl_rdDBus : out std_logic_vector(0 to 127);
      Sl_rdWdAddr : out std_logic_vector(0 to 3);
      Sl_rdDAck : out std_logic;
      Sl_rdComp : out std_logic;
      Sl_rdBTerm : out std_logic;
      Sl_MBusy : out std_logic_vector(0 to 1);
      Sl_MWrErr : out std_logic_vector(0 to 1);
      Sl_MRdErr : out std_logic_vector(0 to 1);
      Sl_MIRQ : out std_logic_vector(0 to 1);
      SysACE_MPA : out std_logic_vector(6 downto 0);
      SysACE_CLK : in std_logic;
      SysACE_MPIRQ : in std_logic;
      SysACE_MPD_I : in std_logic_vector(15 downto 0);
      SysACE_MPD_O : out std_logic_vector(15 downto 0);
      SysACE_MPD_T : out std_logic_vector(15 downto 0);
      SysACE_CEN : out std_logic;
      SysACE_OEN : out std_logic;
      SysACE_WEN : out std_logic;
      SysACE_IRQ : out std_logic
    );
  end component;

  component flash_wrapper is
    port (
      MCH_SPLB_Clk : in std_logic;
      RdClk : in std_logic;
      MCH_SPLB_Rst : in std_logic;
      MCH0_Access_Control : in std_logic;
      MCH0_Access_Data : in std_logic_vector(0 to 31);
      MCH0_Access_Write : in std_logic;
      MCH0_Access_Full : out std_logic;
      MCH0_ReadData_Control : out std_logic;
      MCH0_ReadData_Data : out std_logic_vector(0 to 31);
      MCH0_ReadData_Read : in std_logic;
      MCH0_ReadData_Exists : out std_logic;
      MCH1_Access_Control : in std_logic;
      MCH1_Access_Data : in std_logic_vector(0 to 31);
      MCH1_Access_Write : in std_logic;
      MCH1_Access_Full : out std_logic;
      MCH1_ReadData_Control : out std_logic;
      MCH1_ReadData_Data : out std_logic_vector(0 to 31);
      MCH1_ReadData_Read : in std_logic;
      MCH1_ReadData_Exists : out std_logic;
      MCH2_Access_Control : in std_logic;
      MCH2_Access_Data : in std_logic_vector(0 to 31);
      MCH2_Access_Write : in std_logic;
      MCH2_Access_Full : out std_logic;
      MCH2_ReadData_Control : out std_logic;
      MCH2_ReadData_Data : out std_logic_vector(0 to 31);
      MCH2_ReadData_Read : in std_logic;
      MCH2_ReadData_Exists : out std_logic;
      MCH3_Access_Control : in std_logic;
      MCH3_Access_Data : in std_logic_vector(0 to 31);
      MCH3_Access_Write : in std_logic;
      MCH3_Access_Full : out std_logic;
      MCH3_ReadData_Control : out std_logic;
      MCH3_ReadData_Data : out std_logic_vector(0 to 31);
      MCH3_ReadData_Read : in std_logic;
      MCH3_ReadData_Exists : out std_logic;
      PLB_ABus : in std_logic_vector(0 to 31);
      PLB_UABus : in std_logic_vector(0 to 31);
      PLB_PAValid : in std_logic;
      PLB_SAValid : in std_logic;
      PLB_rdPrim : in std_logic;
      PLB_wrPrim : in std_logic;
      PLB_masterID : in std_logic_vector(0 to 0);
      PLB_abort : in std_logic;
      PLB_busLock : in std_logic;
      PLB_RNW : in std_logic;
      PLB_BE : in std_logic_vector(0 to 15);
      PLB_MSize : in std_logic_vector(0 to 1);
      PLB_size : in std_logic_vector(0 to 3);
      PLB_type : in std_logic_vector(0 to 2);
      PLB_lockErr : in std_logic;
      PLB_wrDBus : in std_logic_vector(0 to 127);
      PLB_wrBurst : in std_logic;
      PLB_rdBurst : in std_logic;
      PLB_wrPendReq : in std_logic;
      PLB_rdPendReq : in std_logic;
      PLB_wrPendPri : in std_logic_vector(0 to 1);
      PLB_rdPendPri : in std_logic_vector(0 to 1);
      PLB_reqPri : in std_logic_vector(0 to 1);
      PLB_TAttribute : in std_logic_vector(0 to 15);
      Sl_addrAck : out std_logic;
      Sl_SSize : out std_logic_vector(0 to 1);
      Sl_wait : out std_logic;
      Sl_rearbitrate : out std_logic;
      Sl_wrDAck : out std_logic;
      Sl_wrComp : out std_logic;
      Sl_wrBTerm : out std_logic;
      Sl_rdDBus : out std_logic_vector(0 to 127);
      Sl_rdWdAddr : out std_logic_vector(0 to 3);
      Sl_rdDAck : out std_logic;
      Sl_rdComp : out std_logic;
      Sl_rdBTerm : out std_logic;
      Sl_MBusy : out std_logic_vector(0 to 1);
      Sl_MWrErr : out std_logic_vector(0 to 1);
      Sl_MRdErr : out std_logic_vector(0 to 1);
      Sl_MIRQ : out std_logic_vector(0 to 1);
      Mem_DQ_I : in std_logic_vector(0 to 15);
      Mem_DQ_O : out std_logic_vector(0 to 15);
      Mem_DQ_T : out std_logic_vector(0 to 15);
      Mem_A : out std_logic_vector(0 to 31);
      Mem_RPN : out std_logic;
      Mem_CEN : out std_logic_vector(0 to 0);
      Mem_OEN : out std_logic_vector(0 to 0);
      Mem_WEN : out std_logic;
      Mem_QWEN : out std_logic_vector(0 to 1);
      Mem_BEN : out std_logic_vector(0 to 1);
      Mem_CE : out std_logic_vector(0 to 0);
      Mem_ADV_LDN : out std_logic;
      Mem_LBON : out std_logic;
      Mem_CKEN : out std_logic;
      Mem_RNW : out std_logic
    );
  end component;

  component xps_timebase_wdt_0_wrapper is
    port (
      WDT_Reset : out std_logic;
      Timebase_Interrupt : out std_logic;
      WDT_Interrupt : out std_logic;
      SPLB_Clk : in std_logic;
      SPLB_Rst : in std_logic;
      PLB_ABus : in std_logic_vector(0 to 31);
      PLB_PAValid : in std_logic;
      PLB_masterID : in std_logic_vector(0 to 0);
      PLB_RNW : in std_logic;
      PLB_BE : in std_logic_vector(0 to 15);
      PLB_size : in std_logic_vector(0 to 3);
      PLB_type : in std_logic_vector(0 to 2);
      PLB_wrDBus : in std_logic_vector(0 to 127);
      Sl_addrAck : out std_logic;
      Sl_SSize : out std_logic_vector(0 to 1);
      Sl_wait : out std_logic;
      Sl_rearbitrate : out std_logic;
      Sl_wrDAck : out std_logic;
      Sl_wrComp : out std_logic;
      Sl_rdDBus : out std_logic_vector(0 to 127);
      Sl_rdDAck : out std_logic;
      Sl_rdComp : out std_logic;
      Sl_MBusy : out std_logic_vector(0 to 1);
      Sl_MWrErr : out std_logic_vector(0 to 1);
      Sl_MRdErr : out std_logic_vector(0 to 1);
      PLB_UABus : in std_logic_vector(0 to 31);
      PLB_SAValid : in std_logic;
      PLB_rdPrim : in std_logic;
      PLB_wrPrim : in std_logic;
      PLB_abort : in std_logic;
      PLB_busLock : in std_logic;
      PLB_MSize : in std_logic_vector(0 to 1);
      PLB_lockErr : in std_logic;
      PLB_wrBurst : in std_logic;
      PLB_rdBurst : in std_logic;
      PLB_wrPendReq : in std_logic;
      PLB_rdPendReq : in std_logic;
      PLB_wrPendPri : in std_logic_vector(0 to 1);
      PLB_rdPendPri : in std_logic_vector(0 to 1);
      PLB_reqPri : in std_logic_vector(0 to 1);
      PLB_TAttribute : in std_logic_vector(0 to 15);
      Sl_wrBTerm : out std_logic;
      Sl_rdWdAddr : out std_logic_vector(0 to 3);
      Sl_rdBTerm : out std_logic;
      Sl_MIRQ : out std_logic_vector(0 to 1)
    );
  end component;

  component xps_timer_0_wrapper is
    port (
      CaptureTrig0 : in std_logic;
      CaptureTrig1 : in std_logic;
      GenerateOut0 : out std_logic;
      GenerateOut1 : out std_logic;
      PWM0 : out std_logic;
      Interrupt : out std_logic;
      Freeze : in std_logic;
      SPLB_Clk : in std_logic;
      SPLB_Rst : in std_logic;
      PLB_ABus : in std_logic_vector(0 to 31);
      PLB_PAValid : in std_logic;
      PLB_masterID : in std_logic_vector(0 to 0);
      PLB_RNW : in std_logic;
      PLB_BE : in std_logic_vector(0 to 15);
      PLB_size : in std_logic_vector(0 to 3);
      PLB_type : in std_logic_vector(0 to 2);
      PLB_wrDBus : in std_logic_vector(0 to 127);
      Sl_addrAck : out std_logic;
      Sl_SSize : out std_logic_vector(0 to 1);
      Sl_wait : out std_logic;
      Sl_rearbitrate : out std_logic;
      Sl_wrDAck : out std_logic;
      Sl_wrComp : out std_logic;
      Sl_rdDBus : out std_logic_vector(0 to 127);
      Sl_rdDAck : out std_logic;
      Sl_rdComp : out std_logic;
      Sl_MBusy : out std_logic_vector(0 to 1);
      Sl_MWrErr : out std_logic_vector(0 to 1);
      Sl_MRdErr : out std_logic_vector(0 to 1);
      PLB_UABus : in std_logic_vector(0 to 31);
      PLB_SAValid : in std_logic;
      PLB_rdPrim : in std_logic;
      PLB_wrPrim : in std_logic;
      PLB_abort : in std_logic;
      PLB_busLock : in std_logic;
      PLB_MSize : in std_logic_vector(0 to 1);
      PLB_lockErr : in std_logic;
      PLB_wrBurst : in std_logic;
      PLB_rdBurst : in std_logic;
      PLB_wrPendReq : in std_logic;
      PLB_rdPendReq : in std_logic;
      PLB_wrPendPri : in std_logic_vector(0 to 1);
      PLB_rdPendPri : in std_logic_vector(0 to 1);
      PLB_reqPri : in std_logic_vector(0 to 1);
      PLB_TAttribute : in std_logic_vector(0 to 15);
      Sl_wrBTerm : out std_logic;
      Sl_rdWdAddr : out std_logic_vector(0 to 3);
      Sl_rdBTerm : out std_logic;
      Sl_MIRQ : out std_logic_vector(0 to 1)
    );
  end component;

  component clock_generator_0_wrapper is
    port (
      CLKIN : in std_logic;
      CLKOUT0 : out std_logic;
      CLKOUT1 : out std_logic;
      CLKOUT2 : out std_logic;
      CLKOUT3 : out std_logic;
      CLKOUT4 : out std_logic;
      CLKOUT5 : out std_logic;
      CLKOUT6 : out std_logic;
      CLKOUT7 : out std_logic;
      CLKOUT8 : out std_logic;
      CLKOUT9 : out std_logic;
      CLKOUT10 : out std_logic;
      CLKOUT11 : out std_logic;
      CLKOUT12 : out std_logic;
      CLKOUT13 : out std_logic;
      CLKOUT14 : out std_logic;
      CLKOUT15 : out std_logic;
      CLKFBIN : in std_logic;
      CLKFBOUT : out std_logic;
      PSCLK : in std_logic;
      PSEN : in std_logic;
      PSINCDEC : in std_logic;
      PSDONE : out std_logic;
      RST : in std_logic;
      LOCKED : out std_logic
    );
  end component;

  component jtagppc_cntlr_inst_wrapper is
    port (
      TRSTNEG : in std_logic;
      HALTNEG0 : in std_logic;
      DBGC405DEBUGHALT0 : out std_logic;
      HALTNEG1 : in std_logic;
      DBGC405DEBUGHALT1 : out std_logic;
      C405JTGTDO0 : in std_logic;
      C405JTGTDOEN0 : in std_logic;
      JTGC405TCK0 : out std_logic;
      JTGC405TDI0 : out std_logic;
      JTGC405TMS0 : out std_logic;
      JTGC405TRSTNEG0 : out std_logic;
      C405JTGTDO1 : in std_logic;
      C405JTGTDOEN1 : in std_logic;
      JTGC405TCK1 : out std_logic;
      JTGC405TDI1 : out std_logic;
      JTGC405TMS1 : out std_logic;
      JTGC405TRSTNEG1 : out std_logic
    );
  end component;

  component proc_sys_reset_0_wrapper is
    port (
      Slowest_sync_clk : in std_logic;
      Ext_Reset_In : in std_logic;
      Aux_Reset_In : in std_logic;
      MB_Debug_Sys_Rst : in std_logic;
      Core_Reset_Req_0 : in std_logic;
      Chip_Reset_Req_0 : in std_logic;
      System_Reset_Req_0 : in std_logic;
      Core_Reset_Req_1 : in std_logic;
      Chip_Reset_Req_1 : in std_logic;
      System_Reset_Req_1 : in std_logic;
      Dcm_locked : in std_logic;
      RstcPPCresetcore_0 : out std_logic;
      RstcPPCresetchip_0 : out std_logic;
      RstcPPCresetsys_0 : out std_logic;
      RstcPPCresetcore_1 : out std_logic;
      RstcPPCresetchip_1 : out std_logic;
      RstcPPCresetsys_1 : out std_logic;
      MB_Reset : out std_logic;
      Bus_Struct_Reset : out std_logic_vector(0 to 0);
      Peripheral_Reset : out std_logic_vector(0 to 0)
    );
  end component;

  component xps_intc_0_wrapper is
    port (
      SPLB_Clk : in std_logic;
      SPLB_Rst : in std_logic;
      PLB_ABus : in std_logic_vector(0 to 31);
      PLB_PAValid : in std_logic;
      PLB_masterID : in std_logic_vector(0 to 0);
      PLB_RNW : in std_logic;
      PLB_BE : in std_logic_vector(0 to 15);
      PLB_size : in std_logic_vector(0 to 3);
      PLB_type : in std_logic_vector(0 to 2);
      PLB_wrDBus : in std_logic_vector(0 to 127);
      PLB_UABus : in std_logic_vector(0 to 31);
      PLB_SAValid : in std_logic;
      PLB_rdPrim : in std_logic;
      PLB_wrPrim : in std_logic;
      PLB_abort : in std_logic;
      PLB_busLock : in std_logic;
      PLB_MSize : in std_logic_vector(0 to 1);
      PLB_lockErr : in std_logic;
      PLB_wrBurst : in std_logic;
      PLB_rdBurst : in std_logic;
      PLB_wrPendReq : in std_logic;
      PLB_rdPendReq : in std_logic;
      PLB_wrPendPri : in std_logic_vector(0 to 1);
      PLB_rdPendPri : in std_logic_vector(0 to 1);
      PLB_reqPri : in std_logic_vector(0 to 1);
      PLB_TAttribute : in std_logic_vector(0 to 15);
      Sl_addrAck : out std_logic;
      Sl_SSize : out std_logic_vector(0 to 1);
      Sl_wait : out std_logic;
      Sl_rearbitrate : out std_logic;
      Sl_wrDAck : out std_logic;
      Sl_wrComp : out std_logic;
      Sl_rdDBus : out std_logic_vector(0 to 127);
      Sl_rdDAck : out std_logic;
      Sl_rdComp : out std_logic;
      Sl_MBusy : out std_logic_vector(0 to 1);
      Sl_MWrErr : out std_logic_vector(0 to 1);
      Sl_MRdErr : out std_logic_vector(0 to 1);
      Sl_wrBTerm : out std_logic;
      Sl_rdWdAddr : out std_logic_vector(0 to 3);
      Sl_rdBTerm : out std_logic;
      Sl_MIRQ : out std_logic_vector(0 to 1);
      Intr : in std_logic_vector(11 downto 0);
      Irq : out std_logic
    );
  end component;

  component xps_tft_0_wrapper is
    port (
      SPLB_Clk : in std_logic;
      SPLB_Rst : in std_logic;
      MPLB_Clk : in std_logic;
      MPLB_Rst : in std_logic;
      MD_error : out std_logic;
      IP2INTC_Irpt : out std_logic;
      M_request : out std_logic;
      M_priority : out std_logic_vector(0 to 1);
      M_busLock : out std_logic;
      M_RNW : out std_logic;
      M_BE : out std_logic_vector(0 to 15);
      M_MSize : out std_logic_vector(0 to 1);
      M_size : out std_logic_vector(0 to 3);
      M_type : out std_logic_vector(0 to 2);
      M_ABus : out std_logic_vector(0 to 31);
      M_wrBurst : out std_logic;
      M_rdBurst : out std_logic;
      M_wrDBus : out std_logic_vector(0 to 127);
      PLB_MSSize : in std_logic_vector(0 to 1);
      PLB_MAddrAck : in std_logic;
      PLB_MRearbitrate : in std_logic;
      PLB_MTimeout : in std_logic;
      PLB_MRdErr : in std_logic;
      PLB_MWrErr : in std_logic;
      PLB_MRdDBus : in std_logic_vector(0 to 127);
      PLB_MRdDAck : in std_logic;
      PLB_MWrDAck : in std_logic;
      PLB_MRdBTerm : in std_logic;
      PLB_MWrBTerm : in std_logic;
      M_TAttribute : out std_logic_vector(0 to 15);
      M_lockErr : out std_logic;
      M_abort : out std_logic;
      M_UABus : out std_logic_vector(0 to 31);
      PLB_MBusy : in std_logic;
      PLB_MIRQ : in std_logic;
      PLB_MRdWdAddr : in std_logic_vector(0 to 3);
      PLB_ABus : in std_logic_vector(0 to 31);
      PLB_PAValid : in std_logic;
      PLB_masterID : in std_logic_vector(0 to 0);
      PLB_RNW : in std_logic;
      PLB_BE : in std_logic_vector(0 to 15);
      PLB_size : in std_logic_vector(0 to 3);
      PLB_type : in std_logic_vector(0 to 2);
      PLB_wrDBus : in std_logic_vector(0 to 127);
      Sl_addrAck : out std_logic;
      Sl_SSize : out std_logic_vector(0 to 1);
      Sl_wait : out std_logic;
      Sl_rearbitrate : out std_logic;
      Sl_wrDAck : out std_logic;
      Sl_wrComp : out std_logic;
      Sl_rdDBus : out std_logic_vector(0 to 127);
      Sl_rdDAck : out std_logic;
      Sl_rdComp : out std_logic;
      Sl_MBusy : out std_logic_vector(0 to 1);
      Sl_MWrErr : out std_logic_vector(0 to 1);
      Sl_MRdErr : out std_logic_vector(0 to 1);
      PLB_UABus : in std_logic_vector(0 to 31);
      PLB_SAValid : in std_logic;
      PLB_rdPrim : in std_logic;
      PLB_wrPrim : in std_logic;
      PLB_abort : in std_logic;
      PLB_busLock : in std_logic;
      PLB_MSize : in std_logic_vector(0 to 1);
      PLB_lockErr : in std_logic;
      PLB_wrBurst : in std_logic;
      PLB_rdBurst : in std_logic;
      PLB_wrPendReq : in std_logic;
      PLB_rdPendReq : in std_logic;
      PLB_wrPendPri : in std_logic_vector(0 to 1);
      PLB_rdPendPri : in std_logic_vector(0 to 1);
      PLB_reqPri : in std_logic_vector(0 to 1);
      PLB_TAttribute : in std_logic_vector(0 to 15);
      Sl_wrBTerm : out std_logic;
      Sl_rdWdAddr : out std_logic_vector(0 to 3);
      Sl_rdBTerm : out std_logic;
      Sl_MIRQ : out std_logic_vector(0 to 1);
      DCR_Clk : in std_logic;
      DCR_Rst : in std_logic;
      DCR_Read : in std_logic;
      DCR_Write : in std_logic;
      DCR_ABus : in std_logic_vector(0 to 9);
      DCR_Sl_DBus : in std_logic_vector(0 to 31);
      Sl_DCRDBus : out std_logic_vector(0 to 31);
      Sl_DCRAck : out std_logic;
      SYS_TFT_Clk : in std_logic;
      TFT_HSYNC : out std_logic;
      TFT_VSYNC : out std_logic;
      TFT_DE : out std_logic;
      TFT_DPS : out std_logic;
      TFT_VGA_CLK : out std_logic;
      TFT_VGA_R : out std_logic_vector(5 downto 0);
      TFT_VGA_G : out std_logic_vector(5 downto 0);
      TFT_VGA_B : out std_logic_vector(5 downto 0);
      TFT_DVI_CLK_P : out std_logic;
      TFT_DVI_CLK_N : out std_logic;
      TFT_DVI_DATA : out std_logic_vector(11 downto 0);
      TFT_IIC_SCL_I : in std_logic;
      TFT_IIC_SCL_O : out std_logic;
      TFT_IIC_SCL_T : out std_logic;
      TFT_IIC_SDA_I : in std_logic;
      TFT_IIC_SDA_O : out std_logic;
      TFT_IIC_SDA_T : out std_logic
    );
  end component;

  component xps_ps2_0_wrapper is
    port (
      SPLB_Clk : in std_logic;
      SPLB_Rst : in std_logic;
      PLB_ABus : in std_logic_vector(0 to 31);
      PLB_UABus : in std_logic_vector(0 to 31);
      PLB_PAValid : in std_logic;
      PLB_SAValid : in std_logic;
      PLB_rdPrim : in std_logic;
      PLB_wrPrim : in std_logic;
      PLB_masterID : in std_logic_vector(0 to 0);
      PLB_abort : in std_logic;
      PLB_busLock : in std_logic;
      PLB_RNW : in std_logic;
      PLB_BE : in std_logic_vector(0 to 15);
      PLB_MSize : in std_logic_vector(0 to 1);
      PLB_size : in std_logic_vector(0 to 3);
      PLB_type : in std_logic_vector(0 to 2);
      PLB_lockErr : in std_logic;
      PLB_wrDBus : in std_logic_vector(0 to 127);
      PLB_wrBurst : in std_logic;
      PLB_rdBurst : in std_logic;
      PLB_wrPendReq : in std_logic;
      PLB_rdPendReq : in std_logic;
      PLB_wrPendPri : in std_logic_vector(0 to 1);
      PLB_rdPendPri : in std_logic_vector(0 to 1);
      PLB_reqPri : in std_logic_vector(0 to 1);
      PLB_TAttribute : in std_logic_vector(0 to 15);
      Sl_addrAck : out std_logic;
      Sl_SSize : out std_logic_vector(0 to 1);
      Sl_wait : out std_logic;
      Sl_rearbitrate : out std_logic;
      Sl_wrDAck : out std_logic;
      Sl_wrComp : out std_logic;
      Sl_wrBTerm : out std_logic;
      Sl_rdDBus : out std_logic_vector(0 to 127);
      Sl_rdWdAddr : out std_logic_vector(0 to 3);
      Sl_rdDAck : out std_logic;
      Sl_rdComp : out std_logic;
      Sl_rdBTerm : out std_logic;
      Sl_MBusy : out std_logic_vector(0 to 1);
      Sl_MWrErr : out std_logic_vector(0 to 1);
      Sl_MRdErr : out std_logic_vector(0 to 1);
      Sl_MIRQ : out std_logic_vector(0 to 1);
      IP2INTC_Irpt_1 : out std_logic;
      IP2INTC_Irpt_2 : out std_logic;
      PS2_1_DATA_I : in std_logic;
      PS2_1_DATA_O : out std_logic;
      PS2_1_DATA_T : out std_logic;
      PS2_1_CLK_I : in std_logic;
      PS2_1_CLK_O : out std_logic;
      PS2_1_CLK_T : out std_logic;
      PS2_2_DATA_I : in std_logic;
      PS2_2_DATA_O : out std_logic;
      PS2_2_DATA_T : out std_logic;
      PS2_2_CLK_I : in std_logic;
      PS2_2_CLK_O : out std_logic;
      PS2_2_CLK_T : out std_logic
    );
  end component;

  component IOBUF is
    port (
      I : in std_logic;
      IO : inout std_logic;
      O : out std_logic;
      T : in std_logic
    );
  end component;

  -- Internal signals

  signal DIP_Switches_8Bit_IP2INTC_Irpt : std_logic;
  signal Dcm_all_locked : std_logic;
  signal Ethernet_MAC_IP2INTC_Irpt : std_logic;
  signal IIC_EEPROM_IIC2INTC_Irpt : std_logic;
  signal RS232_Uart_1_Interrupt : std_logic;
  signal SysACE_CompactFlash_SysACE_IRQ : std_logic;
  signal clk_25_0000MHz : std_logic;
  signal clk_100_0000MHzPLL0_ADJUST : std_logic;
  signal clk_200_0000MHz90PLL0_ADJUST : std_logic;
  signal clk_200_0000MHzPLL0 : std_logic;
  signal clk_200_0000MHzPLL0_ADJUST : std_logic;
  signal clk_400_0000MHzPLL0 : std_logic;
  signal dcm_clk_s : std_logic;
  signal fpga_0_DIP_Switches_8Bit_GPIO_IO_pin_I : std_logic_vector(0 to 7);
  signal fpga_0_DIP_Switches_8Bit_GPIO_IO_pin_O : std_logic_vector(0 to 7);
  signal fpga_0_DIP_Switches_8Bit_GPIO_IO_pin_T : std_logic_vector(0 to 7);
  signal fpga_0_Ethernet_MAC_PHY_MDIO_pin_I : std_logic;
  signal fpga_0_Ethernet_MAC_PHY_MDIO_pin_O : std_logic;
  signal fpga_0_Ethernet_MAC_PHY_MDIO_pin_T : std_logic;
  signal fpga_0_FLASH_Mem_A_pin_vslice_7_30_concat : std_logic_vector(7 to 30);
  signal fpga_0_FLASH_Mem_DQ_pin_I : std_logic_vector(0 to 15);
  signal fpga_0_FLASH_Mem_DQ_pin_O : std_logic_vector(0 to 15);
  signal fpga_0_FLASH_Mem_DQ_pin_T : std_logic_vector(0 to 15);
  signal fpga_0_IIC_EEPROM_Scl_pin_I : std_logic;
  signal fpga_0_IIC_EEPROM_Scl_pin_O : std_logic;
  signal fpga_0_IIC_EEPROM_Scl_pin_T : std_logic;
  signal fpga_0_IIC_EEPROM_Sda_pin_I : std_logic;
  signal fpga_0_IIC_EEPROM_Sda_pin_O : std_logic;
  signal fpga_0_IIC_EEPROM_Sda_pin_T : std_logic;
  signal fpga_0_LEDs_8Bit_GPIO_IO_pin_I : std_logic_vector(0 to 7);
  signal fpga_0_LEDs_8Bit_GPIO_IO_pin_O : std_logic_vector(0 to 7);
  signal fpga_0_LEDs_8Bit_GPIO_IO_pin_T : std_logic_vector(0 to 7);
  signal fpga_0_LEDs_Positions_GPIO_IO_pin_I : std_logic_vector(0 to 4);
  signal fpga_0_LEDs_Positions_GPIO_IO_pin_O : std_logic_vector(0 to 4);
  signal fpga_0_LEDs_Positions_GPIO_IO_pin_T : std_logic_vector(0 to 4);
  signal fpga_0_Push_Buttons_5Bit_GPIO_IO_pin_I : std_logic_vector(0 to 4);
  signal fpga_0_Push_Buttons_5Bit_GPIO_IO_pin_O : std_logic_vector(0 to 4);
  signal fpga_0_Push_Buttons_5Bit_GPIO_IO_pin_T : std_logic_vector(0 to 4);
  signal fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_I : std_logic_vector(15 downto 0);
  signal fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_O : std_logic_vector(15 downto 0);
  signal fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_T : std_logic_vector(15 downto 0);
  signal net_gnd0 : std_logic;
  signal net_gnd1 : std_logic_vector(0 to 0);
  signal net_gnd2 : std_logic_vector(0 to 1);
  signal net_gnd3 : std_logic_vector(0 to 2);
  signal net_gnd4 : std_logic_vector(0 to 3);
  signal net_gnd5 : std_logic_vector(0 to 4);
  signal net_gnd8 : std_logic_vector(0 to 7);
  signal net_gnd10 : std_logic_vector(0 to 9);
  signal net_gnd16 : std_logic_vector(0 to 15);
  signal net_gnd32 : std_logic_vector(0 to 31);
  signal net_gnd64 : std_logic_vector(0 to 63);
  signal net_gnd128 : std_logic_vector(0 to 127);
  signal net_vcc0 : std_logic;
  signal pgassign1 : std_logic_vector(0 to 0);
  signal pgassign2 : std_logic_vector(0 to 0);
  signal pgassign3 : std_logic_vector(0 to 0);
  signal pgassign4 : std_logic_vector(0 to 0);
  signal pgassign5 : std_logic_vector(0 to 6);
  signal pgassign6 : std_logic_vector(0 to 0);
  signal pgassign7 : std_logic_vector(0 to 31);
  signal pgassign8 : std_logic_vector(11 downto 0);
  signal plb_v46_0_MPLB_Rst : std_logic_vector(0 to 1);
  signal plb_v46_0_M_ABus : std_logic_vector(0 to 63);
  signal plb_v46_0_M_BE : std_logic_vector(0 to 31);
  signal plb_v46_0_M_MSize : std_logic_vector(0 to 3);
  signal plb_v46_0_M_RNW : std_logic_vector(0 to 1);
  signal plb_v46_0_M_TAttribute : std_logic_vector(0 to 31);
  signal plb_v46_0_M_UABus : std_logic_vector(0 to 63);
  signal plb_v46_0_M_abort : std_logic_vector(0 to 1);
  signal plb_v46_0_M_busLock : std_logic_vector(0 to 1);
  signal plb_v46_0_M_lockErr : std_logic_vector(0 to 1);
  signal plb_v46_0_M_priority : std_logic_vector(0 to 3);
  signal plb_v46_0_M_rdBurst : std_logic_vector(0 to 1);
  signal plb_v46_0_M_request : std_logic_vector(0 to 1);
  signal plb_v46_0_M_size : std_logic_vector(0 to 7);
  signal plb_v46_0_M_type : std_logic_vector(0 to 5);
  signal plb_v46_0_M_wrBurst : std_logic_vector(0 to 1);
  signal plb_v46_0_M_wrDBus : std_logic_vector(0 to 255);
  signal plb_v46_0_PLB_ABus : std_logic_vector(0 to 31);
  signal plb_v46_0_PLB_BE : std_logic_vector(0 to 15);
  signal plb_v46_0_PLB_MAddrAck : std_logic_vector(0 to 1);
  signal plb_v46_0_PLB_MBusy : std_logic_vector(0 to 1);
  signal plb_v46_0_PLB_MIRQ : std_logic_vector(0 to 1);
  signal plb_v46_0_PLB_MRdBTerm : std_logic_vector(0 to 1);
  signal plb_v46_0_PLB_MRdDAck : std_logic_vector(0 to 1);
  signal plb_v46_0_PLB_MRdDBus : std_logic_vector(0 to 255);
  signal plb_v46_0_PLB_MRdErr : std_logic_vector(0 to 1);
  signal plb_v46_0_PLB_MRdWdAddr : std_logic_vector(0 to 7);
  signal plb_v46_0_PLB_MRearbitrate : std_logic_vector(0 to 1);
  signal plb_v46_0_PLB_MSSize : std_logic_vector(0 to 3);
  signal plb_v46_0_PLB_MSize : std_logic_vector(0 to 1);
  signal plb_v46_0_PLB_MTimeout : std_logic_vector(0 to 1);
  signal plb_v46_0_PLB_MWrBTerm : std_logic_vector(0 to 1);
  signal plb_v46_0_PLB_MWrDAck : std_logic_vector(0 to 1);
  signal plb_v46_0_PLB_MWrErr : std_logic_vector(0 to 1);
  signal plb_v46_0_PLB_PAValid : std_logic;
  signal plb_v46_0_PLB_RNW : std_logic;
  signal plb_v46_0_PLB_SAValid : std_logic;
  signal plb_v46_0_PLB_TAttribute : std_logic_vector(0 to 15);
  signal plb_v46_0_PLB_UABus : std_logic_vector(0 to 31);
  signal plb_v46_0_PLB_abort : std_logic;
  signal plb_v46_0_PLB_busLock : std_logic;
  signal plb_v46_0_PLB_lockErr : std_logic;
  signal plb_v46_0_PLB_masterID : std_logic_vector(0 to 0);
  signal plb_v46_0_PLB_rdBurst : std_logic;
  signal plb_v46_0_PLB_rdPendPri : std_logic_vector(0 to 1);
  signal plb_v46_0_PLB_rdPendReq : std_logic;
  signal plb_v46_0_PLB_rdPrim : std_logic_vector(0 to 15);
  signal plb_v46_0_PLB_reqPri : std_logic_vector(0 to 1);
  signal plb_v46_0_PLB_size : std_logic_vector(0 to 3);
  signal plb_v46_0_PLB_type : std_logic_vector(0 to 2);
  signal plb_v46_0_PLB_wrBurst : std_logic;
  signal plb_v46_0_PLB_wrDBus : std_logic_vector(0 to 127);
  signal plb_v46_0_PLB_wrPendPri : std_logic_vector(0 to 1);
  signal plb_v46_0_PLB_wrPendReq : std_logic;
  signal plb_v46_0_PLB_wrPrim : std_logic_vector(0 to 15);
  signal plb_v46_0_SPLB_Rst : std_logic_vector(0 to 15);
  signal plb_v46_0_Sl_MBusy : std_logic_vector(0 to 31);
  signal plb_v46_0_Sl_MIRQ : std_logic_vector(0 to 31);
  signal plb_v46_0_Sl_MRdErr : std_logic_vector(0 to 31);
  signal plb_v46_0_Sl_MWrErr : std_logic_vector(0 to 31);
  signal plb_v46_0_Sl_SSize : std_logic_vector(0 to 31);
  signal plb_v46_0_Sl_addrAck : std_logic_vector(0 to 15);
  signal plb_v46_0_Sl_rdBTerm : std_logic_vector(0 to 15);
  signal plb_v46_0_Sl_rdComp : std_logic_vector(0 to 15);
  signal plb_v46_0_Sl_rdDAck : std_logic_vector(0 to 15);
  signal plb_v46_0_Sl_rdDBus : std_logic_vector(0 to 2047);
  signal plb_v46_0_Sl_rdWdAddr : std_logic_vector(0 to 63);
  signal plb_v46_0_Sl_rearbitrate : std_logic_vector(0 to 15);
  signal plb_v46_0_Sl_wait : std_logic_vector(0 to 15);
  signal plb_v46_0_Sl_wrBTerm : std_logic_vector(0 to 15);
  signal plb_v46_0_Sl_wrComp : std_logic_vector(0 to 15);
  signal plb_v46_0_Sl_wrDAck : std_logic_vector(0 to 15);
  signal ppc440_0_EICC440EXTIRQ : std_logic;
  signal ppc440_0_PPC440MC_MCMIADDRREADYTOACCEPT : std_logic;
  signal ppc440_0_PPC440MC_MCMIREADDATA : std_logic_vector(0 to 127);
  signal ppc440_0_PPC440MC_MCMIREADDATAERR : std_logic;
  signal ppc440_0_PPC440MC_MCMIREADDATAVALID : std_logic;
  signal ppc440_0_PPC440MC_MIMCADDRESS : std_logic_vector(0 to 35);
  signal ppc440_0_PPC440MC_MIMCADDRESSVALID : std_logic;
  signal ppc440_0_PPC440MC_MIMCBANKCONFLICT : std_logic;
  signal ppc440_0_PPC440MC_MIMCBYTEENABLE : std_logic_vector(0 to 15);
  signal ppc440_0_PPC440MC_MIMCREADNOTWRITE : std_logic;
  signal ppc440_0_PPC440MC_MIMCROWCONFLICT : std_logic;
  signal ppc440_0_PPC440MC_MIMCWRITEDATA : std_logic_vector(0 to 127);
  signal ppc440_0_PPC440MC_MIMCWRITEDATAVALID : std_logic;
  signal ppc440_0_jtagppc_bus_C405JTGTDO : std_logic;
  signal ppc440_0_jtagppc_bus_C405JTGTDOEN : std_logic;
  signal ppc440_0_jtagppc_bus_JTGC405TCK : std_logic;
  signal ppc440_0_jtagppc_bus_JTGC405TDI : std_logic;
  signal ppc440_0_jtagppc_bus_JTGC405TMS : std_logic;
  signal ppc440_0_jtagppc_bus_JTGC405TRSTNEG : std_logic;
  signal ppc_reset_bus_Chip_Reset_Req : std_logic;
  signal ppc_reset_bus_Core_Reset_Req : std_logic;
  signal ppc_reset_bus_RstcPPCresetcore : std_logic;
  signal ppc_reset_bus_RstcPPCresetsys : std_logic;
  signal ppc_reset_bus_RstsPPCresetchip : std_logic;
  signal ppc_reset_bus_System_Reset_Req : std_logic;
  signal sys_bus_reset : std_logic_vector(0 to 0);
  signal sys_rst_s : std_logic;
  signal xps_bram_if_cntlr_1_port_BRAM_Addr : std_logic_vector(0 to 31);
  signal xps_bram_if_cntlr_1_port_BRAM_Clk : std_logic;
  signal xps_bram_if_cntlr_1_port_BRAM_Din : std_logic_vector(0 to 63);
  signal xps_bram_if_cntlr_1_port_BRAM_Dout : std_logic_vector(0 to 63);
  signal xps_bram_if_cntlr_1_port_BRAM_EN : std_logic;
  signal xps_bram_if_cntlr_1_port_BRAM_Rst : std_logic;
  signal xps_bram_if_cntlr_1_port_BRAM_WEN : std_logic_vector(0 to 7);
  signal xps_ps2_0_IP2INTC_Irpt_1 : std_logic;
  signal xps_ps2_0_IP2INTC_Irpt_2 : std_logic;
  signal xps_ps2_0_PS2_1_CLK_I : std_logic;
  signal xps_ps2_0_PS2_1_CLK_O : std_logic;
  signal xps_ps2_0_PS2_1_CLK_T : std_logic;
  signal xps_ps2_0_PS2_1_DATA_I : std_logic;
  signal xps_ps2_0_PS2_1_DATA_O : std_logic;
  signal xps_ps2_0_PS2_1_DATA_T : std_logic;
  signal xps_ps2_0_PS2_2_CLK_I : std_logic;
  signal xps_ps2_0_PS2_2_CLK_O : std_logic;
  signal xps_ps2_0_PS2_2_CLK_T : std_logic;
  signal xps_ps2_0_PS2_2_DATA_I : std_logic;
  signal xps_ps2_0_PS2_2_DATA_O : std_logic;
  signal xps_ps2_0_PS2_2_DATA_T : std_logic;
  signal xps_tft_0_IP2INTC_Irpt : std_logic;
  signal xps_tft_0_TFT_DE : std_logic;
  signal xps_tft_0_TFT_DVI_CLK_N : std_logic;
  signal xps_tft_0_TFT_DVI_CLK_P : std_logic;
  signal xps_tft_0_TFT_DVI_DATA : std_logic_vector(11 downto 0);
  signal xps_tft_0_TFT_HSYNC : std_logic;
  signal xps_tft_0_TFT_IIC_SCL_I : std_logic;
  signal xps_tft_0_TFT_IIC_SCL_O : std_logic;
  signal xps_tft_0_TFT_IIC_SCL_T : std_logic;
  signal xps_tft_0_TFT_IIC_SDA_I : std_logic;
  signal xps_tft_0_TFT_IIC_SDA_O : std_logic;
  signal xps_tft_0_TFT_IIC_SDA_T : std_logic;
  signal xps_tft_0_TFT_VSYNC : std_logic;
  signal xps_timebase_wdt_0_Timebase_Interrupt : std_logic;
  signal xps_timebase_wdt_0_WDT_Interrupt : std_logic;
  signal xps_timer_0_Interrupt : std_logic;

  attribute BUFFER_TYPE : STRING;
  attribute BOX_TYPE : STRING;
  attribute BUFFER_TYPE of fpga_0_Ethernet_MAC_PHY_tx_clk_pin : signal is "IBUF";
  attribute BUFFER_TYPE of fpga_0_Ethernet_MAC_PHY_rx_clk_pin : signal is "IBUF";
  attribute BUFFER_TYPE of fpga_0_SysACE_CompactFlash_SysACE_CLK_pin : signal is "BUFGP";
  attribute BOX_TYPE of ppc440_0_wrapper : component is "user_black_box";
  attribute BOX_TYPE of plb_v46_0_wrapper : component is "user_black_box";
  attribute BOX_TYPE of xps_bram_if_cntlr_1_wrapper : component is "user_black_box";
  attribute BOX_TYPE of xps_bram_if_cntlr_1_bram_wrapper : component is "user_black_box";
  attribute BOX_TYPE of rs232_uart_1_wrapper : component is "user_black_box";
  attribute BOX_TYPE of leds_8bit_wrapper : component is "user_black_box";
  attribute BOX_TYPE of leds_positions_wrapper : component is "user_black_box";
  attribute BOX_TYPE of push_buttons_5bit_wrapper : component is "user_black_box";
  attribute BOX_TYPE of dip_switches_8bit_wrapper : component is "user_black_box";
  attribute BOX_TYPE of iic_eeprom_wrapper : component is "user_black_box";
  attribute BOX_TYPE of ethernet_mac_wrapper : component is "user_black_box";
  attribute BOX_TYPE of ddr2_sdram_wrapper : component is "user_black_box";
  attribute BOX_TYPE of sysace_compactflash_wrapper : component is "user_black_box";
  attribute BOX_TYPE of flash_wrapper : component is "user_black_box";
  attribute BOX_TYPE of xps_timebase_wdt_0_wrapper : component is "user_black_box";
  attribute BOX_TYPE of xps_timer_0_wrapper : component is "user_black_box";
  attribute BOX_TYPE of clock_generator_0_wrapper : component is "user_black_box";
  attribute BOX_TYPE of jtagppc_cntlr_inst_wrapper : component is "user_black_box";
  attribute BOX_TYPE of proc_sys_reset_0_wrapper : component is "user_black_box";
  attribute BOX_TYPE of xps_intc_0_wrapper : component is "user_black_box";
  attribute BOX_TYPE of xps_tft_0_wrapper : component is "user_black_box";
  attribute BOX_TYPE of xps_ps2_0_wrapper : component is "user_black_box";

begin

  -- Internal assignments

  fpga_0_FLASH_Mem_A_pin <= fpga_0_FLASH_Mem_A_pin_vslice_7_30_concat;
  dcm_clk_s <= fpga_0_clk_1_sys_clk_pin;
  sys_rst_s <= fpga_0_rst_1_sys_rst_pin;
  xps_tft_0_TFT_RESET_pin <= sys_rst_s;
  xps_tft_0_TFT_HSYNC_pin <= xps_tft_0_TFT_HSYNC;
  xps_tft_0_TFT_DVI_CLK_N_pin <= xps_tft_0_TFT_DVI_CLK_N;
  xps_tft_0_TFT_DVI_DATA_pin <= xps_tft_0_TFT_DVI_DATA;
  xps_tft_0_TFT_DE_pin <= xps_tft_0_TFT_DE;
  xps_tft_0_TFT_VSYNC_pin <= xps_tft_0_TFT_VSYNC;
  xps_tft_0_TFT_DVI_CLK_P_pin <= xps_tft_0_TFT_DVI_CLK_P;
  pgassign5(0 to 6) <= B"0000000";
  pgassign6(0 to 0) <= B"0";
  fpga_0_DDR2_SDRAM_DDR2_CS_N_pin <= pgassign1(0);
  fpga_0_DDR2_SDRAM_DDR2_CKE_pin <= pgassign2(0);
  fpga_0_FLASH_Mem_CEN_pin <= pgassign3(0);
  fpga_0_FLASH_Mem_OEN_pin <= pgassign4(0);
  fpga_0_FLASH_Mem_A_pin_vslice_7_30_concat(7 to 30) <= pgassign7(7 to 30);
  pgassign8(11) <= RS232_Uart_1_Interrupt;
  pgassign8(10) <= DIP_Switches_8Bit_IP2INTC_Irpt;
  pgassign8(9) <= xps_ps2_0_IP2INTC_Irpt_2;
  pgassign8(8) <= xps_ps2_0_IP2INTC_Irpt_1;
  pgassign8(7) <= xps_tft_0_IP2INTC_Irpt;
  pgassign8(6) <= IIC_EEPROM_IIC2INTC_Irpt;
  pgassign8(5) <= Ethernet_MAC_IP2INTC_Irpt;
  pgassign8(4) <= SysACE_CompactFlash_SysACE_IRQ;
  pgassign8(3) <= xps_timebase_wdt_0_Timebase_Interrupt;
  pgassign8(2) <= xps_timebase_wdt_0_WDT_Interrupt;
  pgassign8(1) <= xps_timer_0_Interrupt;
  pgassign8(0) <= fpga_0_Ethernet_MAC_MDINT_pin;
  net_gnd0 <= '0';
  net_gnd1(0 to 0) <= B"0";
  net_gnd10(0 to 9) <= B"0000000000";
  net_gnd128(0 to 127) <= B"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
  net_gnd16(0 to 15) <= B"0000000000000000";
  net_gnd2(0 to 1) <= B"00";
  net_gnd3(0 to 2) <= B"000";
  net_gnd32(0 to 31) <= B"00000000000000000000000000000000";
  net_gnd4(0 to 3) <= B"0000";
  net_gnd5(0 to 4) <= B"00000";
  net_gnd64(0 to 63) <= B"0000000000000000000000000000000000000000000000000000000000000000";
  net_gnd8(0 to 7) <= B"00000000";
  net_vcc0 <= '1';

  ppc440_0 : ppc440_0_wrapper
    port map (
      CPMC440CLK => clk_400_0000MHzPLL0,
      CPMC440CLKEN => net_vcc0,
      CPMINTERCONNECTCLK => clk_200_0000MHzPLL0,
      CPMINTERCONNECTCLKEN => net_vcc0,
      CPMINTERCONNECTCLKNTO1 => net_vcc0,
      CPMC440CORECLOCKINACTIVE => net_gnd0,
      CPMC440TIMERCLOCK => net_vcc0,
      C440MACHINECHECK => open,
      C440CPMCORESLEEPREQ => open,
      C440CPMDECIRPTREQ => open,
      C440CPMFITIRPTREQ => open,
      C440CPMMSRCE => open,
      C440CPMMSREE => open,
      C440CPMTIMERRESETREQ => open,
      C440CPMWDIRPTREQ => open,
      PPCCPMINTERCONNECTBUSY => open,
      DBGC440DEBUGHALT => net_gnd0,
      DBGC440DEBUGHALTNEG => net_vcc0,
      DBGC440SYSTEMSTATUS => net_gnd5,
      DBGC440UNCONDDEBUGEVENT => net_gnd0,
      C440DBGSYSTEMCONTROL => open,
      SPLB0_Error => open,
      SPLB1_Error => open,
      EICC440CRITIRQ => net_gnd0,
      EICC440EXTIRQ => ppc440_0_EICC440EXTIRQ,
      PPCEICINTERCONNECTIRQ => open,
      CPMDCRCLK => net_vcc0,
      DCRPPCDMACK => net_gnd0,
      DCRPPCDMDBUSIN => net_gnd32,
      DCRPPCDMTIMEOUTWAIT => net_gnd0,
      PPCDMDCRREAD => open,
      PPCDMDCRWRITE => open,
      PPCDMDCRABUS => open,
      PPCDMDCRDBUSOUT => open,
      DCRPPCDSREAD => net_gnd0,
      DCRPPCDSWRITE => net_gnd0,
      DCRPPCDSABUS => net_gnd10,
      DCRPPCDSDBUSOUT => net_gnd32,
      PPCDSDCRACK => open,
      PPCDSDCRDBUSIN => open,
      PPCDSDCRTIMEOUTWAIT => open,
      CPMFCMCLK => net_vcc0,
      FCMAPUCR => net_gnd4,
      FCMAPUDONE => net_gnd0,
      FCMAPUEXCEPTION => net_gnd0,
      FCMAPUFPSCRFEX => net_gnd0,
      FCMAPURESULT => net_gnd32,
      FCMAPURESULTVALID => net_gnd0,
      FCMAPUSLEEPNOTREADY => net_gnd0,
      FCMAPUCONFIRMINSTR => net_gnd0,
      FCMAPUSTOREDATA => net_gnd128,
      APUFCMDECNONAUTON => open,
      APUFCMDECFPUOP => open,
      APUFCMDECLDSTXFERSIZE => open,
      APUFCMDECLOAD => open,
      APUFCMNEXTINSTRREADY => open,
      APUFCMDECSTORE => open,
      APUFCMDECUDI => open,
      APUFCMDECUDIVALID => open,
      APUFCMENDIAN => open,
      APUFCMFLUSH => open,
      APUFCMINSTRUCTION => open,
      APUFCMINSTRVALID => open,
      APUFCMLOADBYTEADDR => open,
      APUFCMLOADDATA => open,
      APUFCMLOADDVALID => open,
      APUFCMOPERANDVALID => open,
      APUFCMRADATA => open,
      APUFCMRBDATA => open,
      APUFCMWRITEBACKOK => open,
      APUFCMMSRFE0 => open,
      APUFCMMSRFE1 => open,
      JTGC440TCK => ppc440_0_jtagppc_bus_JTGC405TCK,
      JTGC440TDI => ppc440_0_jtagppc_bus_JTGC405TDI,
      JTGC440TMS => ppc440_0_jtagppc_bus_JTGC405TMS,
      JTGC440TRSTNEG => ppc440_0_jtagppc_bus_JTGC405TRSTNEG,
      C440JTGTDO => ppc440_0_jtagppc_bus_C405JTGTDO,
      C440JTGTDOEN => ppc440_0_jtagppc_bus_C405JTGTDOEN,
      CPMMCCLK => clk_200_0000MHzPLL0_ADJUST,
      MCMIREADDATA => ppc440_0_PPC440MC_MCMIREADDATA,
      MCMIREADDATAVALID => ppc440_0_PPC440MC_MCMIREADDATAVALID,
      MCMIREADDATAERR => ppc440_0_PPC440MC_MCMIREADDATAERR,
      MCMIADDRREADYTOACCEPT => ppc440_0_PPC440MC_MCMIADDRREADYTOACCEPT,
      MIMCREADNOTWRITE => ppc440_0_PPC440MC_MIMCREADNOTWRITE,
      MIMCADDRESS => ppc440_0_PPC440MC_MIMCADDRESS,
      MIMCADDRESSVALID => ppc440_0_PPC440MC_MIMCADDRESSVALID,
      MIMCWRITEDATA => ppc440_0_PPC440MC_MIMCWRITEDATA,
      MIMCWRITEDATAVALID => ppc440_0_PPC440MC_MIMCWRITEDATAVALID,
      MIMCBYTEENABLE => ppc440_0_PPC440MC_MIMCBYTEENABLE,
      MIMCBANKCONFLICT => ppc440_0_PPC440MC_MIMCBANKCONFLICT,
      MIMCROWCONFLICT => ppc440_0_PPC440MC_MIMCROWCONFLICT,
      CPMPPCMPLBCLK => clk_100_0000MHzPLL0_ADJUST,
      PLBPPCMMBUSY => plb_v46_0_PLB_MBusy(0),
      PLBPPCMMIRQ => plb_v46_0_PLB_MIRQ(0),
      PLBPPCMMRDERR => plb_v46_0_PLB_MRdErr(0),
      PLBPPCMMWRERR => plb_v46_0_PLB_MWrErr(0),
      PLBPPCMADDRACK => plb_v46_0_PLB_MAddrAck(0),
      PLBPPCMRDBTERM => plb_v46_0_PLB_MRdBTerm(0),
      PLBPPCMRDDACK => plb_v46_0_PLB_MRdDAck(0),
      PLBPPCMRDDBUS => plb_v46_0_PLB_MRdDBus(0 to 127),
      PLBPPCMRDWDADDR => plb_v46_0_PLB_MRdWdAddr(0 to 3),
      PLBPPCMREARBITRATE => plb_v46_0_PLB_MRearbitrate(0),
      PLBPPCMSSIZE => plb_v46_0_PLB_MSSize(0 to 1),
      PLBPPCMTIMEOUT => plb_v46_0_PLB_MTimeout(0),
      PLBPPCMWRBTERM => plb_v46_0_PLB_MWrBTerm(0),
      PLBPPCMWRDACK => plb_v46_0_PLB_MWrDAck(0),
      PLBPPCMRDPENDPRI => plb_v46_0_PLB_rdPendPri,
      PLBPPCMRDPENDREQ => plb_v46_0_PLB_rdPendReq,
      PLBPPCMREQPRI => plb_v46_0_PLB_reqPri,
      PLBPPCMWRPENDPRI => plb_v46_0_PLB_wrPendPri,
      PLBPPCMWRPENDREQ => plb_v46_0_PLB_wrPendReq,
      PPCMPLBABORT => plb_v46_0_M_abort(0),
      PPCMPLBABUS => plb_v46_0_M_ABus(0 to 31),
      PPCMPLBBE => plb_v46_0_M_BE(0 to 15),
      PPCMPLBBUSLOCK => plb_v46_0_M_busLock(0),
      PPCMPLBLOCKERR => plb_v46_0_M_lockErr(0),
      PPCMPLBMSIZE => plb_v46_0_M_MSize(0 to 1),
      PPCMPLBPRIORITY => plb_v46_0_M_priority(0 to 1),
      PPCMPLBRDBURST => plb_v46_0_M_rdBurst(0),
      PPCMPLBREQUEST => plb_v46_0_M_request(0),
      PPCMPLBRNW => plb_v46_0_M_RNW(0),
      PPCMPLBSIZE => plb_v46_0_M_size(0 to 3),
      PPCMPLBTATTRIBUTE => plb_v46_0_M_TAttribute(0 to 15),
      PPCMPLBTYPE => plb_v46_0_M_type(0 to 2),
      PPCMPLBUABUS => plb_v46_0_M_UABus(0 to 31),
      PPCMPLBWRBURST => plb_v46_0_M_wrBurst(0),
      PPCMPLBWRDBUS => plb_v46_0_M_wrDBus(0 to 127),
      CPMPPCS0PLBCLK => clk_100_0000MHzPLL0_ADJUST,
      PLBPPCS0MASTERID => plb_v46_0_PLB_masterID(0 to 0),
      PLBPPCS0PAVALID => plb_v46_0_PLB_PAValid,
      PLBPPCS0SAVALID => plb_v46_0_PLB_SAValid,
      PLBPPCS0RDPENDREQ => plb_v46_0_PLB_rdPendReq,
      PLBPPCS0WRPENDREQ => plb_v46_0_PLB_wrPendReq,
      PLBPPCS0RDPENDPRI => plb_v46_0_PLB_rdPendPri,
      PLBPPCS0WRPENDPRI => plb_v46_0_PLB_wrPendPri,
      PLBPPCS0REQPRI => plb_v46_0_PLB_reqPri,
      PLBPPCS0RDPRIM => plb_v46_0_PLB_rdPrim(0),
      PLBPPCS0WRPRIM => plb_v46_0_PLB_wrPrim(0),
      PLBPPCS0BUSLOCK => plb_v46_0_PLB_busLock,
      PLBPPCS0ABORT => plb_v46_0_PLB_abort,
      PLBPPCS0RNW => plb_v46_0_PLB_RNW,
      PLBPPCS0BE => plb_v46_0_PLB_BE,
      PLBPPCS0SIZE => plb_v46_0_PLB_size,
      PLBPPCS0TYPE => plb_v46_0_PLB_type,
      PLBPPCS0TATTRIBUTE => plb_v46_0_PLB_TAttribute,
      PLBPPCS0LOCKERR => plb_v46_0_PLB_lockErr,
      PLBPPCS0MSIZE => plb_v46_0_PLB_MSize,
      PLBPPCS0UABUS => plb_v46_0_PLB_UABus,
      PLBPPCS0ABUS => plb_v46_0_PLB_ABus,
      PLBPPCS0WRDBUS => plb_v46_0_PLB_wrDBus,
      PLBPPCS0WRBURST => plb_v46_0_PLB_wrBurst,
      PLBPPCS0RDBURST => plb_v46_0_PLB_rdBurst,
      PPCS0PLBADDRACK => plb_v46_0_Sl_addrAck(0),
      PPCS0PLBWAIT => plb_v46_0_Sl_wait(0),
      PPCS0PLBREARBITRATE => plb_v46_0_Sl_rearbitrate(0),
      PPCS0PLBWRDACK => plb_v46_0_Sl_wrDAck(0),
      PPCS0PLBWRCOMP => plb_v46_0_Sl_wrComp(0),
      PPCS0PLBRDDBUS => plb_v46_0_Sl_rdDBus(0 to 127),
      PPCS0PLBRDWDADDR => plb_v46_0_Sl_rdWdAddr(0 to 3),
      PPCS0PLBRDDACK => plb_v46_0_Sl_rdDAck(0),
      PPCS0PLBRDCOMP => plb_v46_0_Sl_rdComp(0),
      PPCS0PLBRDBTERM => plb_v46_0_Sl_rdBTerm(0),
      PPCS0PLBWRBTERM => plb_v46_0_Sl_wrBTerm(0),
      PPCS0PLBMBUSY => plb_v46_0_Sl_MBusy(0 to 1),
      PPCS0PLBMRDERR => plb_v46_0_Sl_MRdErr(0 to 1),
      PPCS0PLBMWRERR => plb_v46_0_Sl_MWrErr(0 to 1),
      PPCS0PLBMIRQ => plb_v46_0_Sl_MIRQ(0 to 1),
      PPCS0PLBSSIZE => plb_v46_0_Sl_SSize(0 to 1),
      CPMPPCS1PLBCLK => net_vcc0,
      PLBPPCS1MASTERID => net_gnd1(0 to 0),
      PLBPPCS1PAVALID => net_gnd0,
      PLBPPCS1SAVALID => net_gnd0,
      PLBPPCS1RDPENDREQ => net_gnd0,
      PLBPPCS1WRPENDREQ => net_gnd0,
      PLBPPCS1RDPENDPRI => net_gnd2,
      PLBPPCS1WRPENDPRI => net_gnd2,
      PLBPPCS1REQPRI => net_gnd2,
      PLBPPCS1RDPRIM => net_gnd0,
      PLBPPCS1WRPRIM => net_gnd0,
      PLBPPCS1BUSLOCK => net_gnd0,
      PLBPPCS1ABORT => net_gnd0,
      PLBPPCS1RNW => net_gnd0,
      PLBPPCS1BE => net_gnd16,
      PLBPPCS1SIZE => net_gnd4,
      PLBPPCS1TYPE => net_gnd3,
      PLBPPCS1TATTRIBUTE => net_gnd16,
      PLBPPCS1LOCKERR => net_gnd0,
      PLBPPCS1MSIZE => net_gnd2,
      PLBPPCS1UABUS => net_gnd32,
      PLBPPCS1ABUS => net_gnd32,
      PLBPPCS1WRDBUS => net_gnd128,
      PLBPPCS1WRBURST => net_gnd0,
      PLBPPCS1RDBURST => net_gnd0,
      PPCS1PLBADDRACK => open,
      PPCS1PLBWAIT => open,
      PPCS1PLBREARBITRATE => open,
      PPCS1PLBWRDACK => open,
      PPCS1PLBWRCOMP => open,
      PPCS1PLBRDDBUS => open,
      PPCS1PLBRDWDADDR => open,
      PPCS1PLBRDDACK => open,
      PPCS1PLBRDCOMP => open,
      PPCS1PLBRDBTERM => open,
      PPCS1PLBWRBTERM => open,
      PPCS1PLBMBUSY => open,
      PPCS1PLBMRDERR => open,
      PPCS1PLBMWRERR => open,
      PPCS1PLBMIRQ => open,
      PPCS1PLBSSIZE => open,
      CPMDMA0LLCLK => net_vcc0,
      LLDMA0TXDSTRDYN => net_vcc0,
      LLDMA0RXD => net_gnd32,
      LLDMA0RXREM => net_gnd4,
      LLDMA0RXSOFN => net_vcc0,
      LLDMA0RXEOFN => net_vcc0,
      LLDMA0RXSOPN => net_vcc0,
      LLDMA0RXEOPN => net_vcc0,
      LLDMA0RXSRCRDYN => net_vcc0,
      LLDMA0RSTENGINEREQ => net_gnd0,
      DMA0LLTXD => open,
      DMA0LLTXREM => open,
      DMA0LLTXSOFN => open,
      DMA0LLTXEOFN => open,
      DMA0LLTXSOPN => open,
      DMA0LLTXEOPN => open,
      DMA0LLTXSRCRDYN => open,
      DMA0LLRXDSTRDYN => open,
      DMA0LLRSTENGINEACK => open,
      DMA0TXIRQ => open,
      DMA0RXIRQ => open,
      CPMDMA1LLCLK => net_vcc0,
      LLDMA1TXDSTRDYN => net_vcc0,
      LLDMA1RXD => net_gnd32,
      LLDMA1RXREM => net_gnd4,
      LLDMA1RXSOFN => net_vcc0,
      LLDMA1RXEOFN => net_vcc0,
      LLDMA1RXSOPN => net_vcc0,
      LLDMA1RXEOPN => net_vcc0,
      LLDMA1RXSRCRDYN => net_vcc0,
      LLDMA1RSTENGINEREQ => net_gnd0,
      DMA1LLTXD => open,
      DMA1LLTXREM => open,
      DMA1LLTXSOFN => open,
      DMA1LLTXEOFN => open,
      DMA1LLTXSOPN => open,
      DMA1LLTXEOPN => open,
      DMA1LLTXSRCRDYN => open,
      DMA1LLRXDSTRDYN => open,
      DMA1LLRSTENGINEACK => open,
      DMA1TXIRQ => open,
      DMA1RXIRQ => open,
      CPMDMA2LLCLK => net_vcc0,
      LLDMA2TXDSTRDYN => net_vcc0,
      LLDMA2RXD => net_gnd32,
      LLDMA2RXREM => net_gnd4,
      LLDMA2RXSOFN => net_vcc0,
      LLDMA2RXEOFN => net_vcc0,
      LLDMA2RXSOPN => net_vcc0,
      LLDMA2RXEOPN => net_vcc0,
      LLDMA2RXSRCRDYN => net_vcc0,
      LLDMA2RSTENGINEREQ => net_gnd0,
      DMA2LLTXD => open,
      DMA2LLTXREM => open,
      DMA2LLTXSOFN => open,
      DMA2LLTXEOFN => open,
      DMA2LLTXSOPN => open,
      DMA2LLTXEOPN => open,
      DMA2LLTXSRCRDYN => open,
      DMA2LLRXDSTRDYN => open,
      DMA2LLRSTENGINEACK => open,
      DMA2TXIRQ => open,
      DMA2RXIRQ => open,
      CPMDMA3LLCLK => net_vcc0,
      LLDMA3TXDSTRDYN => net_vcc0,
      LLDMA3RXD => net_gnd32,
      LLDMA3RXREM => net_gnd4,
      LLDMA3RXSOFN => net_vcc0,
      LLDMA3RXEOFN => net_vcc0,
      LLDMA3RXSOPN => net_vcc0,
      LLDMA3RXEOPN => net_vcc0,
      LLDMA3RXSRCRDYN => net_vcc0,
      LLDMA3RSTENGINEREQ => net_gnd0,
      DMA3LLTXD => open,
      DMA3LLTXREM => open,
      DMA3LLTXSOFN => open,
      DMA3LLTXEOFN => open,
      DMA3LLTXSOPN => open,
      DMA3LLTXEOPN => open,
      DMA3LLTXSRCRDYN => open,
      DMA3LLRXDSTRDYN => open,
      DMA3LLRSTENGINEACK => open,
      DMA3TXIRQ => open,
      DMA3RXIRQ => open,
      RSTC440RESETCORE => ppc_reset_bus_RstcPPCresetcore,
      RSTC440RESETCHIP => ppc_reset_bus_RstsPPCresetchip,
      RSTC440RESETSYSTEM => ppc_reset_bus_RstcPPCresetsys,
      C440RSTCORERESETREQ => ppc_reset_bus_Core_Reset_Req,
      C440RSTCHIPRESETREQ => ppc_reset_bus_Chip_Reset_Req,
      C440RSTSYSTEMRESETREQ => ppc_reset_bus_System_Reset_Req,
      TRCC440TRACEDISABLE => net_gnd0,
      TRCC440TRIGGEREVENTIN => net_gnd0,
      C440TRCBRANCHSTATUS => open,
      C440TRCCYCLE => open,
      C440TRCEXECUTIONSTATUS => open,
      C440TRCTRACESTATUS => open,
      C440TRCTRIGGEREVENTOUT => open,
      C440TRCTRIGGEREVENTTYPE => open
    );

  plb_v46_0 : plb_v46_0_wrapper
    port map (
      PLB_Clk => clk_100_0000MHzPLL0_ADJUST,
      SYS_Rst => sys_bus_reset(0),
      PLB_Rst => open,
      SPLB_Rst => plb_v46_0_SPLB_Rst,
      MPLB_Rst => plb_v46_0_MPLB_Rst,
      PLB_dcrAck => open,
      PLB_dcrDBus => open,
      DCR_ABus => net_gnd10,
      DCR_DBus => net_gnd32,
      DCR_Read => net_gnd0,
      DCR_Write => net_gnd0,
      M_ABus => plb_v46_0_M_ABus,
      M_UABus => plb_v46_0_M_UABus,
      M_BE => plb_v46_0_M_BE,
      M_RNW => plb_v46_0_M_RNW,
      M_abort => plb_v46_0_M_abort,
      M_busLock => plb_v46_0_M_busLock,
      M_TAttribute => plb_v46_0_M_TAttribute,
      M_lockErr => plb_v46_0_M_lockErr,
      M_MSize => plb_v46_0_M_MSize,
      M_priority => plb_v46_0_M_priority,
      M_rdBurst => plb_v46_0_M_rdBurst,
      M_request => plb_v46_0_M_request,
      M_size => plb_v46_0_M_size,
      M_type => plb_v46_0_M_type,
      M_wrBurst => plb_v46_0_M_wrBurst,
      M_wrDBus => plb_v46_0_M_wrDBus,
      Sl_addrAck => plb_v46_0_Sl_addrAck,
      Sl_MRdErr => plb_v46_0_Sl_MRdErr,
      Sl_MWrErr => plb_v46_0_Sl_MWrErr,
      Sl_MBusy => plb_v46_0_Sl_MBusy,
      Sl_rdBTerm => plb_v46_0_Sl_rdBTerm,
      Sl_rdComp => plb_v46_0_Sl_rdComp,
      Sl_rdDAck => plb_v46_0_Sl_rdDAck,
      Sl_rdDBus => plb_v46_0_Sl_rdDBus,
      Sl_rdWdAddr => plb_v46_0_Sl_rdWdAddr,
      Sl_rearbitrate => plb_v46_0_Sl_rearbitrate,
      Sl_SSize => plb_v46_0_Sl_SSize,
      Sl_wait => plb_v46_0_Sl_wait,
      Sl_wrBTerm => plb_v46_0_Sl_wrBTerm,
      Sl_wrComp => plb_v46_0_Sl_wrComp,
      Sl_wrDAck => plb_v46_0_Sl_wrDAck,
      Sl_MIRQ => plb_v46_0_Sl_MIRQ,
      PLB_MIRQ => plb_v46_0_PLB_MIRQ,
      PLB_ABus => plb_v46_0_PLB_ABus,
      PLB_UABus => plb_v46_0_PLB_UABus,
      PLB_BE => plb_v46_0_PLB_BE,
      PLB_MAddrAck => plb_v46_0_PLB_MAddrAck,
      PLB_MTimeout => plb_v46_0_PLB_MTimeout,
      PLB_MBusy => plb_v46_0_PLB_MBusy,
      PLB_MRdErr => plb_v46_0_PLB_MRdErr,
      PLB_MWrErr => plb_v46_0_PLB_MWrErr,
      PLB_MRdBTerm => plb_v46_0_PLB_MRdBTerm,
      PLB_MRdDAck => plb_v46_0_PLB_MRdDAck,
      PLB_MRdDBus => plb_v46_0_PLB_MRdDBus,
      PLB_MRdWdAddr => plb_v46_0_PLB_MRdWdAddr,
      PLB_MRearbitrate => plb_v46_0_PLB_MRearbitrate,
      PLB_MWrBTerm => plb_v46_0_PLB_MWrBTerm,
      PLB_MWrDAck => plb_v46_0_PLB_MWrDAck,
      PLB_MSSize => plb_v46_0_PLB_MSSize,
      PLB_PAValid => plb_v46_0_PLB_PAValid,
      PLB_RNW => plb_v46_0_PLB_RNW,
      PLB_SAValid => plb_v46_0_PLB_SAValid,
      PLB_abort => plb_v46_0_PLB_abort,
      PLB_busLock => plb_v46_0_PLB_busLock,
      PLB_TAttribute => plb_v46_0_PLB_TAttribute,
      PLB_lockErr => plb_v46_0_PLB_lockErr,
      PLB_masterID => plb_v46_0_PLB_masterID(0 to 0),
      PLB_MSize => plb_v46_0_PLB_MSize,
      PLB_rdPendPri => plb_v46_0_PLB_rdPendPri,
      PLB_wrPendPri => plb_v46_0_PLB_wrPendPri,
      PLB_rdPendReq => plb_v46_0_PLB_rdPendReq,
      PLB_wrPendReq => plb_v46_0_PLB_wrPendReq,
      PLB_rdBurst => plb_v46_0_PLB_rdBurst,
      PLB_rdPrim => plb_v46_0_PLB_rdPrim,
      PLB_reqPri => plb_v46_0_PLB_reqPri,
      PLB_size => plb_v46_0_PLB_size,
      PLB_type => plb_v46_0_PLB_type,
      PLB_wrBurst => plb_v46_0_PLB_wrBurst,
      PLB_wrDBus => plb_v46_0_PLB_wrDBus,
      PLB_wrPrim => plb_v46_0_PLB_wrPrim,
      PLB_SaddrAck => open,
      PLB_SMRdErr => open,
      PLB_SMWrErr => open,
      PLB_SMBusy => open,
      PLB_SrdBTerm => open,
      PLB_SrdComp => open,
      PLB_SrdDAck => open,
      PLB_SrdDBus => open,
      PLB_SrdWdAddr => open,
      PLB_Srearbitrate => open,
      PLB_Sssize => open,
      PLB_Swait => open,
      PLB_SwrBTerm => open,
      PLB_SwrComp => open,
      PLB_SwrDAck => open,
      Bus_Error_Det => open
    );

  xps_bram_if_cntlr_1 : xps_bram_if_cntlr_1_wrapper
    port map (
      SPLB_Clk => clk_100_0000MHzPLL0_ADJUST,
      SPLB_Rst => plb_v46_0_SPLB_Rst(1),
      PLB_ABus => plb_v46_0_PLB_ABus,
      PLB_UABus => plb_v46_0_PLB_UABus,
      PLB_PAValid => plb_v46_0_PLB_PAValid,
      PLB_SAValid => plb_v46_0_PLB_SAValid,
      PLB_rdPrim => plb_v46_0_PLB_rdPrim(1),
      PLB_wrPrim => plb_v46_0_PLB_wrPrim(1),
      PLB_masterID => plb_v46_0_PLB_masterID(0 to 0),
      PLB_abort => plb_v46_0_PLB_abort,
      PLB_busLock => plb_v46_0_PLB_busLock,
      PLB_RNW => plb_v46_0_PLB_RNW,
      PLB_BE => plb_v46_0_PLB_BE,
      PLB_MSize => plb_v46_0_PLB_MSize,
      PLB_size => plb_v46_0_PLB_size,
      PLB_type => plb_v46_0_PLB_type,
      PLB_lockErr => plb_v46_0_PLB_lockErr,
      PLB_wrDBus => plb_v46_0_PLB_wrDBus,
      PLB_wrBurst => plb_v46_0_PLB_wrBurst,
      PLB_rdBurst => plb_v46_0_PLB_rdBurst,
      PLB_wrPendReq => plb_v46_0_PLB_wrPendReq,
      PLB_rdPendReq => plb_v46_0_PLB_rdPendReq,
      PLB_wrPendPri => plb_v46_0_PLB_wrPendPri,
      PLB_rdPendPri => plb_v46_0_PLB_rdPendPri,
      PLB_reqPri => plb_v46_0_PLB_reqPri,
      PLB_TAttribute => plb_v46_0_PLB_TAttribute,
      Sl_addrAck => plb_v46_0_Sl_addrAck(1),
      Sl_SSize => plb_v46_0_Sl_SSize(2 to 3),
      Sl_wait => plb_v46_0_Sl_wait(1),
      Sl_rearbitrate => plb_v46_0_Sl_rearbitrate(1),
      Sl_wrDAck => plb_v46_0_Sl_wrDAck(1),
      Sl_wrComp => plb_v46_0_Sl_wrComp(1),
      Sl_wrBTerm => plb_v46_0_Sl_wrBTerm(1),
      Sl_rdDBus => plb_v46_0_Sl_rdDBus(128 to 255),
      Sl_rdWdAddr => plb_v46_0_Sl_rdWdAddr(4 to 7),
      Sl_rdDAck => plb_v46_0_Sl_rdDAck(1),
      Sl_rdComp => plb_v46_0_Sl_rdComp(1),
      Sl_rdBTerm => plb_v46_0_Sl_rdBTerm(1),
      Sl_MBusy => plb_v46_0_Sl_MBusy(2 to 3),
      Sl_MWrErr => plb_v46_0_Sl_MWrErr(2 to 3),
      Sl_MRdErr => plb_v46_0_Sl_MRdErr(2 to 3),
      Sl_MIRQ => plb_v46_0_Sl_MIRQ(2 to 3),
      BRAM_Rst => xps_bram_if_cntlr_1_port_BRAM_Rst,
      BRAM_Clk => xps_bram_if_cntlr_1_port_BRAM_Clk,
      BRAM_EN => xps_bram_if_cntlr_1_port_BRAM_EN,
      BRAM_WEN => xps_bram_if_cntlr_1_port_BRAM_WEN,
      BRAM_Addr => xps_bram_if_cntlr_1_port_BRAM_Addr,
      BRAM_Din => xps_bram_if_cntlr_1_port_BRAM_Din,
      BRAM_Dout => xps_bram_if_cntlr_1_port_BRAM_Dout
    );

  xps_bram_if_cntlr_1_bram : xps_bram_if_cntlr_1_bram_wrapper
    port map (
      BRAM_Rst_A => xps_bram_if_cntlr_1_port_BRAM_Rst,
      BRAM_Clk_A => xps_bram_if_cntlr_1_port_BRAM_Clk,
      BRAM_EN_A => xps_bram_if_cntlr_1_port_BRAM_EN,
      BRAM_WEN_A => xps_bram_if_cntlr_1_port_BRAM_WEN,
      BRAM_Addr_A => xps_bram_if_cntlr_1_port_BRAM_Addr,
      BRAM_Din_A => xps_bram_if_cntlr_1_port_BRAM_Din,
      BRAM_Dout_A => xps_bram_if_cntlr_1_port_BRAM_Dout,
      BRAM_Rst_B => net_gnd0,
      BRAM_Clk_B => net_gnd0,
      BRAM_EN_B => net_gnd0,
      BRAM_WEN_B => net_gnd8,
      BRAM_Addr_B => net_gnd32,
      BRAM_Din_B => open,
      BRAM_Dout_B => net_gnd64
    );

  RS232_Uart_1 : rs232_uart_1_wrapper
    port map (
      SPLB_Clk => clk_100_0000MHzPLL0_ADJUST,
      SPLB_Rst => plb_v46_0_SPLB_Rst(2),
      PLB_ABus => plb_v46_0_PLB_ABus,
      PLB_PAValid => plb_v46_0_PLB_PAValid,
      PLB_masterID => plb_v46_0_PLB_masterID(0 to 0),
      PLB_RNW => plb_v46_0_PLB_RNW,
      PLB_BE => plb_v46_0_PLB_BE,
      PLB_size => plb_v46_0_PLB_size,
      PLB_type => plb_v46_0_PLB_type,
      PLB_wrDBus => plb_v46_0_PLB_wrDBus,
      PLB_UABus => plb_v46_0_PLB_UABus,
      PLB_SAValid => plb_v46_0_PLB_SAValid,
      PLB_rdPrim => plb_v46_0_PLB_rdPrim(2),
      PLB_wrPrim => plb_v46_0_PLB_wrPrim(2),
      PLB_abort => plb_v46_0_PLB_abort,
      PLB_busLock => plb_v46_0_PLB_busLock,
      PLB_MSize => plb_v46_0_PLB_MSize,
      PLB_lockErr => plb_v46_0_PLB_lockErr,
      PLB_wrBurst => plb_v46_0_PLB_wrBurst,
      PLB_rdBurst => plb_v46_0_PLB_rdBurst,
      PLB_wrPendReq => plb_v46_0_PLB_wrPendReq,
      PLB_rdPendReq => plb_v46_0_PLB_rdPendReq,
      PLB_wrPendPri => plb_v46_0_PLB_wrPendPri,
      PLB_rdPendPri => plb_v46_0_PLB_rdPendPri,
      PLB_reqPri => plb_v46_0_PLB_reqPri,
      PLB_TAttribute => plb_v46_0_PLB_TAttribute,
      Sl_addrAck => plb_v46_0_Sl_addrAck(2),
      Sl_SSize => plb_v46_0_Sl_SSize(4 to 5),
      Sl_wait => plb_v46_0_Sl_wait(2),
      Sl_rearbitrate => plb_v46_0_Sl_rearbitrate(2),
      Sl_wrDAck => plb_v46_0_Sl_wrDAck(2),
      Sl_wrComp => plb_v46_0_Sl_wrComp(2),
      Sl_rdDBus => plb_v46_0_Sl_rdDBus(256 to 383),
      Sl_rdDAck => plb_v46_0_Sl_rdDAck(2),
      Sl_rdComp => plb_v46_0_Sl_rdComp(2),
      Sl_MBusy => plb_v46_0_Sl_MBusy(4 to 5),
      Sl_MWrErr => plb_v46_0_Sl_MWrErr(4 to 5),
      Sl_MRdErr => plb_v46_0_Sl_MRdErr(4 to 5),
      Sl_wrBTerm => plb_v46_0_Sl_wrBTerm(2),
      Sl_rdWdAddr => plb_v46_0_Sl_rdWdAddr(8 to 11),
      Sl_rdBTerm => plb_v46_0_Sl_rdBTerm(2),
      Sl_MIRQ => plb_v46_0_Sl_MIRQ(4 to 5),
      RX => fpga_0_RS232_Uart_1_RX_pin,
      TX => fpga_0_RS232_Uart_1_TX_pin,
      Interrupt => RS232_Uart_1_Interrupt
    );

  LEDs_8Bit : leds_8bit_wrapper
    port map (
      SPLB_Clk => clk_100_0000MHzPLL0_ADJUST,
      SPLB_Rst => plb_v46_0_SPLB_Rst(3),
      PLB_ABus => plb_v46_0_PLB_ABus,
      PLB_UABus => plb_v46_0_PLB_UABus,
      PLB_PAValid => plb_v46_0_PLB_PAValid,
      PLB_SAValid => plb_v46_0_PLB_SAValid,
      PLB_rdPrim => plb_v46_0_PLB_rdPrim(3),
      PLB_wrPrim => plb_v46_0_PLB_wrPrim(3),
      PLB_masterID => plb_v46_0_PLB_masterID(0 to 0),
      PLB_abort => plb_v46_0_PLB_abort,
      PLB_busLock => plb_v46_0_PLB_busLock,
      PLB_RNW => plb_v46_0_PLB_RNW,
      PLB_BE => plb_v46_0_PLB_BE,
      PLB_MSize => plb_v46_0_PLB_MSize,
      PLB_size => plb_v46_0_PLB_size,
      PLB_type => plb_v46_0_PLB_type,
      PLB_lockErr => plb_v46_0_PLB_lockErr,
      PLB_wrDBus => plb_v46_0_PLB_wrDBus,
      PLB_wrBurst => plb_v46_0_PLB_wrBurst,
      PLB_rdBurst => plb_v46_0_PLB_rdBurst,
      PLB_wrPendReq => plb_v46_0_PLB_wrPendReq,
      PLB_rdPendReq => plb_v46_0_PLB_rdPendReq,
      PLB_wrPendPri => plb_v46_0_PLB_wrPendPri,
      PLB_rdPendPri => plb_v46_0_PLB_rdPendPri,
      PLB_reqPri => plb_v46_0_PLB_reqPri,
      PLB_TAttribute => plb_v46_0_PLB_TAttribute,
      Sl_addrAck => plb_v46_0_Sl_addrAck(3),
      Sl_SSize => plb_v46_0_Sl_SSize(6 to 7),
      Sl_wait => plb_v46_0_Sl_wait(3),
      Sl_rearbitrate => plb_v46_0_Sl_rearbitrate(3),
      Sl_wrDAck => plb_v46_0_Sl_wrDAck(3),
      Sl_wrComp => plb_v46_0_Sl_wrComp(3),
      Sl_wrBTerm => plb_v46_0_Sl_wrBTerm(3),
      Sl_rdDBus => plb_v46_0_Sl_rdDBus(384 to 511),
      Sl_rdWdAddr => plb_v46_0_Sl_rdWdAddr(12 to 15),
      Sl_rdDAck => plb_v46_0_Sl_rdDAck(3),
      Sl_rdComp => plb_v46_0_Sl_rdComp(3),
      Sl_rdBTerm => plb_v46_0_Sl_rdBTerm(3),
      Sl_MBusy => plb_v46_0_Sl_MBusy(6 to 7),
      Sl_MWrErr => plb_v46_0_Sl_MWrErr(6 to 7),
      Sl_MRdErr => plb_v46_0_Sl_MRdErr(6 to 7),
      Sl_MIRQ => plb_v46_0_Sl_MIRQ(6 to 7),
      IP2INTC_Irpt => open,
      GPIO_IO_I => fpga_0_LEDs_8Bit_GPIO_IO_pin_I,
      GPIO_IO_O => fpga_0_LEDs_8Bit_GPIO_IO_pin_O,
      GPIO_IO_T => fpga_0_LEDs_8Bit_GPIO_IO_pin_T,
      GPIO2_IO_I => net_gnd32,
      GPIO2_IO_O => open,
      GPIO2_IO_T => open
    );

  LEDs_Positions : leds_positions_wrapper
    port map (
      SPLB_Clk => clk_100_0000MHzPLL0_ADJUST,
      SPLB_Rst => plb_v46_0_SPLB_Rst(4),
      PLB_ABus => plb_v46_0_PLB_ABus,
      PLB_UABus => plb_v46_0_PLB_UABus,
      PLB_PAValid => plb_v46_0_PLB_PAValid,
      PLB_SAValid => plb_v46_0_PLB_SAValid,
      PLB_rdPrim => plb_v46_0_PLB_rdPrim(4),
      PLB_wrPrim => plb_v46_0_PLB_wrPrim(4),
      PLB_masterID => plb_v46_0_PLB_masterID(0 to 0),
      PLB_abort => plb_v46_0_PLB_abort,
      PLB_busLock => plb_v46_0_PLB_busLock,
      PLB_RNW => plb_v46_0_PLB_RNW,
      PLB_BE => plb_v46_0_PLB_BE,
      PLB_MSize => plb_v46_0_PLB_MSize,
      PLB_size => plb_v46_0_PLB_size,
      PLB_type => plb_v46_0_PLB_type,
      PLB_lockErr => plb_v46_0_PLB_lockErr,
      PLB_wrDBus => plb_v46_0_PLB_wrDBus,
      PLB_wrBurst => plb_v46_0_PLB_wrBurst,
      PLB_rdBurst => plb_v46_0_PLB_rdBurst,
      PLB_wrPendReq => plb_v46_0_PLB_wrPendReq,
      PLB_rdPendReq => plb_v46_0_PLB_rdPendReq,
      PLB_wrPendPri => plb_v46_0_PLB_wrPendPri,
      PLB_rdPendPri => plb_v46_0_PLB_rdPendPri,
      PLB_reqPri => plb_v46_0_PLB_reqPri,
      PLB_TAttribute => plb_v46_0_PLB_TAttribute,
      Sl_addrAck => plb_v46_0_Sl_addrAck(4),
      Sl_SSize => plb_v46_0_Sl_SSize(8 to 9),
      Sl_wait => plb_v46_0_Sl_wait(4),
      Sl_rearbitrate => plb_v46_0_Sl_rearbitrate(4),
      Sl_wrDAck => plb_v46_0_Sl_wrDAck(4),
      Sl_wrComp => plb_v46_0_Sl_wrComp(4),
      Sl_wrBTerm => plb_v46_0_Sl_wrBTerm(4),
      Sl_rdDBus => plb_v46_0_Sl_rdDBus(512 to 639),
      Sl_rdWdAddr => plb_v46_0_Sl_rdWdAddr(16 to 19),
      Sl_rdDAck => plb_v46_0_Sl_rdDAck(4),
      Sl_rdComp => plb_v46_0_Sl_rdComp(4),
      Sl_rdBTerm => plb_v46_0_Sl_rdBTerm(4),
      Sl_MBusy => plb_v46_0_Sl_MBusy(8 to 9),
      Sl_MWrErr => plb_v46_0_Sl_MWrErr(8 to 9),
      Sl_MRdErr => plb_v46_0_Sl_MRdErr(8 to 9),
      Sl_MIRQ => plb_v46_0_Sl_MIRQ(8 to 9),
      IP2INTC_Irpt => open,
      GPIO_IO_I => fpga_0_LEDs_Positions_GPIO_IO_pin_I,
      GPIO_IO_O => fpga_0_LEDs_Positions_GPIO_IO_pin_O,
      GPIO_IO_T => fpga_0_LEDs_Positions_GPIO_IO_pin_T,
      GPIO2_IO_I => net_gnd32,
      GPIO2_IO_O => open,
      GPIO2_IO_T => open
    );

  Push_Buttons_5Bit : push_buttons_5bit_wrapper
    port map (
      SPLB_Clk => clk_100_0000MHzPLL0_ADJUST,
      SPLB_Rst => plb_v46_0_SPLB_Rst(5),
      PLB_ABus => plb_v46_0_PLB_ABus,
      PLB_UABus => plb_v46_0_PLB_UABus,
      PLB_PAValid => plb_v46_0_PLB_PAValid,
      PLB_SAValid => plb_v46_0_PLB_SAValid,
      PLB_rdPrim => plb_v46_0_PLB_rdPrim(5),
      PLB_wrPrim => plb_v46_0_PLB_wrPrim(5),
      PLB_masterID => plb_v46_0_PLB_masterID(0 to 0),
      PLB_abort => plb_v46_0_PLB_abort,
      PLB_busLock => plb_v46_0_PLB_busLock,
      PLB_RNW => plb_v46_0_PLB_RNW,
      PLB_BE => plb_v46_0_PLB_BE,
      PLB_MSize => plb_v46_0_PLB_MSize,
      PLB_size => plb_v46_0_PLB_size,
      PLB_type => plb_v46_0_PLB_type,
      PLB_lockErr => plb_v46_0_PLB_lockErr,
      PLB_wrDBus => plb_v46_0_PLB_wrDBus,
      PLB_wrBurst => plb_v46_0_PLB_wrBurst,
      PLB_rdBurst => plb_v46_0_PLB_rdBurst,
      PLB_wrPendReq => plb_v46_0_PLB_wrPendReq,
      PLB_rdPendReq => plb_v46_0_PLB_rdPendReq,
      PLB_wrPendPri => plb_v46_0_PLB_wrPendPri,
      PLB_rdPendPri => plb_v46_0_PLB_rdPendPri,
      PLB_reqPri => plb_v46_0_PLB_reqPri,
      PLB_TAttribute => plb_v46_0_PLB_TAttribute,
      Sl_addrAck => plb_v46_0_Sl_addrAck(5),
      Sl_SSize => plb_v46_0_Sl_SSize(10 to 11),
      Sl_wait => plb_v46_0_Sl_wait(5),
      Sl_rearbitrate => plb_v46_0_Sl_rearbitrate(5),
      Sl_wrDAck => plb_v46_0_Sl_wrDAck(5),
      Sl_wrComp => plb_v46_0_Sl_wrComp(5),
      Sl_wrBTerm => plb_v46_0_Sl_wrBTerm(5),
      Sl_rdDBus => plb_v46_0_Sl_rdDBus(640 to 767),
      Sl_rdWdAddr => plb_v46_0_Sl_rdWdAddr(20 to 23),
      Sl_rdDAck => plb_v46_0_Sl_rdDAck(5),
      Sl_rdComp => plb_v46_0_Sl_rdComp(5),
      Sl_rdBTerm => plb_v46_0_Sl_rdBTerm(5),
      Sl_MBusy => plb_v46_0_Sl_MBusy(10 to 11),
      Sl_MWrErr => plb_v46_0_Sl_MWrErr(10 to 11),
      Sl_MRdErr => plb_v46_0_Sl_MRdErr(10 to 11),
      Sl_MIRQ => plb_v46_0_Sl_MIRQ(10 to 11),
      IP2INTC_Irpt => open,
      GPIO_IO_I => fpga_0_Push_Buttons_5Bit_GPIO_IO_pin_I,
      GPIO_IO_O => fpga_0_Push_Buttons_5Bit_GPIO_IO_pin_O,
      GPIO_IO_T => fpga_0_Push_Buttons_5Bit_GPIO_IO_pin_T,
      GPIO2_IO_I => net_gnd32,
      GPIO2_IO_O => open,
      GPIO2_IO_T => open
    );

  DIP_Switches_8Bit : dip_switches_8bit_wrapper
    port map (
      SPLB_Clk => clk_100_0000MHzPLL0_ADJUST,
      SPLB_Rst => plb_v46_0_SPLB_Rst(6),
      PLB_ABus => plb_v46_0_PLB_ABus,
      PLB_UABus => plb_v46_0_PLB_UABus,
      PLB_PAValid => plb_v46_0_PLB_PAValid,
      PLB_SAValid => plb_v46_0_PLB_SAValid,
      PLB_rdPrim => plb_v46_0_PLB_rdPrim(6),
      PLB_wrPrim => plb_v46_0_PLB_wrPrim(6),
      PLB_masterID => plb_v46_0_PLB_masterID(0 to 0),
      PLB_abort => plb_v46_0_PLB_abort,
      PLB_busLock => plb_v46_0_PLB_busLock,
      PLB_RNW => plb_v46_0_PLB_RNW,
      PLB_BE => plb_v46_0_PLB_BE,
      PLB_MSize => plb_v46_0_PLB_MSize,
      PLB_size => plb_v46_0_PLB_size,
      PLB_type => plb_v46_0_PLB_type,
      PLB_lockErr => plb_v46_0_PLB_lockErr,
      PLB_wrDBus => plb_v46_0_PLB_wrDBus,
      PLB_wrBurst => plb_v46_0_PLB_wrBurst,
      PLB_rdBurst => plb_v46_0_PLB_rdBurst,
      PLB_wrPendReq => plb_v46_0_PLB_wrPendReq,
      PLB_rdPendReq => plb_v46_0_PLB_rdPendReq,
      PLB_wrPendPri => plb_v46_0_PLB_wrPendPri,
      PLB_rdPendPri => plb_v46_0_PLB_rdPendPri,
      PLB_reqPri => plb_v46_0_PLB_reqPri,
      PLB_TAttribute => plb_v46_0_PLB_TAttribute,
      Sl_addrAck => plb_v46_0_Sl_addrAck(6),
      Sl_SSize => plb_v46_0_Sl_SSize(12 to 13),
      Sl_wait => plb_v46_0_Sl_wait(6),
      Sl_rearbitrate => plb_v46_0_Sl_rearbitrate(6),
      Sl_wrDAck => plb_v46_0_Sl_wrDAck(6),
      Sl_wrComp => plb_v46_0_Sl_wrComp(6),
      Sl_wrBTerm => plb_v46_0_Sl_wrBTerm(6),
      Sl_rdDBus => plb_v46_0_Sl_rdDBus(768 to 895),
      Sl_rdWdAddr => plb_v46_0_Sl_rdWdAddr(24 to 27),
      Sl_rdDAck => plb_v46_0_Sl_rdDAck(6),
      Sl_rdComp => plb_v46_0_Sl_rdComp(6),
      Sl_rdBTerm => plb_v46_0_Sl_rdBTerm(6),
      Sl_MBusy => plb_v46_0_Sl_MBusy(12 to 13),
      Sl_MWrErr => plb_v46_0_Sl_MWrErr(12 to 13),
      Sl_MRdErr => plb_v46_0_Sl_MRdErr(12 to 13),
      Sl_MIRQ => plb_v46_0_Sl_MIRQ(12 to 13),
      IP2INTC_Irpt => DIP_Switches_8Bit_IP2INTC_Irpt,
      GPIO_IO_I => fpga_0_DIP_Switches_8Bit_GPIO_IO_pin_I,
      GPIO_IO_O => fpga_0_DIP_Switches_8Bit_GPIO_IO_pin_O,
      GPIO_IO_T => fpga_0_DIP_Switches_8Bit_GPIO_IO_pin_T,
      GPIO2_IO_I => net_gnd32,
      GPIO2_IO_O => open,
      GPIO2_IO_T => open
    );

  IIC_EEPROM : iic_eeprom_wrapper
    port map (
      Sda_I => fpga_0_IIC_EEPROM_Sda_pin_I,
      Sda_O => fpga_0_IIC_EEPROM_Sda_pin_O,
      Sda_T => fpga_0_IIC_EEPROM_Sda_pin_T,
      Scl_I => fpga_0_IIC_EEPROM_Scl_pin_I,
      Scl_O => fpga_0_IIC_EEPROM_Scl_pin_O,
      Scl_T => fpga_0_IIC_EEPROM_Scl_pin_T,
      Gpo => open,
      IIC2INTC_Irpt => IIC_EEPROM_IIC2INTC_Irpt,
      SPLB_Clk => clk_100_0000MHzPLL0_ADJUST,
      SPLB_Rst => plb_v46_0_SPLB_Rst(7),
      PLB_ABus => plb_v46_0_PLB_ABus,
      PLB_UABus => plb_v46_0_PLB_UABus,
      PLB_PAValid => plb_v46_0_PLB_PAValid,
      PLB_SAValid => plb_v46_0_PLB_SAValid,
      PLB_rdPrim => plb_v46_0_PLB_rdPrim(7),
      PLB_wrPrim => plb_v46_0_PLB_wrPrim(7),
      PLB_masterID => plb_v46_0_PLB_masterID(0 to 0),
      PLB_abort => plb_v46_0_PLB_abort,
      PLB_busLock => plb_v46_0_PLB_busLock,
      PLB_RNW => plb_v46_0_PLB_RNW,
      PLB_BE => plb_v46_0_PLB_BE,
      PLB_MSize => plb_v46_0_PLB_MSize,
      PLB_size => plb_v46_0_PLB_size,
      PLB_type => plb_v46_0_PLB_type,
      PLB_lockErr => plb_v46_0_PLB_lockErr,
      PLB_wrDBus => plb_v46_0_PLB_wrDBus,
      PLB_wrBurst => plb_v46_0_PLB_wrBurst,
      PLB_rdBurst => plb_v46_0_PLB_rdBurst,
      PLB_wrPendReq => plb_v46_0_PLB_wrPendReq,
      PLB_rdPendReq => plb_v46_0_PLB_rdPendReq,
      PLB_wrPendPri => plb_v46_0_PLB_wrPendPri,
      PLB_rdPendPri => plb_v46_0_PLB_rdPendPri,
      PLB_reqPri => plb_v46_0_PLB_reqPri,
      PLB_TAttribute => plb_v46_0_PLB_TAttribute,
      Sl_addrAck => plb_v46_0_Sl_addrAck(7),
      Sl_SSize => plb_v46_0_Sl_SSize(14 to 15),
      Sl_wait => plb_v46_0_Sl_wait(7),
      Sl_rearbitrate => plb_v46_0_Sl_rearbitrate(7),
      Sl_wrDAck => plb_v46_0_Sl_wrDAck(7),
      Sl_wrComp => plb_v46_0_Sl_wrComp(7),
      Sl_wrBTerm => plb_v46_0_Sl_wrBTerm(7),
      Sl_rdDBus => plb_v46_0_Sl_rdDBus(896 to 1023),
      Sl_rdWdAddr => plb_v46_0_Sl_rdWdAddr(28 to 31),
      Sl_rdDAck => plb_v46_0_Sl_rdDAck(7),
      Sl_rdComp => plb_v46_0_Sl_rdComp(7),
      Sl_rdBTerm => plb_v46_0_Sl_rdBTerm(7),
      Sl_MBusy => plb_v46_0_Sl_MBusy(14 to 15),
      Sl_MWrErr => plb_v46_0_Sl_MWrErr(14 to 15),
      Sl_MRdErr => plb_v46_0_Sl_MRdErr(14 to 15),
      Sl_MIRQ => plb_v46_0_Sl_MIRQ(14 to 15)
    );

  Ethernet_MAC : ethernet_mac_wrapper
    port map (
      PHY_tx_clk => fpga_0_Ethernet_MAC_PHY_tx_clk_pin,
      PHY_rx_clk => fpga_0_Ethernet_MAC_PHY_rx_clk_pin,
      PHY_crs => fpga_0_Ethernet_MAC_PHY_crs_pin,
      PHY_dv => fpga_0_Ethernet_MAC_PHY_dv_pin,
      PHY_rx_data => fpga_0_Ethernet_MAC_PHY_rx_data_pin,
      PHY_col => fpga_0_Ethernet_MAC_PHY_col_pin,
      PHY_rx_er => fpga_0_Ethernet_MAC_PHY_rx_er_pin,
      PHY_rst_n => fpga_0_Ethernet_MAC_PHY_rst_n_pin,
      PHY_tx_en => fpga_0_Ethernet_MAC_PHY_tx_en_pin,
      PHY_tx_data => fpga_0_Ethernet_MAC_PHY_tx_data_pin,
      PHY_MDC => fpga_0_Ethernet_MAC_PHY_MDC_pin,
      PHY_MDIO_I => fpga_0_Ethernet_MAC_PHY_MDIO_pin_I,
      PHY_MDIO_O => fpga_0_Ethernet_MAC_PHY_MDIO_pin_O,
      PHY_MDIO_T => fpga_0_Ethernet_MAC_PHY_MDIO_pin_T,
      IP2INTC_Irpt => Ethernet_MAC_IP2INTC_Irpt,
      SPLB_Clk => clk_100_0000MHzPLL0_ADJUST,
      SPLB_Rst => plb_v46_0_SPLB_Rst(8),
      PLB_ABus => plb_v46_0_PLB_ABus,
      PLB_UABus => plb_v46_0_PLB_UABus,
      PLB_PAValid => plb_v46_0_PLB_PAValid,
      PLB_SAValid => plb_v46_0_PLB_SAValid,
      PLB_rdPrim => plb_v46_0_PLB_rdPrim(8),
      PLB_wrPrim => plb_v46_0_PLB_wrPrim(8),
      PLB_masterID => plb_v46_0_PLB_masterID(0 to 0),
      PLB_abort => plb_v46_0_PLB_abort,
      PLB_busLock => plb_v46_0_PLB_busLock,
      PLB_RNW => plb_v46_0_PLB_RNW,
      PLB_BE => plb_v46_0_PLB_BE,
      PLB_MSize => plb_v46_0_PLB_MSize,
      PLB_size => plb_v46_0_PLB_size,
      PLB_type => plb_v46_0_PLB_type,
      PLB_lockErr => plb_v46_0_PLB_lockErr,
      PLB_wrDBus => plb_v46_0_PLB_wrDBus,
      PLB_wrBurst => plb_v46_0_PLB_wrBurst,
      PLB_rdBurst => plb_v46_0_PLB_rdBurst,
      PLB_wrPendReq => plb_v46_0_PLB_wrPendReq,
      PLB_rdPendReq => plb_v46_0_PLB_rdPendReq,
      PLB_wrPendPri => plb_v46_0_PLB_wrPendPri,
      PLB_rdPendPri => plb_v46_0_PLB_rdPendPri,
      PLB_reqPri => plb_v46_0_PLB_reqPri,
      PLB_TAttribute => plb_v46_0_PLB_TAttribute,
      Sl_addrAck => plb_v46_0_Sl_addrAck(8),
      Sl_SSize => plb_v46_0_Sl_SSize(16 to 17),
      Sl_wait => plb_v46_0_Sl_wait(8),
      Sl_rearbitrate => plb_v46_0_Sl_rearbitrate(8),
      Sl_wrDAck => plb_v46_0_Sl_wrDAck(8),
      Sl_wrComp => plb_v46_0_Sl_wrComp(8),
      Sl_wrBTerm => plb_v46_0_Sl_wrBTerm(8),
      Sl_rdDBus => plb_v46_0_Sl_rdDBus(1024 to 1151),
      Sl_rdWdAddr => plb_v46_0_Sl_rdWdAddr(32 to 35),
      Sl_rdDAck => plb_v46_0_Sl_rdDAck(8),
      Sl_rdComp => plb_v46_0_Sl_rdComp(8),
      Sl_rdBTerm => plb_v46_0_Sl_rdBTerm(8),
      Sl_MBusy => plb_v46_0_Sl_MBusy(16 to 17),
      Sl_MWrErr => plb_v46_0_Sl_MWrErr(16 to 17),
      Sl_MRdErr => plb_v46_0_Sl_MRdErr(16 to 17),
      Sl_MIRQ => plb_v46_0_Sl_MIRQ(16 to 17)
    );

  DDR2_SDRAM : ddr2_sdram_wrapper
    port map (
      mc_mibclk => clk_200_0000MHzPLL0_ADJUST,
      mi_mcclk90 => clk_200_0000MHz90PLL0_ADJUST,
      mi_mcreset => sys_bus_reset(0),
      mi_mcclkdiv2 => clk_100_0000MHzPLL0_ADJUST,
      mi_mcclk_200 => clk_200_0000MHzPLL0_ADJUST,
      mi_mcaddressvalid => ppc440_0_PPC440MC_MIMCADDRESSVALID,
      mi_mcaddress => ppc440_0_PPC440MC_MIMCADDRESS,
      mi_mcbankconflict => ppc440_0_PPC440MC_MIMCBANKCONFLICT,
      mi_mcrowconflict => ppc440_0_PPC440MC_MIMCROWCONFLICT,
      mi_mcbyteenable => ppc440_0_PPC440MC_MIMCBYTEENABLE,
      mi_mcwritedata => ppc440_0_PPC440MC_MIMCWRITEDATA,
      mi_mcreadnotwrite => ppc440_0_PPC440MC_MIMCREADNOTWRITE,
      mi_mcwritedatavalid => ppc440_0_PPC440MC_MIMCWRITEDATAVALID,
      mc_miaddrreadytoaccept => ppc440_0_PPC440MC_MCMIADDRREADYTOACCEPT,
      mc_mireaddata => ppc440_0_PPC440MC_MCMIREADDATA,
      mc_mireaddataerr => ppc440_0_PPC440MC_MCMIREADDATAERR,
      mc_mireaddatavalid => ppc440_0_PPC440MC_MCMIREADDATAVALID,
      idelay_ctrl_rdy_i => net_vcc0,
      idelay_ctrl_rdy => open,
      DDR2_DQ => fpga_0_DDR2_SDRAM_DDR2_DQ_pin,
      DDR2_DQS => fpga_0_DDR2_SDRAM_DDR2_DQS_pin,
      DDR2_DQS_N => fpga_0_DDR2_SDRAM_DDR2_DQS_N_pin,
      DDR2_A => fpga_0_DDR2_SDRAM_DDR2_A_pin,
      DDR2_BA => fpga_0_DDR2_SDRAM_DDR2_BA_pin,
      DDR2_RAS_N => fpga_0_DDR2_SDRAM_DDR2_RAS_N_pin,
      DDR2_CAS_N => fpga_0_DDR2_SDRAM_DDR2_CAS_N_pin,
      DDR2_WE_N => fpga_0_DDR2_SDRAM_DDR2_WE_N_pin,
      DDR2_CS_N => pgassign1(0 to 0),
      DDR2_ODT => fpga_0_DDR2_SDRAM_DDR2_ODT_pin,
      DDR2_CKE => pgassign2(0 to 0),
      DDR2_DM => fpga_0_DDR2_SDRAM_DDR2_DM_pin,
      DDR2_CK => fpga_0_DDR2_SDRAM_DDR2_CK_pin,
      DDR2_CK_N => fpga_0_DDR2_SDRAM_DDR2_CK_N_pin
    );

  SysACE_CompactFlash : sysace_compactflash_wrapper
    port map (
      SPLB_Clk => clk_100_0000MHzPLL0_ADJUST,
      SPLB_Rst => plb_v46_0_SPLB_Rst(9),
      PLB_ABus => plb_v46_0_PLB_ABus,
      PLB_UABus => plb_v46_0_PLB_UABus,
      PLB_PAValid => plb_v46_0_PLB_PAValid,
      PLB_SAValid => plb_v46_0_PLB_SAValid,
      PLB_rdPrim => plb_v46_0_PLB_rdPrim(9),
      PLB_wrPrim => plb_v46_0_PLB_wrPrim(9),
      PLB_masterID => plb_v46_0_PLB_masterID(0 to 0),
      PLB_abort => plb_v46_0_PLB_abort,
      PLB_busLock => plb_v46_0_PLB_busLock,
      PLB_RNW => plb_v46_0_PLB_RNW,
      PLB_BE => plb_v46_0_PLB_BE,
      PLB_MSize => plb_v46_0_PLB_MSize,
      PLB_size => plb_v46_0_PLB_size,
      PLB_type => plb_v46_0_PLB_type,
      PLB_lockErr => plb_v46_0_PLB_lockErr,
      PLB_wrDBus => plb_v46_0_PLB_wrDBus,
      PLB_wrBurst => plb_v46_0_PLB_wrBurst,
      PLB_rdBurst => plb_v46_0_PLB_rdBurst,
      PLB_wrPendReq => plb_v46_0_PLB_wrPendReq,
      PLB_rdPendReq => plb_v46_0_PLB_rdPendReq,
      PLB_wrPendPri => plb_v46_0_PLB_wrPendPri,
      PLB_rdPendPri => plb_v46_0_PLB_rdPendPri,
      PLB_reqPri => plb_v46_0_PLB_reqPri,
      PLB_TAttribute => plb_v46_0_PLB_TAttribute,
      Sl_addrAck => plb_v46_0_Sl_addrAck(9),
      Sl_SSize => plb_v46_0_Sl_SSize(18 to 19),
      Sl_wait => plb_v46_0_Sl_wait(9),
      Sl_rearbitrate => plb_v46_0_Sl_rearbitrate(9),
      Sl_wrDAck => plb_v46_0_Sl_wrDAck(9),
      Sl_wrComp => plb_v46_0_Sl_wrComp(9),
      Sl_wrBTerm => plb_v46_0_Sl_wrBTerm(9),
      Sl_rdDBus => plb_v46_0_Sl_rdDBus(1152 to 1279),
      Sl_rdWdAddr => plb_v46_0_Sl_rdWdAddr(36 to 39),
      Sl_rdDAck => plb_v46_0_Sl_rdDAck(9),
      Sl_rdComp => plb_v46_0_Sl_rdComp(9),
      Sl_rdBTerm => plb_v46_0_Sl_rdBTerm(9),
      Sl_MBusy => plb_v46_0_Sl_MBusy(18 to 19),
      Sl_MWrErr => plb_v46_0_Sl_MWrErr(18 to 19),
      Sl_MRdErr => plb_v46_0_Sl_MRdErr(18 to 19),
      Sl_MIRQ => plb_v46_0_Sl_MIRQ(18 to 19),
      SysACE_MPA => fpga_0_SysACE_CompactFlash_SysACE_MPA_pin,
      SysACE_CLK => fpga_0_SysACE_CompactFlash_SysACE_CLK_pin,
      SysACE_MPIRQ => fpga_0_SysACE_CompactFlash_SysACE_MPIRQ_pin,
      SysACE_MPD_I => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_I,
      SysACE_MPD_O => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_O,
      SysACE_MPD_T => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_T,
      SysACE_CEN => fpga_0_SysACE_CompactFlash_SysACE_CEN_pin,
      SysACE_OEN => fpga_0_SysACE_CompactFlash_SysACE_OEN_pin,
      SysACE_WEN => fpga_0_SysACE_CompactFlash_SysACE_WEN_pin,
      SysACE_IRQ => SysACE_CompactFlash_SysACE_IRQ
    );

  FLASH : flash_wrapper
    port map (
      MCH_SPLB_Clk => clk_100_0000MHzPLL0_ADJUST,
      RdClk => clk_100_0000MHzPLL0_ADJUST,
      MCH_SPLB_Rst => plb_v46_0_SPLB_Rst(10),
      MCH0_Access_Control => net_gnd0,
      MCH0_Access_Data => net_gnd32,
      MCH0_Access_Write => net_gnd0,
      MCH0_Access_Full => open,
      MCH0_ReadData_Control => open,
      MCH0_ReadData_Data => open,
      MCH0_ReadData_Read => net_gnd0,
      MCH0_ReadData_Exists => open,
      MCH1_Access_Control => net_gnd0,
      MCH1_Access_Data => net_gnd32,
      MCH1_Access_Write => net_gnd0,
      MCH1_Access_Full => open,
      MCH1_ReadData_Control => open,
      MCH1_ReadData_Data => open,
      MCH1_ReadData_Read => net_gnd0,
      MCH1_ReadData_Exists => open,
      MCH2_Access_Control => net_gnd0,
      MCH2_Access_Data => net_gnd32,
      MCH2_Access_Write => net_gnd0,
      MCH2_Access_Full => open,
      MCH2_ReadData_Control => open,
      MCH2_ReadData_Data => open,
      MCH2_ReadData_Read => net_gnd0,
      MCH2_ReadData_Exists => open,
      MCH3_Access_Control => net_gnd0,
      MCH3_Access_Data => net_gnd32,
      MCH3_Access_Write => net_gnd0,
      MCH3_Access_Full => open,
      MCH3_ReadData_Control => open,
      MCH3_ReadData_Data => open,
      MCH3_ReadData_Read => net_gnd0,
      MCH3_ReadData_Exists => open,
      PLB_ABus => plb_v46_0_PLB_ABus,
      PLB_UABus => plb_v46_0_PLB_UABus,
      PLB_PAValid => plb_v46_0_PLB_PAValid,
      PLB_SAValid => plb_v46_0_PLB_SAValid,
      PLB_rdPrim => plb_v46_0_PLB_rdPrim(10),
      PLB_wrPrim => plb_v46_0_PLB_wrPrim(10),
      PLB_masterID => plb_v46_0_PLB_masterID(0 to 0),
      PLB_abort => plb_v46_0_PLB_abort,
      PLB_busLock => plb_v46_0_PLB_busLock,
      PLB_RNW => plb_v46_0_PLB_RNW,
      PLB_BE => plb_v46_0_PLB_BE,
      PLB_MSize => plb_v46_0_PLB_MSize,
      PLB_size => plb_v46_0_PLB_size,
      PLB_type => plb_v46_0_PLB_type,
      PLB_lockErr => plb_v46_0_PLB_lockErr,
      PLB_wrDBus => plb_v46_0_PLB_wrDBus,
      PLB_wrBurst => plb_v46_0_PLB_wrBurst,
      PLB_rdBurst => plb_v46_0_PLB_rdBurst,
      PLB_wrPendReq => plb_v46_0_PLB_wrPendReq,
      PLB_rdPendReq => plb_v46_0_PLB_rdPendReq,
      PLB_wrPendPri => plb_v46_0_PLB_wrPendPri,
      PLB_rdPendPri => plb_v46_0_PLB_rdPendPri,
      PLB_reqPri => plb_v46_0_PLB_reqPri,
      PLB_TAttribute => plb_v46_0_PLB_TAttribute,
      Sl_addrAck => plb_v46_0_Sl_addrAck(10),
      Sl_SSize => plb_v46_0_Sl_SSize(20 to 21),
      Sl_wait => plb_v46_0_Sl_wait(10),
      Sl_rearbitrate => plb_v46_0_Sl_rearbitrate(10),
      Sl_wrDAck => plb_v46_0_Sl_wrDAck(10),
      Sl_wrComp => plb_v46_0_Sl_wrComp(10),
      Sl_wrBTerm => plb_v46_0_Sl_wrBTerm(10),
      Sl_rdDBus => plb_v46_0_Sl_rdDBus(1280 to 1407),
      Sl_rdWdAddr => plb_v46_0_Sl_rdWdAddr(40 to 43),
      Sl_rdDAck => plb_v46_0_Sl_rdDAck(10),
      Sl_rdComp => plb_v46_0_Sl_rdComp(10),
      Sl_rdBTerm => plb_v46_0_Sl_rdBTerm(10),
      Sl_MBusy => plb_v46_0_Sl_MBusy(20 to 21),
      Sl_MWrErr => plb_v46_0_Sl_MWrErr(20 to 21),
      Sl_MRdErr => plb_v46_0_Sl_MRdErr(20 to 21),
      Sl_MIRQ => plb_v46_0_Sl_MIRQ(20 to 21),
      Mem_DQ_I => fpga_0_FLASH_Mem_DQ_pin_I,
      Mem_DQ_O => fpga_0_FLASH_Mem_DQ_pin_O,
      Mem_DQ_T => fpga_0_FLASH_Mem_DQ_pin_T,
      Mem_A => pgassign7,
      Mem_RPN => open,
      Mem_CEN => pgassign3(0 to 0),
      Mem_OEN => pgassign4(0 to 0),
      Mem_WEN => fpga_0_FLASH_Mem_WEN_pin,
      Mem_QWEN => open,
      Mem_BEN => open,
      Mem_CE => open,
      Mem_ADV_LDN => fpga_0_FLASH_Mem_ADV_LDN_pin,
      Mem_LBON => open,
      Mem_CKEN => open,
      Mem_RNW => open
    );

  xps_timebase_wdt_0 : xps_timebase_wdt_0_wrapper
    port map (
      WDT_Reset => open,
      Timebase_Interrupt => xps_timebase_wdt_0_Timebase_Interrupt,
      WDT_Interrupt => xps_timebase_wdt_0_WDT_Interrupt,
      SPLB_Clk => clk_100_0000MHzPLL0_ADJUST,
      SPLB_Rst => plb_v46_0_SPLB_Rst(11),
      PLB_ABus => plb_v46_0_PLB_ABus,
      PLB_PAValid => plb_v46_0_PLB_PAValid,
      PLB_masterID => plb_v46_0_PLB_masterID(0 to 0),
      PLB_RNW => plb_v46_0_PLB_RNW,
      PLB_BE => plb_v46_0_PLB_BE,
      PLB_size => plb_v46_0_PLB_size,
      PLB_type => plb_v46_0_PLB_type,
      PLB_wrDBus => plb_v46_0_PLB_wrDBus,
      Sl_addrAck => plb_v46_0_Sl_addrAck(11),
      Sl_SSize => plb_v46_0_Sl_SSize(22 to 23),
      Sl_wait => plb_v46_0_Sl_wait(11),
      Sl_rearbitrate => plb_v46_0_Sl_rearbitrate(11),
      Sl_wrDAck => plb_v46_0_Sl_wrDAck(11),
      Sl_wrComp => plb_v46_0_Sl_wrComp(11),
      Sl_rdDBus => plb_v46_0_Sl_rdDBus(1408 to 1535),
      Sl_rdDAck => plb_v46_0_Sl_rdDAck(11),
      Sl_rdComp => plb_v46_0_Sl_rdComp(11),
      Sl_MBusy => plb_v46_0_Sl_MBusy(22 to 23),
      Sl_MWrErr => plb_v46_0_Sl_MWrErr(22 to 23),
      Sl_MRdErr => plb_v46_0_Sl_MRdErr(22 to 23),
      PLB_UABus => plb_v46_0_PLB_UABus,
      PLB_SAValid => plb_v46_0_PLB_SAValid,
      PLB_rdPrim => plb_v46_0_PLB_rdPrim(11),
      PLB_wrPrim => plb_v46_0_PLB_wrPrim(11),
      PLB_abort => plb_v46_0_PLB_abort,
      PLB_busLock => plb_v46_0_PLB_busLock,
      PLB_MSize => plb_v46_0_PLB_MSize,
      PLB_lockErr => plb_v46_0_PLB_lockErr,
      PLB_wrBurst => plb_v46_0_PLB_wrBurst,
      PLB_rdBurst => plb_v46_0_PLB_rdBurst,
      PLB_wrPendReq => plb_v46_0_PLB_wrPendReq,
      PLB_rdPendReq => plb_v46_0_PLB_rdPendReq,
      PLB_wrPendPri => plb_v46_0_PLB_wrPendPri,
      PLB_rdPendPri => plb_v46_0_PLB_rdPendPri,
      PLB_reqPri => plb_v46_0_PLB_reqPri,
      PLB_TAttribute => plb_v46_0_PLB_TAttribute,
      Sl_wrBTerm => plb_v46_0_Sl_wrBTerm(11),
      Sl_rdWdAddr => plb_v46_0_Sl_rdWdAddr(44 to 47),
      Sl_rdBTerm => plb_v46_0_Sl_rdBTerm(11),
      Sl_MIRQ => plb_v46_0_Sl_MIRQ(22 to 23)
    );

  xps_timer_0 : xps_timer_0_wrapper
    port map (
      CaptureTrig0 => net_gnd0,
      CaptureTrig1 => net_gnd0,
      GenerateOut0 => open,
      GenerateOut1 => open,
      PWM0 => open,
      Interrupt => xps_timer_0_Interrupt,
      Freeze => net_gnd0,
      SPLB_Clk => clk_100_0000MHzPLL0_ADJUST,
      SPLB_Rst => plb_v46_0_SPLB_Rst(12),
      PLB_ABus => plb_v46_0_PLB_ABus,
      PLB_PAValid => plb_v46_0_PLB_PAValid,
      PLB_masterID => plb_v46_0_PLB_masterID(0 to 0),
      PLB_RNW => plb_v46_0_PLB_RNW,
      PLB_BE => plb_v46_0_PLB_BE,
      PLB_size => plb_v46_0_PLB_size,
      PLB_type => plb_v46_0_PLB_type,
      PLB_wrDBus => plb_v46_0_PLB_wrDBus,
      Sl_addrAck => plb_v46_0_Sl_addrAck(12),
      Sl_SSize => plb_v46_0_Sl_SSize(24 to 25),
      Sl_wait => plb_v46_0_Sl_wait(12),
      Sl_rearbitrate => plb_v46_0_Sl_rearbitrate(12),
      Sl_wrDAck => plb_v46_0_Sl_wrDAck(12),
      Sl_wrComp => plb_v46_0_Sl_wrComp(12),
      Sl_rdDBus => plb_v46_0_Sl_rdDBus(1536 to 1663),
      Sl_rdDAck => plb_v46_0_Sl_rdDAck(12),
      Sl_rdComp => plb_v46_0_Sl_rdComp(12),
      Sl_MBusy => plb_v46_0_Sl_MBusy(24 to 25),
      Sl_MWrErr => plb_v46_0_Sl_MWrErr(24 to 25),
      Sl_MRdErr => plb_v46_0_Sl_MRdErr(24 to 25),
      PLB_UABus => plb_v46_0_PLB_UABus,
      PLB_SAValid => plb_v46_0_PLB_SAValid,
      PLB_rdPrim => plb_v46_0_PLB_rdPrim(12),
      PLB_wrPrim => plb_v46_0_PLB_wrPrim(12),
      PLB_abort => plb_v46_0_PLB_abort,
      PLB_busLock => plb_v46_0_PLB_busLock,
      PLB_MSize => plb_v46_0_PLB_MSize,
      PLB_lockErr => plb_v46_0_PLB_lockErr,
      PLB_wrBurst => plb_v46_0_PLB_wrBurst,
      PLB_rdBurst => plb_v46_0_PLB_rdBurst,
      PLB_wrPendReq => plb_v46_0_PLB_wrPendReq,
      PLB_rdPendReq => plb_v46_0_PLB_rdPendReq,
      PLB_wrPendPri => plb_v46_0_PLB_wrPendPri,
      PLB_rdPendPri => plb_v46_0_PLB_rdPendPri,
      PLB_reqPri => plb_v46_0_PLB_reqPri,
      PLB_TAttribute => plb_v46_0_PLB_TAttribute,
      Sl_wrBTerm => plb_v46_0_Sl_wrBTerm(12),
      Sl_rdWdAddr => plb_v46_0_Sl_rdWdAddr(48 to 51),
      Sl_rdBTerm => plb_v46_0_Sl_rdBTerm(12),
      Sl_MIRQ => plb_v46_0_Sl_MIRQ(24 to 25)
    );

  clock_generator_0 : clock_generator_0_wrapper
    port map (
      CLKIN => dcm_clk_s,
      CLKOUT0 => clk_100_0000MHzPLL0_ADJUST,
      CLKOUT1 => clk_200_0000MHz90PLL0_ADJUST,
      CLKOUT2 => clk_200_0000MHzPLL0,
      CLKOUT3 => clk_200_0000MHzPLL0_ADJUST,
      CLKOUT4 => clk_400_0000MHzPLL0,
      CLKOUT5 => clk_25_0000MHz,
      CLKOUT6 => open,
      CLKOUT7 => open,
      CLKOUT8 => open,
      CLKOUT9 => open,
      CLKOUT10 => open,
      CLKOUT11 => open,
      CLKOUT12 => open,
      CLKOUT13 => open,
      CLKOUT14 => open,
      CLKOUT15 => open,
      CLKFBIN => net_gnd0,
      CLKFBOUT => open,
      PSCLK => net_gnd0,
      PSEN => net_gnd0,
      PSINCDEC => net_gnd0,
      PSDONE => open,
      RST => sys_rst_s,
      LOCKED => Dcm_all_locked
    );

  jtagppc_cntlr_inst : jtagppc_cntlr_inst_wrapper
    port map (
      TRSTNEG => net_vcc0,
      HALTNEG0 => net_vcc0,
      DBGC405DEBUGHALT0 => open,
      HALTNEG1 => net_vcc0,
      DBGC405DEBUGHALT1 => open,
      C405JTGTDO0 => ppc440_0_jtagppc_bus_C405JTGTDO,
      C405JTGTDOEN0 => ppc440_0_jtagppc_bus_C405JTGTDOEN,
      JTGC405TCK0 => ppc440_0_jtagppc_bus_JTGC405TCK,
      JTGC405TDI0 => ppc440_0_jtagppc_bus_JTGC405TDI,
      JTGC405TMS0 => ppc440_0_jtagppc_bus_JTGC405TMS,
      JTGC405TRSTNEG0 => ppc440_0_jtagppc_bus_JTGC405TRSTNEG,
      C405JTGTDO1 => net_gnd0,
      C405JTGTDOEN1 => net_gnd0,
      JTGC405TCK1 => open,
      JTGC405TDI1 => open,
      JTGC405TMS1 => open,
      JTGC405TRSTNEG1 => open
    );

  proc_sys_reset_0 : proc_sys_reset_0_wrapper
    port map (
      Slowest_sync_clk => clk_100_0000MHzPLL0_ADJUST,
      Ext_Reset_In => sys_rst_s,
      Aux_Reset_In => net_gnd0,
      MB_Debug_Sys_Rst => net_gnd0,
      Core_Reset_Req_0 => ppc_reset_bus_Core_Reset_Req,
      Chip_Reset_Req_0 => ppc_reset_bus_Chip_Reset_Req,
      System_Reset_Req_0 => ppc_reset_bus_System_Reset_Req,
      Core_Reset_Req_1 => net_gnd0,
      Chip_Reset_Req_1 => net_gnd0,
      System_Reset_Req_1 => net_gnd0,
      Dcm_locked => Dcm_all_locked,
      RstcPPCresetcore_0 => ppc_reset_bus_RstcPPCresetcore,
      RstcPPCresetchip_0 => ppc_reset_bus_RstsPPCresetchip,
      RstcPPCresetsys_0 => ppc_reset_bus_RstcPPCresetsys,
      RstcPPCresetcore_1 => open,
      RstcPPCresetchip_1 => open,
      RstcPPCresetsys_1 => open,
      MB_Reset => open,
      Bus_Struct_Reset => sys_bus_reset(0 to 0),
      Peripheral_Reset => open
    );

  xps_intc_0 : xps_intc_0_wrapper
    port map (
      SPLB_Clk => clk_100_0000MHzPLL0_ADJUST,
      SPLB_Rst => plb_v46_0_SPLB_Rst(13),
      PLB_ABus => plb_v46_0_PLB_ABus,
      PLB_PAValid => plb_v46_0_PLB_PAValid,
      PLB_masterID => plb_v46_0_PLB_masterID(0 to 0),
      PLB_RNW => plb_v46_0_PLB_RNW,
      PLB_BE => plb_v46_0_PLB_BE,
      PLB_size => plb_v46_0_PLB_size,
      PLB_type => plb_v46_0_PLB_type,
      PLB_wrDBus => plb_v46_0_PLB_wrDBus,
      PLB_UABus => plb_v46_0_PLB_UABus,
      PLB_SAValid => plb_v46_0_PLB_SAValid,
      PLB_rdPrim => plb_v46_0_PLB_rdPrim(13),
      PLB_wrPrim => plb_v46_0_PLB_wrPrim(13),
      PLB_abort => plb_v46_0_PLB_abort,
      PLB_busLock => plb_v46_0_PLB_busLock,
      PLB_MSize => plb_v46_0_PLB_MSize,
      PLB_lockErr => plb_v46_0_PLB_lockErr,
      PLB_wrBurst => plb_v46_0_PLB_wrBurst,
      PLB_rdBurst => plb_v46_0_PLB_rdBurst,
      PLB_wrPendReq => plb_v46_0_PLB_wrPendReq,
      PLB_rdPendReq => plb_v46_0_PLB_rdPendReq,
      PLB_wrPendPri => plb_v46_0_PLB_wrPendPri,
      PLB_rdPendPri => plb_v46_0_PLB_rdPendPri,
      PLB_reqPri => plb_v46_0_PLB_reqPri,
      PLB_TAttribute => plb_v46_0_PLB_TAttribute,
      Sl_addrAck => plb_v46_0_Sl_addrAck(13),
      Sl_SSize => plb_v46_0_Sl_SSize(26 to 27),
      Sl_wait => plb_v46_0_Sl_wait(13),
      Sl_rearbitrate => plb_v46_0_Sl_rearbitrate(13),
      Sl_wrDAck => plb_v46_0_Sl_wrDAck(13),
      Sl_wrComp => plb_v46_0_Sl_wrComp(13),
      Sl_rdDBus => plb_v46_0_Sl_rdDBus(1664 to 1791),
      Sl_rdDAck => plb_v46_0_Sl_rdDAck(13),
      Sl_rdComp => plb_v46_0_Sl_rdComp(13),
      Sl_MBusy => plb_v46_0_Sl_MBusy(26 to 27),
      Sl_MWrErr => plb_v46_0_Sl_MWrErr(26 to 27),
      Sl_MRdErr => plb_v46_0_Sl_MRdErr(26 to 27),
      Sl_wrBTerm => plb_v46_0_Sl_wrBTerm(13),
      Sl_rdWdAddr => plb_v46_0_Sl_rdWdAddr(52 to 55),
      Sl_rdBTerm => plb_v46_0_Sl_rdBTerm(13),
      Sl_MIRQ => plb_v46_0_Sl_MIRQ(26 to 27),
      Intr => pgassign8,
      Irq => ppc440_0_EICC440EXTIRQ
    );

  xps_tft_0 : xps_tft_0_wrapper
    port map (
      SPLB_Clk => clk_100_0000MHzPLL0_ADJUST,
      SPLB_Rst => plb_v46_0_SPLB_Rst(14),
      MPLB_Clk => clk_100_0000MHzPLL0_ADJUST,
      MPLB_Rst => plb_v46_0_MPLB_Rst(1),
      MD_error => open,
      IP2INTC_Irpt => xps_tft_0_IP2INTC_Irpt,
      M_request => plb_v46_0_M_request(1),
      M_priority => plb_v46_0_M_priority(2 to 3),
      M_busLock => plb_v46_0_M_busLock(1),
      M_RNW => plb_v46_0_M_RNW(1),
      M_BE => plb_v46_0_M_BE(16 to 31),
      M_MSize => plb_v46_0_M_MSize(2 to 3),
      M_size => plb_v46_0_M_size(4 to 7),
      M_type => plb_v46_0_M_type(3 to 5),
      M_ABus => plb_v46_0_M_ABus(32 to 63),
      M_wrBurst => plb_v46_0_M_wrBurst(1),
      M_rdBurst => plb_v46_0_M_rdBurst(1),
      M_wrDBus => plb_v46_0_M_wrDBus(128 to 255),
      PLB_MSSize => plb_v46_0_PLB_MSSize(2 to 3),
      PLB_MAddrAck => plb_v46_0_PLB_MAddrAck(1),
      PLB_MRearbitrate => plb_v46_0_PLB_MRearbitrate(1),
      PLB_MTimeout => plb_v46_0_PLB_MTimeout(1),
      PLB_MRdErr => plb_v46_0_PLB_MRdErr(1),
      PLB_MWrErr => plb_v46_0_PLB_MWrErr(1),
      PLB_MRdDBus => plb_v46_0_PLB_MRdDBus(128 to 255),
      PLB_MRdDAck => plb_v46_0_PLB_MRdDAck(1),
      PLB_MWrDAck => plb_v46_0_PLB_MWrDAck(1),
      PLB_MRdBTerm => plb_v46_0_PLB_MRdBTerm(1),
      PLB_MWrBTerm => plb_v46_0_PLB_MWrBTerm(1),
      M_TAttribute => plb_v46_0_M_TAttribute(16 to 31),
      M_lockErr => plb_v46_0_M_lockErr(1),
      M_abort => plb_v46_0_M_abort(1),
      M_UABus => plb_v46_0_M_UABus(32 to 63),
      PLB_MBusy => plb_v46_0_PLB_MBusy(1),
      PLB_MIRQ => plb_v46_0_PLB_MIRQ(1),
      PLB_MRdWdAddr => plb_v46_0_PLB_MRdWdAddr(4 to 7),
      PLB_ABus => plb_v46_0_PLB_ABus,
      PLB_PAValid => plb_v46_0_PLB_PAValid,
      PLB_masterID => plb_v46_0_PLB_masterID(0 to 0),
      PLB_RNW => plb_v46_0_PLB_RNW,
      PLB_BE => plb_v46_0_PLB_BE,
      PLB_size => plb_v46_0_PLB_size,
      PLB_type => plb_v46_0_PLB_type,
      PLB_wrDBus => plb_v46_0_PLB_wrDBus,
      Sl_addrAck => plb_v46_0_Sl_addrAck(14),
      Sl_SSize => plb_v46_0_Sl_SSize(28 to 29),
      Sl_wait => plb_v46_0_Sl_wait(14),
      Sl_rearbitrate => plb_v46_0_Sl_rearbitrate(14),
      Sl_wrDAck => plb_v46_0_Sl_wrDAck(14),
      Sl_wrComp => plb_v46_0_Sl_wrComp(14),
      Sl_rdDBus => plb_v46_0_Sl_rdDBus(1792 to 1919),
      Sl_rdDAck => plb_v46_0_Sl_rdDAck(14),
      Sl_rdComp => plb_v46_0_Sl_rdComp(14),
      Sl_MBusy => plb_v46_0_Sl_MBusy(28 to 29),
      Sl_MWrErr => plb_v46_0_Sl_MWrErr(28 to 29),
      Sl_MRdErr => plb_v46_0_Sl_MRdErr(28 to 29),
      PLB_UABus => plb_v46_0_PLB_UABus,
      PLB_SAValid => plb_v46_0_PLB_SAValid,
      PLB_rdPrim => plb_v46_0_PLB_rdPrim(14),
      PLB_wrPrim => plb_v46_0_PLB_wrPrim(14),
      PLB_abort => plb_v46_0_PLB_abort,
      PLB_busLock => plb_v46_0_PLB_busLock,
      PLB_MSize => plb_v46_0_PLB_MSize,
      PLB_lockErr => plb_v46_0_PLB_lockErr,
      PLB_wrBurst => plb_v46_0_PLB_wrBurst,
      PLB_rdBurst => plb_v46_0_PLB_rdBurst,
      PLB_wrPendReq => plb_v46_0_PLB_wrPendReq,
      PLB_rdPendReq => plb_v46_0_PLB_rdPendReq,
      PLB_wrPendPri => plb_v46_0_PLB_wrPendPri,
      PLB_rdPendPri => plb_v46_0_PLB_rdPendPri,
      PLB_reqPri => plb_v46_0_PLB_reqPri,
      PLB_TAttribute => plb_v46_0_PLB_TAttribute,
      Sl_wrBTerm => plb_v46_0_Sl_wrBTerm(14),
      Sl_rdWdAddr => plb_v46_0_Sl_rdWdAddr(56 to 59),
      Sl_rdBTerm => plb_v46_0_Sl_rdBTerm(14),
      Sl_MIRQ => plb_v46_0_Sl_MIRQ(28 to 29),
      DCR_Clk => net_gnd0,
      DCR_Rst => net_gnd0,
      DCR_Read => net_gnd0,
      DCR_Write => net_gnd0,
      DCR_ABus => net_gnd10,
      DCR_Sl_DBus => net_gnd32,
      Sl_DCRDBus => open,
      Sl_DCRAck => open,
      SYS_TFT_Clk => clk_25_0000MHz,
      TFT_HSYNC => xps_tft_0_TFT_HSYNC,
      TFT_VSYNC => xps_tft_0_TFT_VSYNC,
      TFT_DE => xps_tft_0_TFT_DE,
      TFT_DPS => open,
      TFT_VGA_CLK => open,
      TFT_VGA_R => open,
      TFT_VGA_G => open,
      TFT_VGA_B => open,
      TFT_DVI_CLK_P => xps_tft_0_TFT_DVI_CLK_P,
      TFT_DVI_CLK_N => xps_tft_0_TFT_DVI_CLK_N,
      TFT_DVI_DATA => xps_tft_0_TFT_DVI_DATA,
      TFT_IIC_SCL_I => xps_tft_0_TFT_IIC_SCL_I,
      TFT_IIC_SCL_O => xps_tft_0_TFT_IIC_SCL_O,
      TFT_IIC_SCL_T => xps_tft_0_TFT_IIC_SCL_T,
      TFT_IIC_SDA_I => xps_tft_0_TFT_IIC_SDA_I,
      TFT_IIC_SDA_O => xps_tft_0_TFT_IIC_SDA_O,
      TFT_IIC_SDA_T => xps_tft_0_TFT_IIC_SDA_T
    );

  xps_ps2_0 : xps_ps2_0_wrapper
    port map (
      SPLB_Clk => clk_100_0000MHzPLL0_ADJUST,
      SPLB_Rst => plb_v46_0_SPLB_Rst(15),
      PLB_ABus => plb_v46_0_PLB_ABus,
      PLB_UABus => plb_v46_0_PLB_UABus,
      PLB_PAValid => plb_v46_0_PLB_PAValid,
      PLB_SAValid => plb_v46_0_PLB_SAValid,
      PLB_rdPrim => plb_v46_0_PLB_rdPrim(15),
      PLB_wrPrim => plb_v46_0_PLB_wrPrim(15),
      PLB_masterID => plb_v46_0_PLB_masterID(0 to 0),
      PLB_abort => plb_v46_0_PLB_abort,
      PLB_busLock => plb_v46_0_PLB_busLock,
      PLB_RNW => plb_v46_0_PLB_RNW,
      PLB_BE => plb_v46_0_PLB_BE,
      PLB_MSize => plb_v46_0_PLB_MSize,
      PLB_size => plb_v46_0_PLB_size,
      PLB_type => plb_v46_0_PLB_type,
      PLB_lockErr => plb_v46_0_PLB_lockErr,
      PLB_wrDBus => plb_v46_0_PLB_wrDBus,
      PLB_wrBurst => plb_v46_0_PLB_wrBurst,
      PLB_rdBurst => plb_v46_0_PLB_rdBurst,
      PLB_wrPendReq => plb_v46_0_PLB_wrPendReq,
      PLB_rdPendReq => plb_v46_0_PLB_rdPendReq,
      PLB_wrPendPri => plb_v46_0_PLB_wrPendPri,
      PLB_rdPendPri => plb_v46_0_PLB_rdPendPri,
      PLB_reqPri => plb_v46_0_PLB_reqPri,
      PLB_TAttribute => plb_v46_0_PLB_TAttribute,
      Sl_addrAck => plb_v46_0_Sl_addrAck(15),
      Sl_SSize => plb_v46_0_Sl_SSize(30 to 31),
      Sl_wait => plb_v46_0_Sl_wait(15),
      Sl_rearbitrate => plb_v46_0_Sl_rearbitrate(15),
      Sl_wrDAck => plb_v46_0_Sl_wrDAck(15),
      Sl_wrComp => plb_v46_0_Sl_wrComp(15),
      Sl_wrBTerm => plb_v46_0_Sl_wrBTerm(15),
      Sl_rdDBus => plb_v46_0_Sl_rdDBus(1920 to 2047),
      Sl_rdWdAddr => plb_v46_0_Sl_rdWdAddr(60 to 63),
      Sl_rdDAck => plb_v46_0_Sl_rdDAck(15),
      Sl_rdComp => plb_v46_0_Sl_rdComp(15),
      Sl_rdBTerm => plb_v46_0_Sl_rdBTerm(15),
      Sl_MBusy => plb_v46_0_Sl_MBusy(30 to 31),
      Sl_MWrErr => plb_v46_0_Sl_MWrErr(30 to 31),
      Sl_MRdErr => plb_v46_0_Sl_MRdErr(30 to 31),
      Sl_MIRQ => plb_v46_0_Sl_MIRQ(30 to 31),
      IP2INTC_Irpt_1 => xps_ps2_0_IP2INTC_Irpt_1,
      IP2INTC_Irpt_2 => xps_ps2_0_IP2INTC_Irpt_2,
      PS2_1_DATA_I => xps_ps2_0_PS2_1_DATA_I,
      PS2_1_DATA_O => xps_ps2_0_PS2_1_DATA_O,
      PS2_1_DATA_T => xps_ps2_0_PS2_1_DATA_T,
      PS2_1_CLK_I => xps_ps2_0_PS2_1_CLK_I,
      PS2_1_CLK_O => xps_ps2_0_PS2_1_CLK_O,
      PS2_1_CLK_T => xps_ps2_0_PS2_1_CLK_T,
      PS2_2_DATA_I => xps_ps2_0_PS2_2_DATA_I,
      PS2_2_DATA_O => xps_ps2_0_PS2_2_DATA_O,
      PS2_2_DATA_T => xps_ps2_0_PS2_2_DATA_T,
      PS2_2_CLK_I => xps_ps2_0_PS2_2_CLK_I,
      PS2_2_CLK_O => xps_ps2_0_PS2_2_CLK_O,
      PS2_2_CLK_T => xps_ps2_0_PS2_2_CLK_T
    );

  iobuf_0 : IOBUF
    port map (
      I => fpga_0_LEDs_8Bit_GPIO_IO_pin_O(0),
      IO => fpga_0_LEDs_8Bit_GPIO_IO_pin(0),
      O => fpga_0_LEDs_8Bit_GPIO_IO_pin_I(0),
      T => fpga_0_LEDs_8Bit_GPIO_IO_pin_T(0)
    );

  iobuf_1 : IOBUF
    port map (
      I => fpga_0_LEDs_8Bit_GPIO_IO_pin_O(1),
      IO => fpga_0_LEDs_8Bit_GPIO_IO_pin(1),
      O => fpga_0_LEDs_8Bit_GPIO_IO_pin_I(1),
      T => fpga_0_LEDs_8Bit_GPIO_IO_pin_T(1)
    );

  iobuf_2 : IOBUF
    port map (
      I => fpga_0_LEDs_8Bit_GPIO_IO_pin_O(2),
      IO => fpga_0_LEDs_8Bit_GPIO_IO_pin(2),
      O => fpga_0_LEDs_8Bit_GPIO_IO_pin_I(2),
      T => fpga_0_LEDs_8Bit_GPIO_IO_pin_T(2)
    );

  iobuf_3 : IOBUF
    port map (
      I => fpga_0_LEDs_8Bit_GPIO_IO_pin_O(3),
      IO => fpga_0_LEDs_8Bit_GPIO_IO_pin(3),
      O => fpga_0_LEDs_8Bit_GPIO_IO_pin_I(3),
      T => fpga_0_LEDs_8Bit_GPIO_IO_pin_T(3)
    );

  iobuf_4 : IOBUF
    port map (
      I => fpga_0_LEDs_8Bit_GPIO_IO_pin_O(4),
      IO => fpga_0_LEDs_8Bit_GPIO_IO_pin(4),
      O => fpga_0_LEDs_8Bit_GPIO_IO_pin_I(4),
      T => fpga_0_LEDs_8Bit_GPIO_IO_pin_T(4)
    );

  iobuf_5 : IOBUF
    port map (
      I => fpga_0_LEDs_8Bit_GPIO_IO_pin_O(5),
      IO => fpga_0_LEDs_8Bit_GPIO_IO_pin(5),
      O => fpga_0_LEDs_8Bit_GPIO_IO_pin_I(5),
      T => fpga_0_LEDs_8Bit_GPIO_IO_pin_T(5)
    );

  iobuf_6 : IOBUF
    port map (
      I => fpga_0_LEDs_8Bit_GPIO_IO_pin_O(6),
      IO => fpga_0_LEDs_8Bit_GPIO_IO_pin(6),
      O => fpga_0_LEDs_8Bit_GPIO_IO_pin_I(6),
      T => fpga_0_LEDs_8Bit_GPIO_IO_pin_T(6)
    );

  iobuf_7 : IOBUF
    port map (
      I => fpga_0_LEDs_8Bit_GPIO_IO_pin_O(7),
      IO => fpga_0_LEDs_8Bit_GPIO_IO_pin(7),
      O => fpga_0_LEDs_8Bit_GPIO_IO_pin_I(7),
      T => fpga_0_LEDs_8Bit_GPIO_IO_pin_T(7)
    );

  iobuf_8 : IOBUF
    port map (
      I => fpga_0_LEDs_Positions_GPIO_IO_pin_O(0),
      IO => fpga_0_LEDs_Positions_GPIO_IO_pin(0),
      O => fpga_0_LEDs_Positions_GPIO_IO_pin_I(0),
      T => fpga_0_LEDs_Positions_GPIO_IO_pin_T(0)
    );

  iobuf_9 : IOBUF
    port map (
      I => fpga_0_LEDs_Positions_GPIO_IO_pin_O(1),
      IO => fpga_0_LEDs_Positions_GPIO_IO_pin(1),
      O => fpga_0_LEDs_Positions_GPIO_IO_pin_I(1),
      T => fpga_0_LEDs_Positions_GPIO_IO_pin_T(1)
    );

  iobuf_10 : IOBUF
    port map (
      I => fpga_0_LEDs_Positions_GPIO_IO_pin_O(2),
      IO => fpga_0_LEDs_Positions_GPIO_IO_pin(2),
      O => fpga_0_LEDs_Positions_GPIO_IO_pin_I(2),
      T => fpga_0_LEDs_Positions_GPIO_IO_pin_T(2)
    );

  iobuf_11 : IOBUF
    port map (
      I => fpga_0_LEDs_Positions_GPIO_IO_pin_O(3),
      IO => fpga_0_LEDs_Positions_GPIO_IO_pin(3),
      O => fpga_0_LEDs_Positions_GPIO_IO_pin_I(3),
      T => fpga_0_LEDs_Positions_GPIO_IO_pin_T(3)
    );

  iobuf_12 : IOBUF
    port map (
      I => fpga_0_LEDs_Positions_GPIO_IO_pin_O(4),
      IO => fpga_0_LEDs_Positions_GPIO_IO_pin(4),
      O => fpga_0_LEDs_Positions_GPIO_IO_pin_I(4),
      T => fpga_0_LEDs_Positions_GPIO_IO_pin_T(4)
    );

  iobuf_13 : IOBUF
    port map (
      I => fpga_0_Push_Buttons_5Bit_GPIO_IO_pin_O(0),
      IO => fpga_0_Push_Buttons_5Bit_GPIO_IO_pin(0),
      O => fpga_0_Push_Buttons_5Bit_GPIO_IO_pin_I(0),
      T => fpga_0_Push_Buttons_5Bit_GPIO_IO_pin_T(0)
    );

  iobuf_14 : IOBUF
    port map (
      I => fpga_0_Push_Buttons_5Bit_GPIO_IO_pin_O(1),
      IO => fpga_0_Push_Buttons_5Bit_GPIO_IO_pin(1),
      O => fpga_0_Push_Buttons_5Bit_GPIO_IO_pin_I(1),
      T => fpga_0_Push_Buttons_5Bit_GPIO_IO_pin_T(1)
    );

  iobuf_15 : IOBUF
    port map (
      I => fpga_0_Push_Buttons_5Bit_GPIO_IO_pin_O(2),
      IO => fpga_0_Push_Buttons_5Bit_GPIO_IO_pin(2),
      O => fpga_0_Push_Buttons_5Bit_GPIO_IO_pin_I(2),
      T => fpga_0_Push_Buttons_5Bit_GPIO_IO_pin_T(2)
    );

  iobuf_16 : IOBUF
    port map (
      I => fpga_0_Push_Buttons_5Bit_GPIO_IO_pin_O(3),
      IO => fpga_0_Push_Buttons_5Bit_GPIO_IO_pin(3),
      O => fpga_0_Push_Buttons_5Bit_GPIO_IO_pin_I(3),
      T => fpga_0_Push_Buttons_5Bit_GPIO_IO_pin_T(3)
    );

  iobuf_17 : IOBUF
    port map (
      I => fpga_0_Push_Buttons_5Bit_GPIO_IO_pin_O(4),
      IO => fpga_0_Push_Buttons_5Bit_GPIO_IO_pin(4),
      O => fpga_0_Push_Buttons_5Bit_GPIO_IO_pin_I(4),
      T => fpga_0_Push_Buttons_5Bit_GPIO_IO_pin_T(4)
    );

  iobuf_18 : IOBUF
    port map (
      I => fpga_0_DIP_Switches_8Bit_GPIO_IO_pin_O(0),
      IO => fpga_0_DIP_Switches_8Bit_GPIO_IO_pin(0),
      O => fpga_0_DIP_Switches_8Bit_GPIO_IO_pin_I(0),
      T => fpga_0_DIP_Switches_8Bit_GPIO_IO_pin_T(0)
    );

  iobuf_19 : IOBUF
    port map (
      I => fpga_0_DIP_Switches_8Bit_GPIO_IO_pin_O(1),
      IO => fpga_0_DIP_Switches_8Bit_GPIO_IO_pin(1),
      O => fpga_0_DIP_Switches_8Bit_GPIO_IO_pin_I(1),
      T => fpga_0_DIP_Switches_8Bit_GPIO_IO_pin_T(1)
    );

  iobuf_20 : IOBUF
    port map (
      I => fpga_0_DIP_Switches_8Bit_GPIO_IO_pin_O(2),
      IO => fpga_0_DIP_Switches_8Bit_GPIO_IO_pin(2),
      O => fpga_0_DIP_Switches_8Bit_GPIO_IO_pin_I(2),
      T => fpga_0_DIP_Switches_8Bit_GPIO_IO_pin_T(2)
    );

  iobuf_21 : IOBUF
    port map (
      I => fpga_0_DIP_Switches_8Bit_GPIO_IO_pin_O(3),
      IO => fpga_0_DIP_Switches_8Bit_GPIO_IO_pin(3),
      O => fpga_0_DIP_Switches_8Bit_GPIO_IO_pin_I(3),
      T => fpga_0_DIP_Switches_8Bit_GPIO_IO_pin_T(3)
    );

  iobuf_22 : IOBUF
    port map (
      I => fpga_0_DIP_Switches_8Bit_GPIO_IO_pin_O(4),
      IO => fpga_0_DIP_Switches_8Bit_GPIO_IO_pin(4),
      O => fpga_0_DIP_Switches_8Bit_GPIO_IO_pin_I(4),
      T => fpga_0_DIP_Switches_8Bit_GPIO_IO_pin_T(4)
    );

  iobuf_23 : IOBUF
    port map (
      I => fpga_0_DIP_Switches_8Bit_GPIO_IO_pin_O(5),
      IO => fpga_0_DIP_Switches_8Bit_GPIO_IO_pin(5),
      O => fpga_0_DIP_Switches_8Bit_GPIO_IO_pin_I(5),
      T => fpga_0_DIP_Switches_8Bit_GPIO_IO_pin_T(5)
    );

  iobuf_24 : IOBUF
    port map (
      I => fpga_0_DIP_Switches_8Bit_GPIO_IO_pin_O(6),
      IO => fpga_0_DIP_Switches_8Bit_GPIO_IO_pin(6),
      O => fpga_0_DIP_Switches_8Bit_GPIO_IO_pin_I(6),
      T => fpga_0_DIP_Switches_8Bit_GPIO_IO_pin_T(6)
    );

  iobuf_25 : IOBUF
    port map (
      I => fpga_0_DIP_Switches_8Bit_GPIO_IO_pin_O(7),
      IO => fpga_0_DIP_Switches_8Bit_GPIO_IO_pin(7),
      O => fpga_0_DIP_Switches_8Bit_GPIO_IO_pin_I(7),
      T => fpga_0_DIP_Switches_8Bit_GPIO_IO_pin_T(7)
    );

  iobuf_26 : IOBUF
    port map (
      I => fpga_0_IIC_EEPROM_Sda_pin_O,
      IO => fpga_0_IIC_EEPROM_Sda_pin,
      O => fpga_0_IIC_EEPROM_Sda_pin_I,
      T => fpga_0_IIC_EEPROM_Sda_pin_T
    );

  iobuf_27 : IOBUF
    port map (
      I => fpga_0_IIC_EEPROM_Scl_pin_O,
      IO => fpga_0_IIC_EEPROM_Scl_pin,
      O => fpga_0_IIC_EEPROM_Scl_pin_I,
      T => fpga_0_IIC_EEPROM_Scl_pin_T
    );

  iobuf_28 : IOBUF
    port map (
      I => fpga_0_Ethernet_MAC_PHY_MDIO_pin_O,
      IO => fpga_0_Ethernet_MAC_PHY_MDIO_pin,
      O => fpga_0_Ethernet_MAC_PHY_MDIO_pin_I,
      T => fpga_0_Ethernet_MAC_PHY_MDIO_pin_T
    );

  iobuf_29 : IOBUF
    port map (
      I => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_O(15),
      IO => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin(15),
      O => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_I(15),
      T => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_T(15)
    );

  iobuf_30 : IOBUF
    port map (
      I => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_O(14),
      IO => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin(14),
      O => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_I(14),
      T => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_T(14)
    );

  iobuf_31 : IOBUF
    port map (
      I => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_O(13),
      IO => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin(13),
      O => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_I(13),
      T => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_T(13)
    );

  iobuf_32 : IOBUF
    port map (
      I => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_O(12),
      IO => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin(12),
      O => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_I(12),
      T => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_T(12)
    );

  iobuf_33 : IOBUF
    port map (
      I => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_O(11),
      IO => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin(11),
      O => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_I(11),
      T => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_T(11)
    );

  iobuf_34 : IOBUF
    port map (
      I => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_O(10),
      IO => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin(10),
      O => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_I(10),
      T => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_T(10)
    );

  iobuf_35 : IOBUF
    port map (
      I => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_O(9),
      IO => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin(9),
      O => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_I(9),
      T => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_T(9)
    );

  iobuf_36 : IOBUF
    port map (
      I => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_O(8),
      IO => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin(8),
      O => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_I(8),
      T => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_T(8)
    );

  iobuf_37 : IOBUF
    port map (
      I => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_O(7),
      IO => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin(7),
      O => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_I(7),
      T => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_T(7)
    );

  iobuf_38 : IOBUF
    port map (
      I => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_O(6),
      IO => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin(6),
      O => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_I(6),
      T => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_T(6)
    );

  iobuf_39 : IOBUF
    port map (
      I => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_O(5),
      IO => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin(5),
      O => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_I(5),
      T => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_T(5)
    );

  iobuf_40 : IOBUF
    port map (
      I => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_O(4),
      IO => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin(4),
      O => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_I(4),
      T => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_T(4)
    );

  iobuf_41 : IOBUF
    port map (
      I => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_O(3),
      IO => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin(3),
      O => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_I(3),
      T => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_T(3)
    );

  iobuf_42 : IOBUF
    port map (
      I => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_O(2),
      IO => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin(2),
      O => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_I(2),
      T => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_T(2)
    );

  iobuf_43 : IOBUF
    port map (
      I => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_O(1),
      IO => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin(1),
      O => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_I(1),
      T => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_T(1)
    );

  iobuf_44 : IOBUF
    port map (
      I => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_O(0),
      IO => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin(0),
      O => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_I(0),
      T => fpga_0_SysACE_CompactFlash_SysACE_MPD_pin_T(0)
    );

  iobuf_45 : IOBUF
    port map (
      I => fpga_0_FLASH_Mem_DQ_pin_O(0),
      IO => fpga_0_FLASH_Mem_DQ_pin(0),
      O => fpga_0_FLASH_Mem_DQ_pin_I(0),
      T => fpga_0_FLASH_Mem_DQ_pin_T(0)
    );

  iobuf_46 : IOBUF
    port map (
      I => fpga_0_FLASH_Mem_DQ_pin_O(1),
      IO => fpga_0_FLASH_Mem_DQ_pin(1),
      O => fpga_0_FLASH_Mem_DQ_pin_I(1),
      T => fpga_0_FLASH_Mem_DQ_pin_T(1)
    );

  iobuf_47 : IOBUF
    port map (
      I => fpga_0_FLASH_Mem_DQ_pin_O(2),
      IO => fpga_0_FLASH_Mem_DQ_pin(2),
      O => fpga_0_FLASH_Mem_DQ_pin_I(2),
      T => fpga_0_FLASH_Mem_DQ_pin_T(2)
    );

  iobuf_48 : IOBUF
    port map (
      I => fpga_0_FLASH_Mem_DQ_pin_O(3),
      IO => fpga_0_FLASH_Mem_DQ_pin(3),
      O => fpga_0_FLASH_Mem_DQ_pin_I(3),
      T => fpga_0_FLASH_Mem_DQ_pin_T(3)
    );

  iobuf_49 : IOBUF
    port map (
      I => fpga_0_FLASH_Mem_DQ_pin_O(4),
      IO => fpga_0_FLASH_Mem_DQ_pin(4),
      O => fpga_0_FLASH_Mem_DQ_pin_I(4),
      T => fpga_0_FLASH_Mem_DQ_pin_T(4)
    );

  iobuf_50 : IOBUF
    port map (
      I => fpga_0_FLASH_Mem_DQ_pin_O(5),
      IO => fpga_0_FLASH_Mem_DQ_pin(5),
      O => fpga_0_FLASH_Mem_DQ_pin_I(5),
      T => fpga_0_FLASH_Mem_DQ_pin_T(5)
    );

  iobuf_51 : IOBUF
    port map (
      I => fpga_0_FLASH_Mem_DQ_pin_O(6),
      IO => fpga_0_FLASH_Mem_DQ_pin(6),
      O => fpga_0_FLASH_Mem_DQ_pin_I(6),
      T => fpga_0_FLASH_Mem_DQ_pin_T(6)
    );

  iobuf_52 : IOBUF
    port map (
      I => fpga_0_FLASH_Mem_DQ_pin_O(7),
      IO => fpga_0_FLASH_Mem_DQ_pin(7),
      O => fpga_0_FLASH_Mem_DQ_pin_I(7),
      T => fpga_0_FLASH_Mem_DQ_pin_T(7)
    );

  iobuf_53 : IOBUF
    port map (
      I => fpga_0_FLASH_Mem_DQ_pin_O(8),
      IO => fpga_0_FLASH_Mem_DQ_pin(8),
      O => fpga_0_FLASH_Mem_DQ_pin_I(8),
      T => fpga_0_FLASH_Mem_DQ_pin_T(8)
    );

  iobuf_54 : IOBUF
    port map (
      I => fpga_0_FLASH_Mem_DQ_pin_O(9),
      IO => fpga_0_FLASH_Mem_DQ_pin(9),
      O => fpga_0_FLASH_Mem_DQ_pin_I(9),
      T => fpga_0_FLASH_Mem_DQ_pin_T(9)
    );

  iobuf_55 : IOBUF
    port map (
      I => fpga_0_FLASH_Mem_DQ_pin_O(10),
      IO => fpga_0_FLASH_Mem_DQ_pin(10),
      O => fpga_0_FLASH_Mem_DQ_pin_I(10),
      T => fpga_0_FLASH_Mem_DQ_pin_T(10)
    );

  iobuf_56 : IOBUF
    port map (
      I => fpga_0_FLASH_Mem_DQ_pin_O(11),
      IO => fpga_0_FLASH_Mem_DQ_pin(11),
      O => fpga_0_FLASH_Mem_DQ_pin_I(11),
      T => fpga_0_FLASH_Mem_DQ_pin_T(11)
    );

  iobuf_57 : IOBUF
    port map (
      I => fpga_0_FLASH_Mem_DQ_pin_O(12),
      IO => fpga_0_FLASH_Mem_DQ_pin(12),
      O => fpga_0_FLASH_Mem_DQ_pin_I(12),
      T => fpga_0_FLASH_Mem_DQ_pin_T(12)
    );

  iobuf_58 : IOBUF
    port map (
      I => fpga_0_FLASH_Mem_DQ_pin_O(13),
      IO => fpga_0_FLASH_Mem_DQ_pin(13),
      O => fpga_0_FLASH_Mem_DQ_pin_I(13),
      T => fpga_0_FLASH_Mem_DQ_pin_T(13)
    );

  iobuf_59 : IOBUF
    port map (
      I => fpga_0_FLASH_Mem_DQ_pin_O(14),
      IO => fpga_0_FLASH_Mem_DQ_pin(14),
      O => fpga_0_FLASH_Mem_DQ_pin_I(14),
      T => fpga_0_FLASH_Mem_DQ_pin_T(14)
    );

  iobuf_60 : IOBUF
    port map (
      I => fpga_0_FLASH_Mem_DQ_pin_O(15),
      IO => fpga_0_FLASH_Mem_DQ_pin(15),
      O => fpga_0_FLASH_Mem_DQ_pin_I(15),
      T => fpga_0_FLASH_Mem_DQ_pin_T(15)
    );

  iobuf_61 : IOBUF
    port map (
      I => xps_tft_0_TFT_IIC_SDA_O,
      IO => xps_tft_0_TFT_IIC_SDA,
      O => xps_tft_0_TFT_IIC_SDA_I,
      T => xps_tft_0_TFT_IIC_SDA_T
    );

  iobuf_62 : IOBUF
    port map (
      I => xps_tft_0_TFT_IIC_SCL_O,
      IO => xps_tft_0_TFT_IIC_SCL,
      O => xps_tft_0_TFT_IIC_SCL_I,
      T => xps_tft_0_TFT_IIC_SCL_T
    );

  iobuf_63 : IOBUF
    port map (
      I => xps_ps2_0_PS2_1_CLK_O,
      IO => xps_ps2_0_PS2_1_CLK,
      O => xps_ps2_0_PS2_1_CLK_I,
      T => xps_ps2_0_PS2_1_CLK_T
    );

  iobuf_64 : IOBUF
    port map (
      I => xps_ps2_0_PS2_2_DATA_O,
      IO => xps_ps2_0_PS2_2_DATA,
      O => xps_ps2_0_PS2_2_DATA_I,
      T => xps_ps2_0_PS2_2_DATA_T
    );

  iobuf_65 : IOBUF
    port map (
      I => xps_ps2_0_PS2_2_CLK_O,
      IO => xps_ps2_0_PS2_2_CLK,
      O => xps_ps2_0_PS2_2_CLK_I,
      T => xps_ps2_0_PS2_2_CLK_T
    );

  iobuf_66 : IOBUF
    port map (
      I => xps_ps2_0_PS2_1_DATA_O,
      IO => xps_ps2_0_PS2_1_DATA,
      O => xps_ps2_0_PS2_1_DATA_I,
      T => xps_ps2_0_PS2_1_DATA_T
    );

end architecture STRUCTURE;

