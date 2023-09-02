#!/bin/bash

## This code is for unzip tar file. ##

IN_DIR="01_raw_file/00_raw_tar"
THRED="5"
########################################

CMD="tar -xvf  ${IN_DIR}/221215_KKS.tar"
echo ${CMD}
eval ${CMD}
