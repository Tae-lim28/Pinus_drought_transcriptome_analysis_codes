#!/bin/bash

## This code is for making matrices for venn diagram. ##

SOURCE_CODE="../../../00_shell_scripts_and_codes_orderd/03_reads_mapping/11_codes_after_second_DEG_these_can_be_modified/02_blast_to_Arabidopsis_thaliana/08_make_matrix_for_venn_diagram_with_cutoffs.py"
CONDITIONS=("0h" "1h" "23h" "48h" "Control")
PERCENT_IDENTITY="50"
LENGTH="100"
BIT_SCORE="0"
UNIPROT_ACCESSIONS_MATRIX="00_Pinus_drought_uniprot_accessions_matrix_for_venn_diagram.txt"
TRINITY_HEADERS_MATRIX="01_Pinus_drought_trinity_headers_matrix_for_venn_diagram.txt"
INPUT_DIRECTORY="06_blastx"
OUTPUT_DIRECTORY="15_matrices_for_venn_diagram"
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
            OUTFMT6_FILE1="${INPUT_DIRECTORY}/0${NUMBER}_${CONDITIONS[i]}_UP_compared_to_${CONDITIONS[j]}_blastx_uniprotkb_Arabidopsis_thaliana.outfmt6"
            OUTFMT6_FILES+=(${OUTFMT6_FILE1})
            NUMBER=$(expr ${NUMBER} + 1)
        else
            OUTFMT6_FILE1="${INPUT_DIRECTORY}/${NUMBER}_${CONDITIONS[i]}_UP_compared_to_${CONDITIONS[j]}_blastx_uniprotkb_Arabidopsis_thaliana.outfmt6"
            OUTFMT6_FILES+=(${OUTFMT6_FILE1})
            NUMBER=$(expr ${NUMBER} + 1)
        fi

        if [[ ${NUMBER} -lt 10 ]]
        then
            OUTFMT6_FILE2="${INPUT_DIRECTORY}/0${NUMBER}_${CONDITIONS[j]}_UP_compared_to_${CONDITIONS[i]}_blastx_uniprotkb_Arabidopsis_thaliana.outfmt6"
            OUTFMT6_FILES+=(${OUTFMT6_FILE2})
            NUMBER=$(expr ${NUMBER} + 1)
        else
            OUTFMT6_FILE2="${INPUT_DIRECTORY}/${NUMBER}_${CONDITIONS[j]}_UP_compared_to_${CONDITIONS[i]}_blastx_uniprotkb_Arabidopsis_thaliana.outfmt6"
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

CONDITIONS_STRING=""
CHECK=0
for j in ${CONDITIONS[@]}
do
    CONDITIONS_STRING+="${j}"
    if [[ ${CHECK} -lt 19 ]]
    then
        CONDITIONS_STRING+=" "
        CHECK=$(expr ${CHECK} + 1)
    fi
done

CMD="python ${SOURCE_CODE} ${OUTFMT6_FILE_STRING} ${PERCENT_IDENTITY} ${LENGTH} ${BIT_SCORE} ${CONDITIONS_STRING} ${OUTPUT_DIRECTORY}/${UNIPROT_ACCESSIONS_MATRIX} ${OUTPUT_DIRECTORY}/${TRINITY_HEADERS_MATRIX}"
echo ${CMD}
eval ${CMD}
