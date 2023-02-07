#!/bin/bash

. ./regs.sh
echo "########################################"
echo "         DOWNLOAD / PRESTART"
echo "########################################"
madc_write $BoardID 0xda
madc_read $BoardID

madc_write $VmeResetInt 0x20
madc_write $FiberEn 0x5FF
madc_write $ClockSrc 0x2
madc_write $VmeResetInt 0x100
madc_write $VmeResetInt 0x200
madc_write $VmeResetInt 0x1800
madc_write $SyncSrcEn 0x2
madc_write $VmeResetInt 0x200
madc_write $TrigDelayWidth 0x0F0000F0
madc_write $TrigPreScale 0x0
madc_write $BlockTh 0x1
