#! /bin/bash
#$ -cwd
#$ -t 1-96
#$ -l h_rt=10:0:0
#$ -l h_vmem=8G

# Create lists of R1 and R2 file names with full path and in exact same sample ID order for R1 and R2
# Comment out lines containing R2 and FILE_LIST2 when analysing single end data
realpath *R1*gz > data_file_R1.txt
realpath *R2*gz > data_file_R2.txt

# Read the file list into an array
mapfile -t FILE_LIST1 < data_file_R1.txt
mapfile -t FILE_LIST2 < data_file_R2.txt

# Set the input file for each array task
INPUT_FILE1=${FILE_LIST1[$(($SGE_TASK_ID - 1))]}
INPUT_FILE2=${FILE_LIST2[$(($SGE_TASK_ID - 1))]}

# Execute the command
source /etc/profile.d/modules.sh
module load igmm/apps/TrimGalore/0.6.6
module load igmm/apps/cutadapt/1.16
module load igmm/apps/FastQC/0.11.9

# Remove -a2 AAATCAAAAAAAC and $INPUT_FILE2 when processing single end data
trim_galore --paired --fastqc -a AGATCGGAAGAGC -a2 AAATCAAAAAAAC $INPUT_FILE1 $INPUT_FILE2


