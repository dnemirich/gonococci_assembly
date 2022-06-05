#!/bin/bash


#mkdir core_genomes


#for dir in $(ls annotation);do
	#cp annotation/$dir/*.gff core_genomes/
#done

roary -p 12 -f core_genomes -e --mafft -r core_genomes/*.gff

