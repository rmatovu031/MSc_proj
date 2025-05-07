#!/bin/bash

data_file_dir ="PRS_project:/"
	
regenie_step1="regenie \
	--step 1 \
	--bed ukb_hg38_merge \
	--phenoFile AFR_GWAS_cov.phe \
	--phenoCol t2d_cc \
	--covarFile AFR_GWAS_cov.phe \
	--covarColList age,age_squared,age_sex,age_squared_sex,PC1,PC2,PC3,PC4,PC5,PC6,PC7,PC8,PC9,PC10,PC11,PC12,PC13,PC14,PC15,PC16,PC17,PC18,PC19,PC20 \
	--catCovarList sex,ever-smoked \
      	--extract array_snps_qc_pass.snplist \
	--bsize 1000 --bt --loocv --gz --threads 16 \
	--lowmem \
      	--out regenie_step1_out"
  
dx run swiss-army-knife\
	-iin="${data_file_dir}/liftover/ukb_hg38_merged.bed" \
	-iin="${data_file_dir}/liftover/ukb_hg38_merged.bim" \
	-iin="${data_file_dir}/liftover/ukb_hg38_merged.fam" \
	-iin="${data_file_dir}/step1_qc/AFR_GWAS_cov.phe" \
	-iin="${data_file_dir}/step1_qc/array_snps_qc_pass.snplist" \
	-icmd="${regenie_step1}" --tag="Step1" --instance-type "mem1_ssd1_v2_x36" \
	--destination="${data_file_dir}/step1_qc/" --brief --yes
