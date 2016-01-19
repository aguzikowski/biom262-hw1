#PBS -q hotel
#PBS -N tf_binding.sh
#PBS -l nodes=10:ppn=2
#PBS -l walltime=0:50:00
#PBS -o tf_binnding.sh.o4144289
#PBS -e tf_binding.sh.e4144289
#PBS -V
#PBS -M abanisad@ucsd.edu, arguziko@ucsd.edu
#PBS -m abe
#PBS -A ucsd-train15
cd /oasis/tscc/scratch/ucsd-train15/code/biom262-2016/weeks/week01/biom262-hw1

echo "Hello I am a message in standard out (stdout)"

## Exercise 4
%%bash --out exercise4

module load biotools

bedtools intersect -a gencode.v19.annotation.chr22.transcript.promoter.gtf -b tf.nfkb.bed > gencode.v19.annotation.chr22.transcript.promoter.nfkb.gtf

wc -l gencode.v19.annotation.chr22.transcript.promoter.nfkb.gtf
echo '--- First 10 lines ---'
head gencode.v19.annotation.chr22.transcript.promoter.nfkb.gtf
echo '--- Random 10 lines ---'
awk -v seed=908 'BEGIN{srand(seed);}{ if (rand() < 0.5 ) {print $0}}' gencode.v19.annotation.chr22.transcript.promoter.nfkb.gtf | head
echo '--- Last 10 lines ---'
tail gencode.v19.annotation.chr22.transcript.promoter.nfkb.gtf

## Excercise 5
%%bash --out exercise5

module load biotools

bedtools getfasta -fi GRCh37.p13.chr22.fa -bed gencode.v19.annotation.chr22.transcript.promoter.nfkb.gtf -s -fo gencode.v19.annotation.chr22.transcript.promoter.nfkb.fasta

wc -l gencode.v19.annotation.chr22.transcript.promoter.nfkb.fasta
echo '--- First 10 lines ---'
head gencode.v19.annotation.chr22.transcript.promoter.nfkb.fasta
echo '--- Random 10 lines ---'
awk -v seed=908 'BEGIN{srand(seed);}{ if (rand() < 0.5 ) {print $0}}' gencode.v19.annotation.chr22.transcript.promoter.nfkb.fasta | head
echo '--- Last 10 lines ---'
tail gencode.v19.annotation.chr22.transcript.promoter.nfkb.fasta
