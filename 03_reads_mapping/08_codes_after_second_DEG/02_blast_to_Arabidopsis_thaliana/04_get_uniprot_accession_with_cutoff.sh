#!/bin/bash

## This code is for getting uniprot IDs of each compare. ##

SOURCE_CODE="../../../00_shell_scripts_and_codes_orderd/03_reads_mapping/11_codes_after_second_DEG_these_can_be_modified/02_blast_to_Arabidopsis_thaliana/06_get_uniprot_accession_with_cutoff.py"
CONDITIONS=("0h" "1h" "23h" "48h" "Control")
PERCENT_IDENTITY="50"
LENGTH="100"
BIT_SCORE="0"
INPUT_DIRECTORY="06_blastx"
OUTPUT_DIRECTORY="12_uniprot_accession_with_cutoffs"
########################################

# I'm going to execute this code at "14_mapped_file/03_DEG_blast/02_blast_to_Arabidopsis_thaliana."

NUMBER=0

CONDITIONS_LENGTH=${#CONDITIONS[@]}

for (( i=0; i<${CONDITIONS_LENGTH}-1; i++ ))
do
    for (( j=i+1; j<${CONDITIONS_LENGTH}; j++ ))
    do
        if [[ ${NUMBER} -lt 10 ]]
        then
            OUTFMT6_FILE1="${INPUT_DIRECTORY}/0${NUMBER}_${CONDITIONS[i]}_UP_compared_to_${CONDITIONS[j]}_blastx_uniprotkb_Arabidopsis_thaliana.outfmt6"
            ACCESSION_FILE1="${OUTPUT_DIRECTORY}/0${NUMBER}_${CONDITIONS[i]}_UP_compared_to_${CONDITIONS[j]}_uniprot_accession_with_cutoffs_percent_identity_${PERCENT_IDENTITY}_length_${LENGTH}_bit_score_${BIT_SCORE}.txt"
            NUMBER=$(expr ${NUMBER} + 1)
        else
            OUTFMT6_FILE1="${INPUT_DIRECTORY}/${NUMBER}_${CONDITIONS[i]}_UP_compared_to_${CONDITIONS[j]}_blastx_uniprotkb_Arabidopsis_thaliana.outfmt6"
            ACCESSION_FILE1="${OUTPUT_DIRECTORY}/${NUMBER}_${CONDITIONS[i]}_UP_compared_to_${CONDITIONS[j]}_uniprot_accession_with_cutoffs_percent_identity_${PERCENT_IDENTITY}_length_${LENGTH}_bit_score_${BIT_SCORE}.txt"
            NUMBER=$(expr ${NUMBER} + 1)
        fi
        CMD1="python ${SOURCE_CODE} ${OUTFMT6_FILE1} ${PERCENT_IDENTITY} ${LENGTH} ${BIT_SCORE} ${ACCESSION_FILE1}"
        echo ${CMD1}
        eval ${CMD1}

        if [[ ${NUMBER} -lt 10 ]]
        then
            OUTFMT6_FILE2="${INPUT_DIRECTORY}/0${NUMBER}_${CONDITIONS[j]}_UP_compared_to_${CONDITIONS[i]}_blastx_uniprotkb_Arabidopsis_thaliana.outfmt6"
            ACCESSION_FILE2="${OUTPUT_DIRECTORY}/0${NUMBER}_${CONDITIONS[j]}_UP_compared_to_${CONDITIONS[i]}_uniprot_accession_with_cutoffs_percent_identity_${PERCENT_IDENTITY}_length_${LENGTH}_bit_score_${BIT_SCORE}.txt"
            NUMBER=$(expr ${NUMBER} + 1)
        else
            OUTFMT6_FILE2="${INPUT_DIRECTORY}/${NUMBER}_${CONDITIONS[j]}_UP_compared_to_${CONDITIONS[i]}_blastx_uniprotkb_Arabidopsis_thaliana.outfmt6"
            ACCESSION_FILE2="${OUTPUT_DIRECTORY}/${NUMBER}_${CONDITIONS[j]}_UP_compared_to_${CONDITIONS[i]}_uniprot_accession_with_cutoffs_percent_identity_${PERCENT_IDENTITY}_length_${LENGTH}_bit_score_${BIT_SCORE}.txt"
            NUMBER=$(expr ${NUMBER} + 1)
        fi
        CMD1="python ${SOURCE_CODE} ${OUTFMT6_FILE2} ${PERCENT_IDENTITY} ${LENGTH} ${BIT_SCORE} ${ACCESSION_FILE2}"
        echo ${CMD1}
        eval ${CMD1}
    done
done
