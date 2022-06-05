#!/bin/bash

mkdir fastqs
mkdir qc_reports

ln -s /home/is2/internship/reads/*.fastq.gz fastqs/

TAGS=$(ls ./fastqs/*_S*_R*.fastq.gz | xargs -n 1 basename | sed 's/.fastq.gz//' | uniq)

for TAG in $TAGS; do
   OUTDIR="./qc_reports/$TAG"; mkdir -p "$OUTDIR"
   fastqc -o "$OUTDIR" "./fastqs/$TAG.fastq.gz" |& tee "$OUTDIR/$TAG.fastqc.log"
done

multiqc ./qc_reports

