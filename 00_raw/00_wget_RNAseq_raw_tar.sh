#!/bin/bash

## This code is for get tar file. ##
DOWN_DIR="01_raw_file/00_raw_tar"
#######################################

CMD="nohup wget http://download.labgenomics.com/data/221215_KKS/221215_KKS.tar -p ${DOWN_DIR} > ${DOWN_DIR}/00_wget_log.txt 2>&1 &"
echo ${CMD}
eval ${CMD}
