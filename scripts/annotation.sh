#!/bin/bash

for dir in $(ls assembly);do

	prokka --proteins /home/is2/internship/annotation/neisseria_ipg_modified.fasta --outdir annotation/$dir\_anno --prefix $dir assembly/$dir/contigs.fasta --genus Neisseria --species gonorrhea --cpus 15 --compliant

done
