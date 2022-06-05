#!/bin/bash


for dir in $(ls annotation);do
	blastp -db virulence_factors/vfs -query annotation/$dir/*.faa -out virulence_factors/$dir\_vfs.outfmt -num_threads 12 -evalue 1e-5 -outfmt 6
	sort -k1,1 -k12,12gr -k11,11g -k3,3gr virulence_factors/$dir\_vfs.outfmt | sort -u -k1,1 --merge > virulence_factors/$dir\_bestHits
done


