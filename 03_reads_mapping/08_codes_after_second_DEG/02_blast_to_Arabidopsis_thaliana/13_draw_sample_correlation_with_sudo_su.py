#!/bin/bash

## This code is for extracting and clustering DE transcripts. ##

PROGRAM="../../../../../../../../../tools/trinityrnaseq-v2.11.0/Analysis/DifferentialExpression/analyze_diff_expr.pl"
MATRIX="../../18_Pinus_Drought.isoform.counts_after_blast_with_cutoff.matrix"
SAMPLE_FILE="../../../../02_DEG_analysis/samples_described.txt"
P_VALUE="0.01"
########################################

# I'm going to extcut this code at "14_mapped_file/03_DEG_blast/01_blast_to_Arabidopsis_thaliana/20_heatmap/edgeR_output."
# I'm going to execute this code with "nohup sh shell_script.sh > 01_draw_sample_correlation_log.txt 2>&1 &"

CMD="${PROGRAM} --matrix ${MATRIX} -P ${P_VALUE} -C 2 --samples ${SAMPLE_FILE} --max_genes_clust 20000"
echo ${CMD}
eval ${CMD}
