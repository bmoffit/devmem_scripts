#!/bin/bash

. ./regs.sh
echo "########################################"
echo "         GO"
echo "########################################"

madc_write $TrgSrcEn 0x12

madc_dump
