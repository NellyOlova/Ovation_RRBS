#!/bin/bash
#$ -cwd
#$ -t 1-96 
#$ -l h_rt=5:0:0
#$ -l h_vmem=1G

# Create a list of input file names with full path - merging identical samples sequenced on lane 1 and lane 2:
realpath ./*/*_1_*I1.fastq.gz > data_file_lane1_index.txt
realpath ./*/*_2_*I1.fastq.gz > data_file_lane2_index.txt

Create a separate text file with desired names of the merged output file with full path of destination folder - paste and save:
nano data_file_merged_output_index.txt

# Read the file lists into an array
mapfile -t FILE_LIST1 < data_file_lane1_index.txt
mapfile -t FILE_LIST2 < data_file_lane2_index.txt
mapfile -t FILE_LIST3 < data_file_merged_output_index.txt

# Set the input file for each array task
INPUT_FILE1=${FILE_LIST1[$(($SGE_TASK_ID - 1))]}
INPUT_FILE2=${FILE_LIST2[$(($SGE_TASK_ID - 1))]}
INPUT_FILE3=${FILE_LIST3[$(($SGE_TASK_ID - 1))]}

# Execute the command

cat $INPUT_FILE1 $INPUT_FILE2 > $INPUT_FILE3
