#!/bin/bash

esearch -db assembly -query 'neisseria gonorrhoeae' \
    | esummary \
    | xtract -pattern DocumentSummary -element FtpPath_GenBank \
    | while read -r line;
    do
        fname=$(echo $line | grep -o 'GCA_.*' | sed 's/$/_genomic.fna.gz/');
        wget "$line/$fname";
    done
