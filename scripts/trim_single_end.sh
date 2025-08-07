#!/bin/bash

# Set your input/output directories and adapter file
INPUT_DIR="/home/zephyria27/RNA-seq/data/fastq"
OUTPUT_DIR="/home/zephyria27/RNA-seq/data/fastq_trimmed"

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Loop through all single-end FASTQ files
for FILE in "$INPUT_DIR"/*.fastq; do
    BASENAME=$(basename "$FILE" .fastq)
    OUTPUT="${OUTPUT_DIR}/${BASENAME}_trimmed.fastq"

    # Run Trimmomatic in single-end mode
    trimmomatic SE -threads 4 "$FILE" "$OUTPUT" TRAILING:10 -phred33
	
    # Re-run fastqc on trimmed fastq files
    fastqc "$OUTPUT" -o "$OUTPUT_DIR"
done
