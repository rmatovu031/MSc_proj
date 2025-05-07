#!/bin/bash

## Run BGEN WGS QC

#setting the WGS  directory that contains the BGEN formatted files
wgs_bgen_dir=PRS_project:/Bulk/DRAGEN\ WGS/DRAGEN\ population\ level\ WGS\ variants,\ BGEN\ format\ [500k\ release]

#setting the project home directory
home_dir="PRS_project:/"

bgen_wgs_18_qc="plink2 --bgen ukb24309_c18_b0_v1.bgen 'ref-first' \
	--sample ukb24309_c18_b0_v1.sample \
	--keep AFR_GWAS_cov.phe --autosome --no-pheno \
	--remove related_pairs.king.cutoff.out.id \
        --maf 0.01 --mac 20 --geno 0.1 --hwe 1e-15 --mind 0.1 \
        --write-snplist --write-samples --no-id-header \
        --out bgen_wgs_c18_qc_pass"

dx run swiss-army-knife -iin="${wgs_bgen_dir}/ukb24309_c18_b0_v1.bgen" \
        -iin="${wgs_bgen_dir}/ukb24309_c18_b0_v1.bgen.bgi" \
        -iin="${wgs_bgen_dir}/ukb24309_c18_b0_v1.sample" \
        -iin="${home_dir}/step1_qc/AFR_GWAS_cov.phe" \
        -iin="${home_dir}/step1_qc/related_pairs.king.cutoff.out.id" \
        -icmd="${bgen_wgs_18_qc}" --tag="bgen_qc_18" --instance-type "mem1_ssd1_v2_x36" --priority high \
        --destination="${home_dir}/AFR_bgen_qc/" --brief --yes
