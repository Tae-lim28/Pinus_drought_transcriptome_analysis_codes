#!/bin/bash

## This code is for trimming files. ##

PROGRAM="java -jar ../../../../tools/Trimmomatic-0.39/trimmomatic-0.39.jar"
TYPE="PE"
IN_DIR="01_raw_file/01_in_fq"
OUT_DIR="12_trimmed_file"
FILE_DIR="00_trimmed_fq"
LOG_DIR="01_log_file"
EXE_LOG_DIR="02_execute_log"
PHRED="30"
TIME=("Control" "0h" "1h" "23h" "48h") # I had wrote 48 instead of 48h. So I fixed it.
SAMPLE=("50-1" "51-12" "53-6")
########################################

# I have to execute it with "nohup sh shell_script_file.sh &" 

for i in ${TIME[@]}
do
    for j in ${SAMPLE[@]}
    do
        CMD="${PROGRAM} ${TYPE} -phred33 -trimlog ${OUT_DIR}/${LOG_DIR}/${i}-${j}.log ${IN_DIR}/${i}-${j}_1.fastq.gz ${IN_DIR}/${i}-${j}_2.fastq.gz ${OUT_DIR}/${FILE_DIR}/${i}-${j}_1.paired.fastq.gz ${OUT_DIR}/${FILE_DIR}/${i}-${j}_1.unpaired.fastq.gz ${OUT_DIR}/${FILE_DIR}/${i}-${j}_2.paired.fastq.gz ${OUT_DIR}/${FILE_DIR}/${i}-${j}_2.unpaired.fastq.gz ILLUMINACLIP:${IN_DIR}/Tae-Lim_adapter.fa:2:30:7 LEADING:${PHRED} TRAILING:${PHRED} SLIDINGWINDOW:4:${PHRED} MINLEN:36 > ${OUT_DIR}/${EXE_LOG_DIR}/${i}-${j}_log.txt 2>&1"
        echo ${CMD}
        eval ${CMD}
    done
done

# The version of Trimmomatic is 0.39
