#!/bin/bash

## This code is for cat--- ##

OUT_DIR="12_trimmed_file/05_concatenated_fq"
SAMPLE=("12_trimmed_file/00_trimmed_fq/Control-50-1_1.paired.fastq.gz
12_trimmed_file/00_trimmed_fq/Control-51-12_1.paired.fastq.gz 12_trimmed_file/00_trimmed_fq/Control-53-6_1.paired.fastq.gz 12_trimmed_file/00_trimmed_fq/0h-50-1_1.paired.fastq.gz 12_trimmed_file/00_trimmed_fq/0h-51-12_1.paired.fastq.gz 12_trimmed_file/00_trimmed_fq/0h-53-6_1.paired.fastq.gz 12_trimmed_file/00_trimmed_fq/1h-50-1_1.paired.fastq.gz 12_trimmed_file/00_trimmed_fq/1h-51-12_1.paired.fastq.gz 12_trimmed_file/00_trimmed_fq/1h-53-6_1.paired.fastq.gz 12_trimmed_file/00_trimmed_fq/23h-50-1_1.paired.fastq.gz 12_trimmed_file/00_trimmed_fq/23h-51-12_1.paired.fastq.gz 12_trimmed_file/00_trimmed_fq/23h-53-6_1.paired.fastq.gz 12_trimmed_file/00_trimmed_fq/48h-50-1_1.paired.fastq.gz 12_trimmed_file/00_trimmed_fq/48h-51-12_1.paired.fastq.gz 12_trimmed_file/00_trimmed_fq/48h-53-6_1.paired.fastq.gz" "12_trimmed_file/00_trimmed_fq/Control-50-1_2.paired.fastq.gz 12_trimmed_file/00_trimmed_fq/Control-51-12_2.paired.fastq.gz 12_trimmed_file/00_trimmed_fq/Control-53-6_2.paired.fastq.gz 12_trimmed_file/00_trimmed_fq/0h-50-1_2.paired.fastq.gz 12_trimmed_file/00_trimmed_fq/0h-51-12_2.paired.fastq.gz 12_trimmed_file/00_trimmed_fq/0h-53-6_2.paired.fastq.gz 12_trimmed_file/00_trimmed_fq/1h-50-1_2.paired.fastq.gz 12_trimmed_file/00_trimmed_fq/1h-51-12_2.paired.fastq.gz 12_trimmed_file/00_trimmed_fq/1h-53-6_2.paired.fastq.gz 12_trimmed_file/00_trimmed_fq/23h-50-1_2.paired.fastq.gz 12_trimmed_file/00_trimmed_fq/23h-51-12_2.paired.fastq.gz 12_trimmed_file/00_trimmed_fq/23h-53-6_2.paired.fastq.gz 12_trimmed_file/00_trimmed_fq/48h-50-1_2.paired.fastq.gz 12_trimmed_file/00_trimmed_fq/48h-51-12_2.paired.fastq.gz 12_trimmed_file/00_trimmed_fq/48h-53-6_2.paired.fastq.gz")
########################################

# I'm going to execute this code with "nohup sh shell_script_file.sh &".

ORDER=1

for i in "${SAMPLE[@]}"
do
    CMD="cat ${i} >> ${OUT_DIR}/PHRED30_Merged_${ORDER}.fastq.gz"
    echo ${CMD}
    eval ${CMD}

    ORDER=$(expr ${ORDER} + 1)

done
