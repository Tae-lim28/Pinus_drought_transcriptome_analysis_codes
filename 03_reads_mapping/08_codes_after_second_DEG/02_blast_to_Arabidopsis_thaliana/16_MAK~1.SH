#!/bin/bash

## This code is for making count matrix for KEGG heatmap. ##

SOURCE_CODE="../../../00_shell_scripts_and_codes_orderd/03_reads_mapping/11_codes_after_second_DEG_these_can_be_modified/02_blast_to_Arabidopsis_thaliana/15_make_matrix_for_KEGG_heatmap.py"
NUMBER_OF_GENES=6
GENES="TRINITY_DN1598_c0_g1_i10 TRINITY_DN37614_c0_g1_i1 TRINITY_DN4347_c1_g1_i4 TRINITY_DN5113_c0_g1_i2 TRINITY_DN5712_c0_g1_i1 TRINITY_DN4666_c0_g1_i1"
MATRIX_FILE="Pinus_Drought.isoform.counts.matrix"
MATRIX_FILE_INPUT_DIRECTORY="../../01_gene_expression_matrix"
OUTPUT_FILE="23_photosystemII_KEGG_count_matrix"
########################################

# I'm going to execute this code at "14_mapped_file/03_DEG_blast/02_blast_to_Arabidopsis_thaliana."

CMD="python ${SOURCE_CODE} ${NUMBER_OF_GENES} ${GENES} ${MATRIX_FILE_INPUT_DIRECTORY}/${MATRIX_FILE} ${OUTPUT_FILE}"
echo ${CMD}
eval ${CMD}
