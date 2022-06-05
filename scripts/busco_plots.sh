#!/bin/bash

mkdir busco_qc/gonococci/summaries

for dir in $(ls busco_qc/gonococci); do
	cp busco_qc/gonococci/$dir/short_summary.specific.neisseriales_odb10*.txt busco_qc/gonococci/summaries/.
done

generate_plot.py –wd generate_plot.py -wd /home/is2/internship/busco_qc/gonococci/summaries/


