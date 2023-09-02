#!/bin/bash

## This code is for running blastx. ##

PROGRAM="../../../../../../../tools/ncbi-blast-2.12.0+/bin/blastx"
IN_DIR="../00_DEG_fasta"
QUERY_FILES=("00_0h_UP_compared_to_1h" "01_1h_UP_compared_to_0h" "02_0h_UP_compared_to_23h" "03_23h_UP_compared_to_0h" "04_0h_UP_compared_to_48h" "05_48h_UP_compared_to_0h" "06_0h_UP_compared_to_Control" "07_Control_UP_compared_to_0h" "08_1h_UP_compared_to_23h" "09_23h_UP_compared_to_1h" "10_1h_UP_compared_to_48h" "11_48h_UP_compared_to_1h" "12_1h_UP_compared_to_Control" "13_Control_UP_compared_to_1h" "14_23h_UP_compared_to_48h" "15_48h_UP_compared_to_23h" "16_23h_UP_compared_to_Control" "17_Control_UP_compared_to_23h" "18_48h_UP_compared_to_Control" "19_Control_UP_compared_to_48h")
DATA_BASE="03_makeblastdb/SwissProt.out"
THREAD="16"
OUT_DIR="06_blastx"
########################################

# I'm going to execute this code at "14_mapped_file/03_DEG_blast/01_blast_to_Arabidopsis_thaliana."
# I'm going to execute this code with "nohup sh shell_script.sh > 05_blastx_log.txt 2>&1 &"

for i in ${QUERY_FILES[@]}
do
    CMD="${PROGRAM} -query ${IN_DIR}/${i}.fasta -db ${DATA_BASE} -max_target_seqs 1 -outfmt 6 -evalue 1e-5 -num_threads ${THREAD} -out ${OUT_DIR}/${i}_blastx_uniprotkb_Arabidopsis_thaliana.outfmt6"
    echo ${CMD}
    eval ${CMD}
done
