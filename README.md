# Ovation_RRBS
Bash scripts for parallel processing of raw (fastq) files produced with the Tecan/NuGEN Ovation RRBS Methyl-seq library preparation protocol. \
This workflow deals with methylation data only (no hydroxymethyl-cytosine) - for detailed library preparation instructions see [Ovation RRBS Methyl-seq library preparation protocol](https://slack.protocols.io:8443/view/ovation-rrbs-methyl-seq-library-prep-cve4w3gw.html). \
The Tecan(NuGEN) scripts are also included, sourced from their original repositories and all further information on utilising these is available there:\
https://github.com/tecangenomics/NuMetRRBS \
https://github.com/tecangenomics/nudup

## Workflow
The data processing workflow includes the following steps:

Data merging and renaming\
Merging QC\
FastQC raw\
Trim Galore\
Trimmed FastQC (optional)\
Trim Nugen [custom step and script provided by Tecan]\
Nugen trimmed FastQC\
FastQ Screen [--bisulfite]\
Download latest genome assembly\
Add conversion control to the genome (optional)\
Bismark genome preparation\
Bismark alignment\
Strip bismark files [custom step and script provided by Tecan]\
Deduplicate NuDup [custom step and script provided by Tecan]\
Sort deduplicated files (paired-end data only)\
Methylation extraction\
MultiQC

## System requirements
The scripts are written for the University of Edinburgh high performance compute cluster, which is equipped with a job scheduler and suitable to run job arrays  (multiple files processed in parallel).\
This is the list of used software tools - the specific requirements for each tool must be checked separately.
1. FastQC for data quality check: http://www.bioinformatics.babraham.ac.uk/projects/fastqc/ 
2. FastQ Screen for data purity (contamination) check: https://www.bioinformatics.babraham.ac.uk/projects/fastq_screen/ 
3. TrimGalore! and CutAdapt for read trimming and Illumina adapter removal: http://www.bioinformatics.babraham.ac.uk/projects/trim_galore/; https://github.com/marcelm/cutadapt 
4. Bismark for bisulfite converted read mapping and methylation extraction: http://www.bioinformatics.babraham.ac.uk/projects/bismark/ 
5. bowtie2 is necessary for several of the steps: http://bowtie-bio.sourceforge.net/bowtie2/index.shtml 
6. samtools is necessary for several of the steps: http://samtools.sourceforge.net/ 
7. MultiQC – for compiling final summary reports from each step: https://multiqc.info/ 
8. The above tools need Perl and Python installed. Do note that all Nugen python scripts are written and run with python2.7!

## Tecan/Nugen scripts
All listed above tools have comprehensive tutorials and active online support. \
Support for Nugen scripts has been suspended, however, the previously reported and resolved errors in the associated Github repositories can be useful during troubleshooting. I am flagging most common issues. 

Nudup.py - common issues: 
1) Requires large temporary storage space whilst running, so make sure to provide a physical path to a server if running on a network. If storage isn't enough, it cannot complete but hangs and fills up all available space, preventing other users from working, and the temporary files must be removed manually. Displays random errors when temporary memory is not enough or not accurately allocated in the command line.
2) Failing to install samtools results in an empty error message, which makes it difficult to debug.

   ![image](https://github.com/NellyOlova/Ovation_RRBS/assets/20169496/5e116cf0-97e7-4131-9b6a-6e987d549cd8) 

## Contacts
Nelly Olova nelly.olova@ed.ac.uk

