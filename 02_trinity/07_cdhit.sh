#!/bin/bash

## This code is for cdhit. ##

IN_FILE="00_trinity_out.Trinity.fasta.transdecoder.pep"
OUT_FILE="00_trinity_out.Trinity.fasta.transdecoder.pep.cdhit"
THREADS="15"
########################################

# I'm going to execute this code at "13_trinity_file/."

CMD="nohup cd-hit -i ${IN_FILE} -o ${OUT_FILE} -c 0.99 -T ${THREADS} > 03_cdhit_log.txt 2>&1 &"
echo ${CMD}
eval ${CMD}
