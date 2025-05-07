#!/bin/bash

## Run job to generate a new .psam file with a header line 


#setting the WGS  directory that contains the PLINK2 formatted files
wgs_plink2_dir=PRS_project:/Bulk/DRAGEN\ WGS/DRAGEN\ population\ level\ WGS\ variants,\ PLINK\ format\ [500k\ release]

#setting the project home directory
home_dir="PRS_project:/"

fix_psam="plink2 \
	--pfile ukb24308_c22_b0_v1 \
  	--double-id \
  	--make-just-psam \
  	--out ukb24308_c22_b0_v1"

dx run swiss-army-knife -iin="${wgs_plink2_dir}/ukb24308_c22_b0_v1.pgen" \
        -iin="${wgs_plink2_dir}/ukb24308_c22_b0_v1.pvar" \
        -iin="${wgs_plink2_dir}/ukb24308_c22_b0_v1.psam" \
        -icmd="${fix_psam}" --tag="fix_psam" --instance-type "mem1_ssd1_v2_x16" --priority normal \
        --destination="${home_dir}/step2_qc/" --brief --yes
