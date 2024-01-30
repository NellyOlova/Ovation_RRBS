#!/bin/bash
#$ -cwd
#$ -t 1-96
#$ -l h_rt=10:0:0 
#$ -l h_vmem=4G

# Create lists of R1 and R2 file names with full path and in exact same sample ID order for R1 and R2
# Comment out lines containing R2 and FILE_LIST2 when analysing single end data
realpath *R1*val_1.fq.gz > data_file_nugen_R1.txt
realpath *R2*val_2.fq.gz > data_file_nugen_R2.txt

# Read the file list into an array
mapfile -t FILE_LIST1 < data_file_nugen_R1.txt
mapfile -t FILE_LIST2 < data_file_nugen_R2.txt

# Set the input file for each array task
INPUT_FILE1=${FILE_LIST1[$(($SGE_TASK_ID - 1))]}
INPUT_FILE2=${FILE_LIST2[$(($SGE_TASK_ID - 1))]}

# Execute the command 
source /etc/profile.d/modules.sh
module load igmm/apps/python/2.7  

# Comment out -2 $INPUT_FILE2 when analysing single end data
python trimRRBSdiversityAdaptCustomers.py -1 $INPUT_FILE1 -2 $INPUT_FILE2
