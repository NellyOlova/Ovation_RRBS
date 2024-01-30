#! /bin/bash
#$ -cwd
#$ -t 1-96
#$ -l h_rt=24:0:0 
#$ -l h_vmem=16G

# Create lists of R1 and R2 file names with full path and in exact same sample ID order for R1 and R2
# Comment out lines containing R2 and FILE_LIST2 when analysing single end data
realpath *R1*trimmed.fq.gz > data_file_bismark_R1.txt
realpath *R2*trimmed.fq.gz > data_file_bismark_R2.txt

# Read the file list into an array
mapfile -t FILE_LIST1 < data_file_bismark_R1.txt
mapfile -t FILE_LIST2 < data_file_bismark_R2.txt

# Set the input file for each array task
INPUT_FILE1=${FILE_LIST1[$(($SGE_TASK_ID - 1))]}
INPUT_FILE2=${FILE_LIST2[$(($SGE_TASK_ID - 1))]}

# Execute the command
source /etc/profile.d/modules.sh
module load igmm/apps/bismark/0.22.3
module load igmm/apps/samtools/1.16.1
module load igmm/apps/bowtie/2.4.2

bismark --bowtie2 --sam /gpfs/igmmfs01/eddie/tchandra-lab/Nelly/Genomes/Zebrafinch/Primary_assembly/ -1 $INPUT_FILE1 -2 $INPUT_FILE2

