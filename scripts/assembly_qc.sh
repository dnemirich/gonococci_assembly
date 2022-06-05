#!/bin/bash

mkdir assembly_qc

for dir in $(ls assembly); do
	quast.py assembly/$dir/contigs.fasta -o assembly_qc/$dir\_qc
done
