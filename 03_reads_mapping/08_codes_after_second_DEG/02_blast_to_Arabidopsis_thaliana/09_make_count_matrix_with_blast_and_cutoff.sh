#!/bin/bash

## This code is for making count matrix. ##

SOURCE_CODE="../../../00_shell_scripts_and_codes_orderd/03_reads_mapping/11_codes_after_second_DEG_these_can_be_modified/02_blast_to_Arabidopsis_thaliana/10_make_count_matrix_with_blast_and_cutoff.py"
CONDITIONS=("0h" "1h" "23h" "48h" "Control")
PERCENT_IDENTITY="50"
LENGTH="100"
BIT_SCORE="0"
OUTFMT6_FILE_INPUT_DIRECTORY="06_blastx"
MATRIX_FILE="Pinus_Drought.isoform.counts.matrix"
MATRIX_FILE_INPUT_DIRECTORY="../../01_gene_expression_matrix"
OUTPUT_FILE="18_Pinus_Drought.isoform.counts_after_blast_with_cutoff.matrix"
########################################

# I'm going to execute this code at "14_mapped_file/03_DEG_blast/02_blast_to_Arabidopsis_thaliana."

NUMBER=0

CONDITIONS_LENGTH=${#CONDITIONS[@]}

OUTFMT6_FILES=()
for (( i=0; i<${CONDITIONS_LENGTH}-1; i++ ))
do
    for (( j=i+1; j<CONDITIONS_LENGTH; j++ ))
    do
        if [[ ${NUMBER} -lt 10 ]]
        then
            OUTFMT6_FILE1="${OUTFMT6_FILE_INPUT_DIRECTORY}/0${NUMBER}_${CONDITIONS[i]}_UP_compared_to_${CONDITIONS[j]}_blastx_uniprotkb_Arabidopsis_thaliana.outfmt6"
            OUTFMT6_FILES+=(${OUTFMT6_FILE1})
            NUMBER=$(expr ${NUMBER} + 1)
        else
            OUTFMT6_FILE1="${OUTFMT6_FILE_INPUT_DIRECTORY}/${NUMBER}_${CONDITIONS[i]}_UP_compared_to_${CONDITIONS[j]}_blastx_uniprotkb_Arabidopsis_thaliana.outfmt6"
            OUTFMT6_FILES+=(${OUTFMT6_FILE1})
            NUMBER=$(expr ${NUMBER} + 1)
        fi

        if [[ ${NUMBER} -lt 10 ]]
        then
            OUTFMT6_FILE2="${OUTFMT6_FILE_INPUT_DIRECTORY}/0${NUMBER}_${CONDITIONS[j]}_UP_compared_to_${CONDITIONS[i]}_blastx_uniprotkb_Arabidopsis_thaliana.outfmt6"
            OUTFMT6_FILES+=(${OUTFMT6_FILE2})
            NUMBER=$(expr ${NUMBER} + 1)
        else
            OUTFMT6_FILE2="${OUTFMT6_FILE_INPUT_DIRECTORY}/${NUMBER}_${CONDITIONS[j]}_UP_compared_to_${CONDITIONS[i]}_blastx_uniprotkb_Arabidopsis_thaliana.outfmt6"
            OUTFMT6_FILES+=(${OUTFMT6_FILE2})
            NUMBER=$(expr ${NUMBER} + 1)
        fi

    done
done

OUTFMT6_FILE_STRING=""
CHECK=0
for i in ${OUTFMT6_FILES[@]}
do
    OUTFMT6_FILE_STRING+="${i}"
    if [[ ${CHECK} -lt 19 ]]
    then
        OUTFMT6_FILE_STRING+=" "
        CHECK=$(expr ${CHECK} + 1)
    fi
done

CMD="python ${SOURCE_CODE} ${OUTFMT6_FILE_STRING} ${MATRIX_FILE_INPUT_DIRECTORY}/${MATRIX_FILE} ${PERCENT_IDENTITY} ${LENGTH} ${BIT_SCORE} ${OUTPUT_FILE}"
echo ${CMD}
eval ${CMD}
