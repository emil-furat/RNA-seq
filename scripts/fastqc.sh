#!/bin/bash

cd /home/zephyria27/RNA-seq

# STEP 1: Run fastqc for all fastq files in data folder
fastqc data/*.fastq -o data/
