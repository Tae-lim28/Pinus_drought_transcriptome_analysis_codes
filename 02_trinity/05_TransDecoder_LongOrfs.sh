#!/bin/bash

## This code is for running TransDecoder.LongOrfs. ##

PROGRAM="TransDecoder.LongOrfs"
IN_DIR="00_trinity_out"
FILE="00_trinity_out.Trinity.fasta"
########################################

# I'm going to ececute this code with "sh shell_script_file.sh"
# I think there is only one command.
# I'm going to execute this code at "13_trinity_file/'.

CMD="nohup ${PROGRAM} -t ${IN_DIR}/${FILE} -S > 01_TransDecoder.LongOrfs_log.txt 2>&1 &"
echo ${CMD}
eval ${CMD}

# I think the output files will be located in "13_trinity_file/".

# The version of TransDecoder.LongOrfs is 5.5.0
# (base) [Tae-Lim@snufglab 04_trinity_file]$ TransDecoder.LongOrfs --version
# TransDecoder.LongOrfs 5.5.0
