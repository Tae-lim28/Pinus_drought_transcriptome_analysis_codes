#!/bin/bash

## This code is for reads mapping. ##

REFERENCE="NRCDS.fasta"
FASTQ_DIR="../../12_trimmed_file/00_trimmed_fq"
FOWARD_FASTQ=("Control-50-1_1.paired.fastq.gz" "Control-51-12_1.paired.fastq.gz" "Control-53-6_1.paired.fastq.gz" "0h-50-1_1.paired.fastq.gz" "0h-51-12_1.paired.fastq.gz" "0h-53-6_1.paired.fastq.gz" "1h-50-1_1.paired.fastq.gz" "1h-51-12_1.paired.fastq.gz" "1h-53-6_1.paired.fastq.gz" "23h-50-1_1.paired.fastq.gz" "23h-51-12_1.paired.fastq.gz" "23h-53-6_1.paired.fastq.gz" "48h-50-1_1.paired.fastq.gz" "48h-51-12_1.paired.fastq.gz" "48h-53-6_1.paired.fastq.gz")
REVERSE_FASTQ=("Control-50-1_2.paired.fastq.gz" "Control-51-12_2.paired.fastq.gz" "Control-53-6_2.paired.fastq.gz" "0h-50-1_2.paired.fastq.gz" "0h-51-12_2.paired.fastq.gz" "0h-53-6_2.paired.fastq.gz" "1h-50-1_2.paired.fastq.gz" "1h-51-12_2.paired.fastq.gz" "1h-53-6_2.paired.fastq.gz" "23h-50-1_2.paired.fastq.gz" "23h-51-12_2.paired.fastq.gz" "23h-53-6_2.paired.fastq.gz" "48h-50-1_2.paired.fastq.gz" "48h-51-12_2.paired.fastq.gz" "48h-53-6_2.paired.fastq.gz")
#OUT_DIR="00_align_and_estimate_abundance"
SAMPLE_NAME=("Control-50-1" "Control-51-12" "Control-53-6" "0h-50-1" "0h-51-12" "0h-53-6" "1h-50-1" "1h-51-12" "1h-53-6" "23h-50-1" "23h-51-12" "23h-53-6" "48h-50-1" "48h-51-12" "48h-53-6")
THREADS="15"
########################################

# I'm going to execute this code at "14_mapped_file/00_align_and_estimate_abundance".
# I'm gonig to execute this code with "nohup sh shell_script_file.sh > 00_align_and_estimate_abundance_log.txt 2>&1 &"

for i in {0..0}
do
    CMD1="../../../../../../tools/trinityrnaseq-v2.11.0/util/align_and_estimate_abundance.pl --transcripts ${REFERENCE} --seqType fq --left ${FASTQ_DIR}/${FOWARD_FASTQ[i]} --right ${FASTQ_DIR}/${REVERSE_FASTQ[i]} --est_method RSEM --aln_method bowtie2 --output_dir ${SAMPLE_NAME[i]} --thread_count ${THREADS} --prep_reference --SS_lib_type RF"
    echo ${CMD1}
    eval ${CMD1}
done

for i in {1..14}
do
    CMD2="../../../../../../tools/trinityrnaseq-v2.11.0/util/align_and_estimate_abundance.pl --transcripts ${REFERENCE} --seqType fq --left ${FASTQ_DIR}/${FOWARD_FASTQ[i]} --right ${FASTQ_DIR}/${REVERSE_FASTQ[i]} --est_method RSEM --aln_method bowtie2 --output_dir ${SAMPLE_NAME[i]} --thread_count ${THREADS} --SS_lib_type RF"
    echo ${CMD2}
    eval ${CMD2}
done
