#******************************************************************************
#
# Makefile - Rules for building the dist example.
#
# Copyright (c) 2013-2014 Texas Instruments Incorporated.  All rights reserved.
# Software License Agreement
# 
# Texas Instruments (TI) is supplying this software for use solely and
# exclusively on TI's microcontroller products. The software is owned by
# TI and/or its suppliers, and is protected under applicable copyright
# laws. You may not combine this software with "viral" open-source
# software in order to form a larger program.
# 
# THIS SOFTWARE IS PROVIDED "AS IS" AND WITH ALL FAULTS.
# NO WARRANTIES, WHETHER EXPRESS, IMPLIED OR STATUTORY, INCLUDING, BUT
# NOT LIMITED TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE APPLY TO THIS SOFTWARE. TI SHALL NOT, UNDER ANY
# CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL, OR CONSEQUENTIAL
# DAMAGES, FOR ANY REASON WHATSOEVER.
# 
# This is part of revision 2.1.0.12573 of the EK-TM4C1294XL Firmware Package.
#
#******************************************************************************

#
# The base directory for TivaWare.
#
ROOT=.
DEBUG=1
#
# Include the common make definitions.
#
include ${ROOT}/makedefs

#
# Where to find header files that do not live in the source directory.
#
IPATH=./lib/inc
VPATH=./lib/src

#
# The default rule, which causes the dist example to be built.
#
all: ${COMPILER}
all: ${COMPILER}/dist.axf

#
# The rule to clean out all the build products.
#
clean:
	@rm -rf ${COMPILER} ${wildcard *~}

install:
	jlink.exe burn.txt
#
# The rule to create the target directory.
#
${COMPILER}:
	@mkdir -p ${COMPILER}

#
# Rules for building the dist example.
#
${COMPILER}/dist.axf: ${COMPILER}/startup_stm32f10x_hd.o
${COMPILER}/dist.axf: ${COMPILER}/system_stm32f10x.o
${COMPILER}/dist.axf: ${COMPILER}/dist.o
${COMPILER}/dist.axf: ${COMPILER}/syscalls.o
${COMPILER}/dist.axf: ${COMPILER}/misc.o
${COMPILER}/dist.axf: ${COMPILER}/stm32f10x_adc.o
${COMPILER}/dist.axf: ${COMPILER}/stm32f10x_bkp.o
${COMPILER}/dist.axf: ${COMPILER}/stm32f10x_can.o
${COMPILER}/dist.axf: ${COMPILER}/stm32f10x_cec.o
${COMPILER}/dist.axf: ${COMPILER}/stm32f10x_crc.o
${COMPILER}/dist.axf: ${COMPILER}/stm32f10x_dac.o
${COMPILER}/dist.axf: ${COMPILER}/stm32f10x_dbgmcu.o
${COMPILER}/dist.axf: ${COMPILER}/stm32f10x_dma.o
${COMPILER}/dist.axf: ${COMPILER}/stm32f10x_exti.o
${COMPILER}/dist.axf: ${COMPILER}/stm32f10x_flash.o
${COMPILER}/dist.axf: ${COMPILER}/stm32f10x_fsmc.o
${COMPILER}/dist.axf: ${COMPILER}/stm32f10x_gpio.o
${COMPILER}/dist.axf: ${COMPILER}/stm32f10x_i2c.o
${COMPILER}/dist.axf: ${COMPILER}/stm32f10x_iwdg.o
${COMPILER}/dist.axf: ${COMPILER}/stm32f10x_pwr.o
${COMPILER}/dist.axf: ${COMPILER}/stm32f10x_rcc.o
${COMPILER}/dist.axf: ${COMPILER}/stm32f10x_rtc.o
${COMPILER}/dist.axf: ${COMPILER}/stm32f10x_sdio.o
${COMPILER}/dist.axf: ${COMPILER}/stm32f10x_spi.o
${COMPILER}/dist.axf: ${COMPILER}/stm32f10x_tim.o
${COMPILER}/dist.axf: ${COMPILER}/stm32f10x_usart.o
${COMPILER}/dist.axf: ${COMPILER}/stm32f10x_wwdg.o
${COMPILER}/dist.axf: ${COMPILER}/stm32f10x_it.o
${COMPILER}/dist.axf: dist.ld
SCATTERgcc_dist=dist.ld
ENTRY_dist=Reset_Handler
CFLAGSgcc=-DUSE_STDPERIPH_DRIVER -DSTM32F10X_HD

#
# Include the automatically generated dependency files.
#
ifneq (${MAKECMDGOALS},clean)
-include ${wildcard ${COMPILER}/*.d} __dummy__
endif
