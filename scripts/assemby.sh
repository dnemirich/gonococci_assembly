#!/bin/bash

mkdir assembly


for file in $(ls trimmed | sed -E 's/[0-9]_trimmed.fastq.gz//g' | sort | uniq); do
	output_dirname=$(echo $file | sed -E 's/[-0-9]*_(S[0-9]+)_.*/\1/g')
	spades.py -1 trimmed/$file\1_trimmed.fastq.gz -2 trimmed/$file\2_trimmed.fastq.gz --careful -o assembly/$output_dirname
done
