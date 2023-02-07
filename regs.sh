#!/bin/bash

# register defs
#
TI_BASE=0x80000000
BoardID=0x0
FiberEn=0x4
TrigDelayWidth=0xC
TrgSrcEn=0x20
SyncSrcEn=0x24
ClockSrc=0x2C
TrigPreScale=0x30
BlockTh=0x34
VmeResetInt=0x100

madc_read() {
    local reg=$(($1 + $TI_BASE))
    local reg_hex=$(printf 0x%x $reg)
    local rval=$(devmem $reg_hex 32)

    echo "READ  $reg_hex : $rval"

    }

madc_write() {
    local reg=$(($1 + $TI_BASE))
    local wval=$2
    local reg_hex=$(printf 0x%x $reg)
    local rval=$(devmem $reg_hex 32 $wval)

    echo "WRITE $reg_hex : $wval"

}

madc_dump() {
    local reg=0;
    local reg_hex=0;
    echo -n "REG DUMP"
    for ((reg=0; reg<=0x100; reg=reg+4)); do
	reg_hex=$(printf 0x%x $(($reg+$TI_BASE)))
	local rval=$(devmem $reg_hex 32)
	if [ $(expr $reg % 16) == "0" ]; then
	    echo
	    echo -n "$reg_hex   $rval "
	else
	    echo -n "$rval "
	fi
    done
    echo
    }
