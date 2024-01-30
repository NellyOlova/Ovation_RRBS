#! /bin/bash
#$ -cwd
#$ -t 1-96
#$ -l h_rt=10:0:0
#$ -l h_vmem=32G

# Create a list of input file names with full path
realpath *dedup.bam > data_file_bam.txt

# Read the file list into an array
mapfile -t FILE_LIST < data_file_bam.txt

# Set the input file for each array task
INPUT_FILE=${FILE_LIST[$(($SGE_TASK_ID - 1))]}

# Execute the command
source /etc/profile.d/modules.sh
module load igmm/apps/bismark/0.22.3
module load igmm/apps/samtools/1.16.1

bismark_methylation_extractor --comprehensive --gzip --parallel 4 --bedGraph --buffer 10G $INPUT_FILE

