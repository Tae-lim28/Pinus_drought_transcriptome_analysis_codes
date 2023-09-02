#!/bin/bash

## This code is for running Trinity. ##

PROGRAM="Trinity"
TYPE="fq"
FIRST_DIR="/data/users/Tae-Lim/RNAseq/02_Pinus/12_trimmed_file/05_concatenated_fq/PHRED30_Merged_1.fastq.gz"
SECOND_DIR="/data/users/Tae-Lim/RNAseq/02_Pinus/12_trimmed_file/05_concatenated_fq/PHRED30_Merged_2.fastq.gz"
THREAD="16"
MEMORY="100G"
OUT_DIR="/data/users/Tae-Lim/RNAseq/02_Pinus/13_trinity_file/00_trinity_out"
########################################

# I think I can execute this code with "sh shell_script_file.sh" Beacuse This shell script file contains only one command.
# Normally, I use small letter in log file. However, in this case, the name of the program is Trinity. So I use capital letter.

CMD="nohup ${PROGRAM} --seqType ${TYPE}  --left ${FIRST_DIR}  --right ${SECOND_DIR} --output ${OUT_DIR} --max_memory ${MEMORY} --SS_lib_type RF --CPU ${THREAD} --full_cleanup > ${OUT_DIR}/Trinity_log.txt 2>&1 &"
echo ${CMD}
eval ${CMD}

# The version of Trinity is 2.11.0
#(base) [Tae-Lim@snufglab 00_retry]$ Trinity --version
#Trinity version: Trinity-v2.11.0
#** NOTE: Latest version of Trinity is Trinity-v2.15.1, and can be obtained at:
#        https://github.com/trinityrnaseq/trinityrnaseq/releases
