#!/bin/bash

## Run REGENIE step2 [Association test] per chromosome


#setting the directories for the input files
wgs_plink2_dir=PRS_project:/Bulk/DRAGEN\ WGS/DRAGEN\ population\ level\ WGS\ variants,\ BGEN\ format\ [500k\ release]

#setting the project home directory
home_dir="PRS_project:/"

c21_regenie_step2="regenie --step 2 --bgen ukb24309_c21_b0_v1 \
        --phenoFile AFR_GWAS_cov.phe --covarFile AFR_GWAS_cov.phe \
        --extract wgs_c21_qc_pass.snplist \
        --pred regenie_step1_out_pred.list \
        --phenoCol t2d_cc \
        --covarColList age,age_squared,age_sex,age_squared_sex,PC1,PC2,PC3,PC4,PC5,PC6,PC7,PC8,PC9,PC10,PC11,PC12,PC13,PC14,PC15,PC16,PC17,PC18,PC19,PC20 \
        --catCovarList sex,ever-smoked \
        --bsize 200 --pThresh 0.05 --bt --firth --approx --firth-se --minMAC 3 --threads 36 \
        --out assoc_c22"

dx run regenie_test_associations -iin="${wgs_plink2_dir}/ukb24309_c21_b0_v1.bgen" \
        -iin="${wgs_plink2_dir}/ukb24309_c21_b0_v1.bgen.bgi" \
        -iin="${wgs_plink2_dir}/ukb24309_c21_b0_v1.sample" \
        -iin="${home_dir}/step1_qc/AFR_GWAS_cov.phe" \
        -iin="${home_dir}/step2_qc/wgs_c21_qc_pass.snplist" \
        -iin="${home_dir}/step1_qc/regenie_step1_out_pred.list" \
        -iin="${home_dir}/step1_qc/regenie_step1_out_1.loco" \
        -icmd="${c21_regenie_step2}" --tag="c21_assoc" --instance-type "mem1_ssd1_v2_x36" --priority normal \
        --destination="${home_dir}/regenie_AFR_out/" --brief --yes
