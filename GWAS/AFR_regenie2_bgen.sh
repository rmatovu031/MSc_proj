#!/bin/bash

## Run REGENIE step2 [Association test] per chromosome

#setting the directories for the input files
wgs_bgen_dir="PRS_project:/Bulk/DRAGEN WGS/DRAGEN population level WGS variants, BGEN format [500k release]"

#setting the project home directory
home_dir="PRS_project:/"

# settting the chromosome number

for chr in {15..17}; do
	echo "submitting job for chromosome ${chr}"


	# Run REGENIE step2 association test
	dx run regenie_test_associations \
		-igenotype_bgen="${wgs_bgen_dir}/ukb24309_c${chr}_b0_v1.bgen" \
    		-igenotype_bgi="${wgs_bgen_dir}/ukb24309_c${chr}_b0_v1.bgen.bgi" \
    		-isample_file="${wgs_bgen_dir}/ukb24309_c${chr}_b0_v1.sample" \
		-iwgr_pred_file_list="${home_dir}/step1_qc/regenie_step1_out_pred.list" \
    		-iwgr_preds_locos="${home_dir}/step1_qc/regenie_step1_out_1.loco" \
    		-ipheno_txt="${home_dir}/step1_qc/AFR_GWAS_cov.phe" \
    		-iextract_txts="${home_dir}/AFR_bgen_qc/bgen_wgs_c${chr}_qc_pass.snplist" \
		-icovar_txt="${home_dir}/step1_qc/AFR_GWAS_cov.phe" \
		-iquant_traits=false \
    		-igeno_block_size=200 \
		-ipvalue_threshold=0.05 \
		-iuse_firth_approx=true \
		-iprs_mode=false \
		-ipheno_names="t2d_cc" \
		-icovar_names="age,age_squared,age_sex,age_squared_sex,PC1,PC2,PC3,PC4,PC5,PC6,PC7,PC8,PC9,PC10,PC11,PC12,PC13,PC14,PC15,PC16,PC17,PC18,PC19,PC20" \
		-imin_mac=3 \
		-itest_type="additive" \
		-iextra_cmd_line_args="--catCovarList sex,ever-smoked" \
		-ioutput_prefix="assoc_c21" \
    		--tag="c${chr}_assoc" \
    		--instance-type="mem1_ssd1_v2_x36" \
    		--priority="high" \
    		--destination="${home_dir}/regenie_AFR_out/" \
    		--brief --yes
done
