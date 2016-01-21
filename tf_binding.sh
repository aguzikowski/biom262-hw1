#!/bin/bash
#PBS -q hotel
#PBS -N tf_binding.sh
#PBS -l nodes=1:ppn=1
#PBS -l walltime=0:05:00
#PBS -e tf_binding_error.e
#PBS -o tf_binding_output.o
#PBS -V
#PBS -M arguziko@ucsd.edu,abanisad@ucsd.edu
#PBS -m abe
cd /home/ucsd-train15/code/biom262-hw1/data/

echo "Hello I am a message in standard out (stdout)"

echo "Hello I am a message in standard error (stderr)" >&2


## Exercise 1

awk -F "\t" '{if ($4 == "NFKB") {print $0}}' tf.bed  > tf.nfkb.bed


## Exercise 2

awk -F "\t" '{if($3 == "transcript"){print $0}}' gencode.v19.annotation.chr22.gtf > gencode.v19.annotation.chr22.transcript.gtf


## Exercise 3

module load biotools

bedtools flank -i gencode.v19.annotation.chr22.transcript.gtf -g hg19.genome -l 2000 -r 0 -s > gencode.v19.annotation.chr22.transcript.promoter.gtf


## Exercise 4

bedtools intersect -a gencode.v19.annotation.chr22.transcript.promoter.gtf -b tf.nfkb.bed > gencode.v19.annotation.chr22.transcript.promoter.nfkb.gtf


## Excercise 5

module load biotools

bedtools getfasta -fi GRCh37.p13.chr22.fa -bed gencode.v19.annotation.chr22.transcript.promoter.nfkb.gtf -s -fo gencode.v19.annotation.chr22.transcript.promoter.nfkb.fasta

echo $PWD
