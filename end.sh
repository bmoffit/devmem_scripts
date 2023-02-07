#!/bin/bash

. ./regs.sh
echo "########################################"
echo "         END"
echo "########################################"

madc_write $TrgSrcEn 0x0

madc_dump
