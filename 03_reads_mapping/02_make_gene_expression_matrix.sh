#!/bin/bash

## This code is for making gene expression matrix. ##

FILES="../00_align_and_estimate_abundance/Control-50-1/Control-50-1_RSEM.isoforms.results ../00_align_and_estimate_abundance/Control-51-12/Control-51-12_RSEM.isoforms.results ../00_align_and_estimate_abundance/Control-53-6/Control-53-6_RSEM.isoforms.results ../00_align_and_estimate_abundance/0h-50-1/0h-50-1_RSEM.isoforms.results ../00_align_and_estimate_abundance/0h-51-12/0h-51-12_RSEM.isoforms.results ../00_align_and_estimate_abundance/0h-53-6/0h-53-6_RSEM.isoforms.results ../00_align_and_estimate_abundance/1h-50-1/1h-50-1_RSEM.isoforms.results ../00_align_and_estimate_abundance/1h-51-12/1h-51-12_RSEM.isoforms.results ../00_align_and_estimate_abundance/1h-53-6/1h-53-6_RSEM.isoforms.results ../00_align_and_estimate_abundance/23h-50-1/23h-50-1_RSEM.isoforms.results ../00_align_and_estimate_abundance/23h-51-12/23h-51-12_RSEM.isoforms.results ../00_align_and_estimate_abundance/23h-53-6/23h-53-6_RSEM.isoforms.results ../00_align_and_estimate_abundance/48h-50-1/48h-50-1_RSEM.isoforms.results ../00_align_and_estimate_abundance/48h-51-12/48h-51-12_RSEM.isoforms.results ../00_align_and_estimate_abundance/48h-53-6/48h-53-6_RSEM.isoforms.results"
########################################

# I'm going to execute this file at "05_mapped_file/01_gene_expression_matrix/".

CMD="../../../../../../tools/trinityrnaseq-v2.11.0/util/abundance_estimates_to_matrix.pl --est_method RSEM --out_prefix Pinus_Drought "${FILES}" --gene_trans_map none"
echo ${CMD}
eval ${CMD}
