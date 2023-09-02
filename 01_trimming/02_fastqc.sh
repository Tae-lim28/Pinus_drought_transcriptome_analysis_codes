#!/bin/bash

## This code is for executing fasqc. ##

PROGRAM="fastqc"
IN_DIR="12_trimmed_file/00_trimmed_fq"
OUT_DIR="12_trimmed_file/03_fastqc"
TIME=("Control" "0h" "1h" "23h" "48h")
SAMPLE=("50-1" "51-12" "53-6")
########################################

# I have to execute it with "nohup sh shell_script_file.sh &"
# I didn't make log file. That's because fastqc executing log have no information.

for i in ${TIME[@]}
do
    for j in ${SAMPLE[@]}
    do
        CMD="${PROGRAM} ${IN_DIR}/${i}-${j}_1.paired.fastq.gz ${IN_DIR}/${i}-${j}_1.unpaired.fastq.gz ${IN_DIR}/${i}-${j}_2.paired.fastq.gz ${IN_DIR}/${i}-${j}_2.unpaired.fastq.gz --outdir ${OUT_DIR}/${i}-${j}"
        echo ${CMD}
        eval ${CMD}
    done
done
