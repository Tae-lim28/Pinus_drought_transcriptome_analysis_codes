#!/bin/bash

## This code is for extracting and clustering DE transcripts. ##

PROGRAM="../../../../../../../tools/trinityrnaseq-v2.11.0/Analysis/DifferentialExpression/analyze_diff_expr.pl"
MATRIX="../../01_gene_expression_matrix/Pinus_Drought.isoform.TMM.EXPR.matrix"
SAMPLE_FILE="../samples_described.txt"
P_VALUE="0.3"
########################################

# I'm going to extcut this code at /data/users/Tae-Lim/RNAseq/02_Pinus/14_mapped_file/edgeR_output
# I'm going to execute this code with "nohup sh shell_script.sh > 00_analyze_diff_expr_p_val_0.3_log.txt 2>&1 &"

CMD="${PROGRAM} --matrix ${MATRIX} -P ${P_VALUE} -C 2 --samples ${SAMPLE_FILE} --max_genes_clust 20000"
echo ${CMD}
eval ${CMD}
