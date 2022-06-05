#!/bin/bash

mkdir assembly_qc_reference_based

for dir in $(ls assembly); do

	if [ $dir = "S1" ] || [ $dir = "S3" ] || [ $dir = "S12" ] || [ $dir = "S14" ] || [ $dir = "S16" ]
		then
		reference="/home/is2/internship/references_top/GCA_000695425.1_NG-i19.05_genomic.fna.gz"
	else
		reference="/home/is2/internship/references_top/GCA_003428775.1_ASM342877v1_genomic.fna.gz"
	fi

	quast.py assembly/$dir/contigs.fasta -o assembly_qc_reference_based/$dir\_qc -R $reference
done

