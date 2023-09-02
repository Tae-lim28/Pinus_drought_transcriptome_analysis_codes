#!/bin/bash

## This code is for executing multiqc. ##

PROGRAM="multiqc"
IN_DIR="12_trimmed_file/03_fastqc"
OUT_DIR="12_trimmed_file/04_multiqc"
########################################

CMD="nohup ${PROGRAM} ${IN_DIR} --outdir ${OUT_DIR} > ${OUT_DIR}/00_multiqc_log.txt 2>&1 &"
echo ${CMD}
eval ${CMD}
