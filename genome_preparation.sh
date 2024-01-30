#! /bin/bash
#$ -S /bin/bash
#$ -cwd
#$ -l h_vmem=32G
#$ -l h_rt=48:00:00
#$ -M nelly.olova@igmm.ed.ac.uk
#$ -m beas

source /etc/profile.d/modules.sh
module load igmm/apps/bismark/0.22.3
module load igmm/apps/bowtie/2.4.2

bismark_genome_preparation --path_to_aligner /exports/igmm/software/pkg/el7/apps/bowtie/2.4.2/ --verbose /gpfs/igmmfs01/eddie/tchandra-lab/Nelly/Genomes/Zebrafinch/Primary_assembly

