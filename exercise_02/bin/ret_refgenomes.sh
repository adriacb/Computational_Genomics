#!/bin/bash

GBFTP=https://compgen.bio.ub.edu/~jabril/teaching/BScBI-CG2021/repo_ex2


while read Ospc Gftp;
  do {
    echo "# Downloading genome sequence for $Ospc" 1>&2;
    wget --user="bioinformatics" \
         --password="atg01tga" \
         $GBFTP/${Ospc}_referencegenome.gb.gz \
         -O $DT/${Ospc}_referencegenome.gb.gz
  }; done <<'EOF'
Ecol GCF_000005845.2_ASM584v2
Bsub GCF_000009045.1_ASM904v1
Mgen GCF_000027325.1_ASM2732v1
Mpne GCF_000027345.1_ASM2734v1
EOF
