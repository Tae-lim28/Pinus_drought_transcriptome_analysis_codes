#!/bin/bash

## This code is for making 00_cat.sh file. ##

IN_DIR="12_trimmed_file/00_trimmed_fq"
TIME=("Control" "0h" "1h" "23h" "48h")
SAMPLE=("50-1" "51-12" "53-6")
ORDER=("1" "2")
########################################

# I execute this code with "sh shell_script_file.sh"
# The result of this file is used in making 00_cat.sh file.

for i in ${ORDER[@]}
do
    for j in ${TIME[@]}
    do
        for k in ${SAMPLE[@]}
        do
            WORDS="${IN_DIR}/${j}-${k}_${i}.paired.fastq.gz"
            echo ${WORDS}
        done
    done
done
