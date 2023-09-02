#!/bin/bash

## This code is for runnig TransDecoder.Predict. ##
## I think my blastp output file(blastp.outfmt6) has same format with the longest.orf.blast.out(from https://www.youtube.com/watch?v=aQHRl9c6WFQ) ##
## Thought I use "03_trinity_file/01_after_trinity/01_ncbi-blast/00_makeblastdb/SwissProt.out" rather than uniprot_sprot.fasta, I'm going to procede next part. ##
## And Dayoung reviews my procedure. And she said okey. ##
## I saw transdecoder_dir in the video(https://www.youtube.com/watch?v=aQHRl9c6WFQ). "It correspond with my /data/users/Tae-Lim/RNAseq/02_Pinus/03_trinity_file/01_after_trinity/00_TransDecoder/00_LongOrfs/"

PROGRAM="TransDecoder.Predict"
ASSEMBLY="00_trinity_out/00_trinity_out.Trinity.fasta"
BLASTP="03_ncbi-blast/01_blastp/blastp.outfmt6"
THREAD="16"
########################################

# I have to execute this code in /data/users/Tae-Lim/RNAseq/02_Pinus/03_trinity_file/01_after_trinity/00_TransDecoder/01_Predict/.
# So I don't need the "-O option" and OUT_DIR variable.

CMD="nohup ${PROGRAM} -t ${ASSEMBLY} --retain_blastp_hits ${BLASTP} --cpu ${THREAD} --single_best_only > 04_TransDecoder.Predict_log.txt 2>&1 &"
echo ${CMD}
eval ${CMD}
