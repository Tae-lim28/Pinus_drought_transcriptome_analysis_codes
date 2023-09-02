#!/bin/bash

## This code is for make DEG fasta file. ##

SOURCE_CODE="../../../00_shell_scripts_and_codes_orderd/03_reads_mapping/11_codes_after_second_DEG_these_can_be_modified/01_get_DEG_fasta.py"
CONDITIONS=("0h" "1h" "23h" "48h" "Control")
P_VALUE="0.01"
FASTA_FILE="../../../13_trinity_file/NRCDS.fasta"
OUTPUT_DIRECTORY="../../03_DEG_blast/00_DEG_fasta"
########################################

# I'm going to execute this code at "14_mapped_file/02_DEG_analysis/edgeR_output"
# Output files are located in "14_mapped_file/03_DEG_blast/00_DEG_fasta"

NUMBER=0

CONDITIONS_LENGTH=${#CONDITIONS[@]}

for (( i=0; i<${CONDITIONS_LENGTH}-1; i++ ))
do
    for (( j=i+1; j<${CONDITIONS_LENGTH}; j++ ))
    do
        if [[ ${NUMBER} -lt 10 ]]
        then
            FIRST_CONDITION_UP_DEG_FASTA_FILE="${OUTPUT_DIRECTORY}/0${NUMBER}_${CONDITIONS[i]}_UP_compared_to_${CONDITIONS[j]}.fasta"
            NUMBER=$(expr ${NUMBER} + 1)
        else
            FIRST_CONDITION_UP_DEG_FASTA_FILE="${OUTPUT_DIRECTORY}/${NUMBER}_${CONDITIONS[i]}_UP_compared_to_${CONDITIONS[j]}.fasta"
            NUMBER=$(expr ${NUMBER} + 1)
        fi
        
        if [[ ${NUMBER} -lt 10 ]]
        then
            SECOND_CONDITION_UP_DEG_FASTA_FILE="${OUTPUT_DIRECTORY}/0${NUMBER}_${CONDITIONS[j]}_UP_compared_to_${CONDITIONS[i]}.fasta"
            NUMBER=$(expr ${NUMBER} + 1)
        else
            SECOND_CONDITION_UP_DEG_FASTA_FILE="${OUTPUT_DIRECTORY}/${NUMBER}_${CONDITIONS[j]}_UP_compared_to_${CONDITIONS[i]}.fasta"
            NUMBER=$(expr ${NUMBER} + 1)
        fi
        
        CMD="python ${SOURCE_CODE} ${CONDITIONS[i]} ${CONDITIONS[j]} ${P_VALUE} ${FASTA_FILE} ${FIRST_CONDITION_UP_DEG_FASTA_FILE} ${SECOND_CONDITION_UP_DEG_FASTA_FILE}"
        echo ${CMD}
        eval ${CMD}
    done
done
