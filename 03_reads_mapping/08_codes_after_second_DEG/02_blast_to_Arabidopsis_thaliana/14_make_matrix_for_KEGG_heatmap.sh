#!/bin/bash

## This code is for making count matrix for KEGG heatmap. ##

SOURCE_CODE="../../../00_shell_scripts_and_codes_orderd/03_reads_mapping/11_codes_after_second_DEG_these_can_be_modified/02_blast_to_Arabidopsis_thaliana/15_make_matrix_for_KEGG_heatmap.py"
NUMBER_OF_GENES=5
GENES="TRINITY_DN1522_c0_g1_i5 TRINITY_DN4025_c0_g2_i1 TRINITY_DN2840_c0_g1_i25 TRINITY_DN2436_c0_g1_i38 TRINITY_DN1938_c0_g2_i9"
MATRIX_FILE="Pinus_Drought.isoform.counts.matrix"
MATRIX_FILE_INPUT_DIRECTORY="../../01_gene_expression_matrix"
OUTPUT_FILE="24_ABA_responses_KEGG_count_matrix"
########################################

# I'm going to execute this code at "14_mapped_file/03_DEG_blast/02_blast_to_Arabidopsis_thaliana."

CMD="python ${SOURCE_CODE} ${NUMBER_OF_GENES} ${GENES} ${MATRIX_FILE_INPUT_DIRECTORY}/${MATRIX_FILE} ${OUTPUT_FILE}"
echo ${CMD}
eval ${CMD}
