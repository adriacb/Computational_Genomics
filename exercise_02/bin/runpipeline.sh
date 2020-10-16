#!/bin/bash
args="$@"
export BIN=$WDR/bin
export DT=$WDR/data
echo $args
# Be sure to define correctly the genomes in ret_refgenomes.sh
#
echo "RETREIVE GENOMES"
. $WDR/bin/ret_refgenomes.sh
echo ""


echo "RAW FORMAT (FASTA)"
for SPC in $args;
do
  . $WDR/bin/raw_seq.sh $SPC
done
echo ""


echo "CHAOS-PLOT"
for SPC in $args;
do
  . $WDR/bin/chaos-plot.sh $SPC
done
echo ""

# provide execution permissions to the perl script
chmod a+x $WDR/bin/genomicgcwindows.pl

echo "Genomic GC Windows"
for SPC in $args;
do
  for w in 100 200 500 1000 2000 5000 10000;
  do
    echo "Windows analysis of "$SPC" with windows length "$w;
    zcat $DT/${SPC}_referencegenome.fa.gz | \
    $WDR/bin/genomicgcwindows.pl $w - | \
    gzip -c9 -> $WDR/stats/${SPC}_genomegcanalysis_wlen$w.tbl.gz;
  done;
done;
echo ""

echo "Checking output of Genomic GC Windows"
for SPC in $args;
do
  ls -1 $WDR/stats/${SPC}_genomegcanalysis_wlen*.tbl.gz | \
    while read FL;
      do {
        echo $FL;
        zcat $FL | head -2;
      }; done;
done;
