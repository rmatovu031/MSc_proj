#!/bin/bash

## Run WGS QC per chromosome based on a paper by saluja et al. (2024) [https://pubmed.ncbi.nlm.nih.gov/39011893/]

  
#setting the WGS  directory that contains the PLINK2 formatted files
wgs_plink2_dir=PRS_project:/Bulk/DRAGEN\ WGS/DRAGEN\ population\ level\ WGS\ variants,\ PLINK\ format\ [500k\ release]

#setting the project home directory
home_dir="PRS_project:/"

c18_wgs_qc="plink2 --pfile ukb24308_c18_b0_v1\
	--no-pheno --keep AFR_GWAS_cov.phe --autosome\
	--remove related_pairs.king.cutoff.out.id \
      	--maf 0.01 --mac 100 --geno 0.1 --hwe 1e-15 --mind 0.1\
      	--write-snplist --write-samples --no-id-header\
      	--out wgs_c18_qc_pass"

dx run swiss-army-knife -iin="${wgs_plink2_dir}/ukb24308_c18_b0_v1.pgen" \
     	-iin="${wgs_plink2_dir}/ukb24308_c18_b0_v1.pvar" \
     	-iin="${wgs_plink2_dir}/ukb24308_c18_b0_v1.psam" \
	-iin="${home_dir}/step1_qc/AFR_GWAS_cov.phe" \
     	-iin="${home_dir}/step1_qc/related_pairs.king.cutoff.out.id" \
     	-icmd="${c18_wgs_qc}" --tag="c18_QC" --instance-type "mem1_ssd1_v2_x36" --priority normal \
     	--destination="${home_dir}/step2_qc/" --brief --yes

