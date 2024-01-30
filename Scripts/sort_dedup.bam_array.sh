#!/bin/bash
#$ -cwd
#$ -t 1-96
#$ -l h_rt=10:0:0
#$ -l h_vmem=8G

# This sorting is only performed on paired end data!
# Create a list of input file names with full path
realpath *dedup.bam > data_file_bam_sort.txt
# Create data_file_prefix.txt separately with the core sample names, in same order (reuse from nudup_array job)

# Read the file lists into an array
mapfile -t FILE_LIST1 < data_file_prefix.txt
mapfile -t FILE_LIST2 < data_file_bam_sort.txt

# Set the input file for each array task
INPUT_FILE1=${FILE_LIST1[$(($SGE_TASK_ID - 1))]}
INPUT_FILE2=${FILE_LIST2[$(($SGE_TASK_ID - 1))]}

# Execute the command
source /etc/profile.d/modules.sh
module load igmm/apps/samtools/1.16.1

samtools sort -n -@ 2 –o $INPUT_FILE1_PE.sorted-n.dedup.bam $INPUT_FILE2 


