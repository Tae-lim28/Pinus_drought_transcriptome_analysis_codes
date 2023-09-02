#!/bin/bash

## This code is for doing DE analysis. ##

PROGRAM="../../../../../../tools/trinityrnaseq-v2.11.0/Analysis/DifferentialExpression/run_DE_analysis.pl"
MATRIX="../01_gene_expression_matrix/Pinus_Drought.isoform.counts.matrix"
SAMPLE_FILE="samples_described.txt"
########################################

# I'm going to extcut this code at "/14_mapped_file/02_DEG_analysis."
# I'm going to execute this code with "nohup sh shell_script.sh > 00_run_DE_analysis_log.txt 2>&1 &"

CMD="${PROGRAM} --matrix ${MATRIX} --method edgeR --samples_file ${SAMPLE_FILE} --output edgeR_output --dispersion 0.1"
echo ${CMD}
eval ${CMD}
