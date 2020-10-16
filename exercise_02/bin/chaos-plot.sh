#!/bin/bash

SPC=("$@")

echo "Chaos Plot for "$SPC
echo "Length: " ${SPC}_referencegenome.gb.gz
zcat $DT/${SPC}_referencegenome.fa.gz | \
  chaos -sequence fasta::stdin -verbose \
        -graph png -gtitle "$SPC chaos plot" \
        -goutfile $WDR/images/${SPC}_chaosplot
