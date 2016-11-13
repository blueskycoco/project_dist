#! /bin/bash
export RTT_EXEC_PATH="e:/MentorGraphics/Sourcery_CodeBench_Lite_for_ARM_EABI/bin"
export RTT_CC=gcc
make
openocd -f openocd.cfg -c "flash_image"
#openocd -f openocd.cfg -c "flash_param"
