#!/bin/bash

mkdir busco_qc


for dir in $(ls assembly); do
busco -i assembly/$dir/contigs.fasta -c 12 -o $dir --out_path /home/is2/internship/busco_qc/gonococci \
-m genome -l neisseriales_odb10 -f
done
