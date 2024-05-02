#!/bin/bash
trap "/bin/rm -f /RAID2/COURSE/DCS/DCS111/Lab07/pa/.clean_up.sh" 0
sleep 5
exec $COWAREHOME/common/bin/process_cleanup 11400 > /dev/null 2>&1
