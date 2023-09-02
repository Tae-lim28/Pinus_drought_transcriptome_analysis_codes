#!/bin/bash

## This code is for doing DE analysis. ##

PROGRAM="../../../../../../../../tools/trinityrnaseq-v2.11.0/Analysis/DifferentialExpression/run_DE_analysis.pl"
MATRIX="../18_Pinus_Drought.isoform.counts_after_blast_with_cutoff.matrix"
SAMPLE_FILE="../../../02_DEG_analysis/samples_described.txt"
########################################

# I'm going to extcut this code at "14_mapped_file/03_DEG_blast/01_blast_to_Arabidopsis_thaliana/20_heatmap."
# I'm going to execute this code with "nohup sh shell_script.sh > 01_prepare_sample_correlation_log.txt 2>&1 &"

CMD="${PROGRAM} --matrix ${MATRIX} --method edgeR --samples_file ${SAMPLE_FILE} --output edgeR_output --dispersion 0.1"
echo ${CMD}
eval ${CMD}
