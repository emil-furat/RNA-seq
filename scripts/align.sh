#!/bin/bash

# STEP 2: Run HISAT2
# mkdir HISAT2
# get the genome indices
# wget https://genome-idx.s3.amazonaws.com/hisat/grch38_genome.tar.gz

cd /home/zephyria27/RNA-seq

# run alignment
hisat2 -q --rna-strandness R -x HISAT2/grch38/genome -U data/fastq_trimmed/demo_trimmed.fastq | samtools sort -o HISAT2/demo_trimmed.bam
echo "HISAT2 finished running!"

