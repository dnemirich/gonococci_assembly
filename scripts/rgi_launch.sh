#!/bin/bash


mkdir resistance_determinants

for dir in $(ls annotation);do
	rgi main -i annotation/$dir/*.faa -o resistance_determinants/$dir -t protein  --clean
done

