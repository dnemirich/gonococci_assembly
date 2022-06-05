#!/bin/bash

for file in $(ls virulence_factors);do
	if [[ $file == *bestHits ]]
		then
			python3 hits_annotation.py --input_fa virulence_factors/$file --out virulence_factors/$file\_annotated.tsv
	fi
done
