#! /bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -l h_vmem=8G
#$ -pe sharedmem 16
#$ -l h_rt=5:00:00
#$ -M nelly.olova@igmm.ed.ac.uk
#$ -m beas

# Execute the command
source /etc/profile.d/modules.sh
module load igmm/apps/FastQC/0.11.9

# the threads equal fastq file number
fastqc --threads 96 /gpfs/igmmfs01/eddie/tchandra-lab/Nelly/RRBS/Zebrafinch/Lot_3/*fastq.gz

