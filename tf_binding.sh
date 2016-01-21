#!/bin/csh
#PBS -q hotel
#PBS -N tf_binding.sh
<<<<<<< HEAD
#PBS -l nodes=1:ppn=1
#PBS -l walltime=0:05:00
=======
<<<<<<< HEAD
#PBS -l nodes=1:ppn=2
#PBS -l walltime=0:10:00
#PBS -V
#PBS -M arguziko@ucsd.edu
=======
#PBS -l nodes=1:ppn=8
#PBS -l walltime=0:15:00
>>>>>>> f37c26c386754e8c45378bd1e9e55211399c8870
#PBS -o tf_binnding.sh.o4144289
#PBS -e tf_binding.sh.e4144289
#PBS -V
#PBS -M abanisad@ucsd.edu
>>>>>>> 80bd0218e6344c942b061a46c246cae99372200a
#PBS -m abe
<<<<<<< HEAD
#PBS -A ucsd-train15
cd ~/code/biom262-2016/weeks/week01/data/
=======
cd ~/code/biom262-2016/weeks/week01/data
>>>>>>> f37c26c386754e8c45378bd1e9e55211399c8870

echo "Hello I am a message in standard out (stdout)"

echo "Hello I am a message in standard error (stderr)" >&2


## Exercise 1

cat tf.bed | awk '{if ($4 == "NFKB") print$0}' > tf.nfkb.bed

wc -l tf.nfkb.bed
echo '--- First 10 lines ---'
head tf.nfkb.bed
echo '--- Random 10 lines ---'
awk -v seed=907 'BEGIN{srand(seed);}{ if (rand() < 0.5 ) {print $0}}'  tf.nfkb.bed | head
echo '--- Last 10 lines ---'
tail tf.nfkb.bed

## Exercise 2

cat gencode.v19.annotation.chr22.gtf | awk '{if($3 == "transcript")print}' > gencode.v19.annotation.chr22.transcript.gtf

wc -l gencode.v19.annotation.chr22.transcript.gtf
echo '--- First 10 lines ---'
head gencode.v19.annotation.chr22.transcript.gtf
echo '--- Random 10 lines ---'
awk -v seed=907 'BEGIN{srand(seed);}{ if (rand() < 0.5 ) {print $0}}'  gencode.v19.annotation.chr22.transcript.gtf | head
echo '--- Last 10 lines ---'
tail gencode.v19.annotation.chr22.transcript.gtf

## Exercise 3

<<<<<<< HEAD
=======
module load biotools
>>>>>>> f37c26c386754e8c45378bd1e9e55211399c8870
bedtools flank -i gencode.v19.annotation.chr22.transcript.gtf -g hg19.genome -l 2000 -r 0 -s > gencode.v19.annotation.chr22.transcript.promoter.gtf

wc -l gencode.v19.annotation.chr22.transcript.promoter.gtf
echo '--- First 10 lines ---'
head gencode.v19.annotation.chr22.transcript.promoter.gtf
echo '--- Random 10 lines ---'
awk -v seed=907 'BEGIN{srand(seed);}{ if (rand() < 0.5 ) {print $0}}' gencode.v19.annotation.chr22.transcript.promoter.gtf | head
echo '--- Last 10 lines ---'
tail gencode.v19.annotation.chr22.transcript.promoter.gtf

## Exercise 4


bedtools intersect -a gencode.v19.annotation.chr22.transcript.promoter.gtf -b tf.nfkb.bed > gencode.v19.annotation.chr22.transcript.promoter.nfkb.gtf

wc -l gencode.v19.annotation.chr22.transcript.promoter.nfkb.gtf
echo '--- First 10 lines ---'
head gencode.v19.annotation.chr22.transcript.promoter.nfkb.gtf
echo '--- Random 10 lines ---'
awk -v seed=908 'BEGIN{srand(seed);}{ if (rand() < 0.5 ) {print $0}}' gencode.v19.annotation.chr22.transcript.promoter.nfkb.gtf | head
echo '--- Last 10 lines ---'
tail gencode.v19.annotation.chr22.transcript.promoter.nfkb.gtf

## Excercise 5
<<<<<<< HEAD
=======

module load biotools
>>>>>>> f37c26c386754e8c45378bd1e9e55211399c8870

bedtools getfasta -fi GRCh37.p13.chr22.fa -bed gencode.v19.annotation.chr22.transcript.promoter.nfkb.gtf -s -fo gencode.v19.annotation.chr22.transcript.promoter.nfkb.fasta

wc -l gencode.v19.annotation.chr22.transcript.promoter.nfkb.fasta
echo '--- First 10 lines ---'
head gencode.v19.annotation.chr22.transcript.promoter.nfkb.fasta
echo '--- Random 10 lines ---'
awk -v seed=908 'BEGIN{srand(seed);}{ if (rand() < 0.5 ) {print $0}}' gencode.v19.annotation.chr22.transcript.promoter.nfkb.fasta | head
echo '--- Last 10 lines ---'
tail gencode.v19.annotation.chr22.transcript.promoter.nfkb.fasta
