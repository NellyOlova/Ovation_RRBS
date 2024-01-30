#! /bin/bash
#$ -cwd
#$ -t 1-96
#$ -l h_rt=24:0:0
#$ -l h_vmem=64G

# Create lists of input file names with full path (all with same sample order!) 
realpath *_stripped.sam > data_file_sam.txt 
realpath *_I1_merged.fastq.gz > data_file_index.txt 
# Create data_file_prefix.txt separately with the core sample names in same order

# Read the file lists into an array
mapfile -t FILE_LIST1 < data_file_index.txt
mapfile -t FILE_LIST2 < data_file_prefix.txt
mapfile -t FILE_LIST3 < data_file_sam.txt

# Set the input files for each array task
INPUT_FILE1=${FILE_LIST1[$(($SGE_TASK_ID - 1))]}
INPUT_FILE2=${FILE_LIST2[$(($SGE_TASK_ID - 1))]}
INPUT_FILE3=${FILE_LIST3[$(($SGE_TASK_ID - 1))]}

# Execute the command
source /etc/profile.d/modules.sh
module load igmm/apps/python/2.7
module load igmm/apps/samtools/1.16.1
module load igmm/apps/bowtie/2.4.2

python nudup.py -f $INPUT_FILE1 -o $INPUT_FILE2 $INPUT_FILE3
