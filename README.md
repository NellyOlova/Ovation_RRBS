# Ovation_RRBS
This repository contains scripts for processing of raw (fastq) files produced with the Tecan Ovation RRBS Methyl-seq library preparation protocol (methylation only).
It also contains the Tecan(Nugen) scripts, which are sourced from their original repositories and all further information on utilising these is available there:\
https://github.com/tecangenomics/NuMetRRBS \
https://github.com/tecangenomics/nudup

The data processing workflow includes the following steps:

Data merging and renaming\
Merging QC\
FastQC raw\
Trim Galore\
Trimmed FastQC (optional)\
Trim Nugen [custom step and script provided by Tecan]\
Nugen trimmed FastQC\
FastQ Screen [--bisulfite]\
Download latest genome assembly\
Add conversion control to the genome (optional)\
Bismark genome preparation\
Bismark alignment\
Strip bismark files [custom step and script provided by Tecan]\
Deduplicate NuDup [custom step and script provided by Tecan]\
Sort deduplicated files (paired-end data only)\
Methylation extraction\
MultiQC\



