#!/bin/bash

# Set your input/output directories and adapter file path
INPUT_DIR="/home/zephyria27/RNA-seq/data/fastq"
OUTPUT_DIR="/home/zephyria27/RNA-seq/data/fastq_trimmed"

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Loop through all R1 fastq files
for R1 in "$INPUT_DIR"/*_R1.fastq; do
    # Get base name
    BASE=$(basename "$R1" _R1.fastq)
    R2="$INPUT_DIR/${BASE}_R2.fastq"

    # Define output file names
    PAIRED_R1="${OUTPUT_DIR}/${BASE}_R1_paired.fastq"
    UNPAIRED_R1="${OUTPUT_DIR}/${BASE}_R1_unpaired.fastq"
    PAIRED_R2="${OUTPUT_DIR}/${BASE}_R2_paired.fastq"
    UNPAIRED_R2="${OUTPUT_DIR}/${BASE}_R2_unpaired.fastq"

    # Run Trimmomatic
    trimmomatic PE -threads 4 -phred33 \
        "$R1" "$R2" \
        "$PAIRED_R1" "$UNPAIRED_R1" \
        "$PAIRED_R2" "$UNPAIRED_R2" \
        LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
done
