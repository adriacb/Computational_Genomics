#!/bin/bash

SPC=("$@")


echo "Converting: " $SPC
zcat $DT/${SPC}_referencegenome.gb.gz | \
  seqret -sequence genbank::stdin -outseq fasta::stdout | \
    gzip -9c - > $DT/${SPC}_referencegenome.fa.gz

echo ""
echo "CHECKING LENGTH SEQUENCES: "

echo "Length: " ${SPC}_referencegenome.gb.gz
zegrep '^LOCUS'  $DT/${SPC}_referencegenome.gb.gz
echo "Length GenBank file: " ${SPC}_referencegenome.gb.gz
zcat $DT/${SPC}_referencegenome.fa.gz | \
  infoseq -sequence fasta::stdin \
          -noheading -only -name -length -pgc
echo ""
