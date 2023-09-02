#!/bin/bash

## This code is for drawing PCA plot. ##

PROGRAM="../../../../../../../../tools/trinityrnaseq-v2.11.0/Analysis/DifferentialExpression/PtR"
MATRIX_FILE="../18_Pinus_Drought.isoform.counts_after_blast_with_cutoff.matrix"
SAMPLE_FILE="../../../02_DEG_analysis/samples_described.txt"
PRINCIPAL_COMPONENTS=2
########################################

# I'm going to execute this code at "14_mapped_file/03_DEG_blast/02_blast_to_Arabidopsis_thaliana/20_PCA_plot."

CMD="${PROGRAM} --matrix ${MATRIX_FILE} -s ${SAMPLE_FILE} --min_rowSums 10 --log2 --CPM --center_rows --prin_comp ${PRINCIPAL_COMPONENTS}"
echo ${CMD}
eval ${CMD}
