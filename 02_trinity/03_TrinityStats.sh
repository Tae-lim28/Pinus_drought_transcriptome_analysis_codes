#!/bin/bash

## This code is for calcuating statistics. ##

PROGRAM="../../../../tools/trinityrnaseq-v2.11.0/util/TrinityStats.pl"
IN_DIR="13_trinity_file/00_trinity_out"
FILE="00_trinity_out.Trinity.fasta"
########################################

# I'm going to execute this code with "sh shell_script_file.sh"
# That's because it doens't take many times.

CMD="${PROGRAM} ${IN_DIR}/${FILE} > ${IN_DIR}/01_Trinity_stats.txt 2>&1"
echo ${CMD}
eval ${CMD}
