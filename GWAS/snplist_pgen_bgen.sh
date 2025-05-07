#!/bin/bash


# using the snplist from the QCed WGS PLINK2 files to get the equivalent for BGEN files
# BGEN.snplist is structured as chr22:10516273:A:C while
# pgen.snplist is structured as DRAGEN:chr22:10516273:A:C
# therefore, we just need to remove the starting 7 characters from the pgen snplist file.


## Step1
# Dowloading the .snplists

mkdir AFR_bgen_qc/ && cd AFR_bgen_qc/ ## on local machine

dx download PRS_project:/step2_qc/wgs_c*_qc_pass.snplist

## Step2:
# using stream editor (sed) to find the starting string 'DRAGEN:' and replace it nothing

for chr in {1..20}; do
  sed 's/^DRAGEN://' \
      wgs_c${chr}_qc_pass.snplist \
    > bgen_wgs_c${chr}_qc_pass.snplist
done

# uploading the snplist to the AFR_bgen_qc/ directory

dx upload bgen_wgs_c*_qc_pass.snplist --path PRS_project:/AFR_bgen_qc/ --brief
