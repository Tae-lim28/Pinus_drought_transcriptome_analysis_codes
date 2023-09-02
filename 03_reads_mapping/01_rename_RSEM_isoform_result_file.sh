#!/bin/bash

## This code is for remane RSEM.isoform.result files. ##

DIRECTORY="14_mapped_file/00_align_and_estimate_abundance"
SAMPLE_NAME=("Control-50-1" "Control-51-12" "Control-53-6" "0h-50-1" "0h-51-12" "0h-53-6" "1h-50-1" "1h-51-12" "1h-53-6" "23h-50-1" "23h-51-12" "23h-53-6" "48h-50-1" "48h-51-12" "48h-53-6")
FILE="RSEM.isoforms.results"
########################################

for i in ${SAMPLE_NAME[@]}
do
    CMD="mv ${DIRECTORY}/${i}/${FILE} ${DIRECTORY}/${i}/${i}_${FILE}"
    echo ${CMD}
    eval ${CMD}
done
