#!/bin/bash

cd /home/zephyria27/RNA-seq/data

featureCounts -s 2 -a Homo_sapiens.GRCh38.106.gtf -o quants/demo_featurecounts.txt ../HISAT2/demo_trimmed.bam
