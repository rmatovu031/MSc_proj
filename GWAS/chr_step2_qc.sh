#!/bin/bash

## Run WGS QC for per chromosome based on a paper by saluja et al. (2024) [https://pubmed.ncbi.nlm.nih.gov/39011893/]
  
#setting the WGS  directory that contains the PLINK2 formatted files
wgs_plink2_dir=PRS_project:/Bulk/DRAGEN\ WGS/DRAGEN\ population\ level\ WGS\ variants,\ PLINK\ format\ [500k\ release]

#setting the project home directory
home_dir="PRS_project:/"

## Loop over chromosomes 19–21
for chr in {19..21}; do

  ## Build the plink2 command string for this chr
  c_wgs_qc_cmd="plink2 \
    --pfile ukb24308_c${chr}_b0_v1 \
    --no-pheno \
    --keep ${home_dir}step1_qc/AFR_GWAS_cov.phe \
    --autosome \
    --remove ${home_dir}step1_qc/related_pairs.king.cutoff.out.id \
    --maf 0.01 --mac 100 \
    --geno 0.1 --hwe 1e-15 --mind 0.1 \
    --write-snplist --write-samples --no-id-header \
    --out wgs_c${chr}_qc_pass"

  ## Launch the job
  dx run swiss-army-knife \
    -iin="${wgs_plink2_dir}/ukb24308_c${chr}_b0_v1.pgen" \
    -iin="${wgs_plink2_dir}/ukb24308_c${chr}_b0_v1.pvar" \
    -iin="${wgs_plink2_dir}/ukb24308_c${chr}_b0_v1.psam" \
    -iin="${home_dir}step1_qc/AFR_GWAS_cov.phe" \
    -iin="${home_dir}step1_qc/related_pairs.king.cutoff.out.id" \
    -icmd="${c_wgs_qc_cmd}" \
    --tag="c${chr}_QC" \
    --instance-type "mem1_ssd1_v2_x36" \
    --destination="${home_dir}step2_qc/" \
    --brief --yes

done


#c22_wgs_qc="plink2 --pfile ukb24308_c22_b0_v1\
#	--no-pheno --keep AFR_GWAS_cov.phe --autosome\
#	--remove related_pairs.king.cutoff.out.id \
#      	--maf 0.01 --mac 100 --geno 0.1 --hwe 1e-15 --mind 0.1\
#      	--write-snplist --write-samples --no-id-header\
#      	--out wgs_c22_qc_pass"

#dx run swiss-army-knife -iin="${wgs_plink2_dir}/ukb24308_c22_b0_v1.pgen" \
#     	-iin="${wgs_plink2_dir}/ukb24308_c22_b0_v1.pvar" \
#     	-iin="${wgs_plink2_dir}/ukb24308_c22_b0_v1.psam" \
#	-iin="${home_dir}/step1_qc/AFR_GWAS_cov.phe" \
#     	-iin="${home_dir}/step1_qc/related_pairs.king.cutoff.out.id" \
#     	-icmd="${c22_wgs_qc}" --tag="c22_QC" --instance-type "mem1_ssd1_v2_x36" \
#     	--destination="${home_dir}/step2_qc/" --brief --yes

