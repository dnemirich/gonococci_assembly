#!/bin/bash

if [[ -d snp_calling ]]
	then
		echo "Directory snp_calling already exists"
	else
		mkdir snp_calling
fi


for file in $(ls trimmed | sed -E 's/[0-9]_trimmed.fastq.gz//g' | sort | uniq); do
        output_dirname=$(echo $file | sed -E 's/[-0-9]*_(S[0-9]+)_.*/\1/g')
	snippy --cpus 12 --outdir snp_calling/$output_dirname --ref ./annotation/S1_anno/S1.gbk --R1 trimmed/$file\1_trimmed.fastq.gz --R2 trimmed/$file\2_trimmed.fastq.gz
done




