#!/bin/bash


mkdir fastANI_results

for file in $(ls references); do
	readlink -f references/$file >> ./fastANI_results/references.txt
done

for dir in $(ls assembly); do
	readlink -f assembly/$dir/contigs.fasta >> ./fastANI_results/query.txt
done


fastANI --ql home/is2/internship/fastANI_results/query.txt --rl home/is2/internship/fastANI_results/references.txt -o home/is2/internship/fastANI_results/fastani.out -t 12
