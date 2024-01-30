#!/bin/bash
#$ -cwd
#$ -t 1-96
#$ -l h_rt=5:0:0 
#$ -l h_vmem=8G

# Create a list of file names with full path
realpath *sam > data_file_strip.txt

# Read the file list into an array
mapfile -t FILE_LIST < data_file_strip.txt

# Set the input file for each array task
INPUT_FILE=${FILE_LIST[$(($SGE_TASK_ID - 1))]}

# Execute the command
source /etc/profile.d/modules.sh
module load igmm/apps/samtools/1.16.1

bash strip_bismark_sam.sh $INPUT_FILE

