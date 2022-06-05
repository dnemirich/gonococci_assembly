#!/bin/bash

mkdir trimmed

abs_path="/home/is2/internship/fastqs"
out_dir="/home/is2/internship/trimmed"

for file in $(ls $abs_path | sed -E 's/[0-9]_001.fastq.gz//g' | sort | uniq); do 

bbduk.sh ref=/home/is2/.conda/envs/gonococci_assembly/opt/bbmap-38.79-0/resources/adapters.fa  maq=20 ktrim=r k=21 mink=11 hdist=2 ftl=20 qtrim=rl trimq=20 tpe tbo in=$abs_path/$file\1_001.fastq.gz in2=$abs_path/$file\2_001.fastq.gz out=$out_dir/$file\1_trimmed.fastq.gz out2=$out_dir/$file\2_trimmed.fastq.gz overwrite=t 2>>log.txt

done

echo "Trimming is over"

# trimmed reads qc

echo "QC step"

mkdir trimmed_qc_reports


TAGS=$(ls $out_dir/*_S*_R*.fastq.gz | xargs -n 1 basename | sed 's/.fastq.gz//' | uniq)

for TAG in $TAGS; do
   OUTDIR="./trimmed_qc_reports/$TAG"; mkdir -p "$OUTDIR"
   fastqc -o "$OUTDIR" "$out_dir/$TAG.fastq.gz" |& tee "$OUTDIR/$TAG.fastqc.log"
done

multiqc ./trimmed_qc_reports

echo "QC step is done"
