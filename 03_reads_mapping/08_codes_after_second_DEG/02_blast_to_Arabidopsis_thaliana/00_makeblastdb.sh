#!/bin/bash

## This code is for executing ncbi-blast-2.x.x+/bin/makeblastdb. ##

PROGRAM="../../../../../../../tools/ncbi-blast-2.12.0+/bin/makeblastdb"
UNIPROT_FILE="00_uniprotkb_arabidopsis_AND_reviewed_true_2023_08_24.fasta"
OUT_DIR="03_makeblastdb"
########################################

# I donwloaded Arabidopsis uniprot file at 2023-08-25 03:14 KST (canonical & isoform)
# I'm going to execute this code at "14_mapped_file/03_DEG_blast/01_blast_to_Arabidopsis_thaliana."
# I'm going to execute this code with " sh shell_script.sh"

CMD="nohup ${PROGRAM} -in ${UNIPROT_FILE} -dbtype prot -out ${OUT_DIR}/SwissProt.out >> 02_makeblastdb_log.txt 2>&1 &"
echo ${CMD}
eval ${CMD}
