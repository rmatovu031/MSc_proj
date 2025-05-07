#!/bin/bash

## Run relatedness estimates

# data_file_dir="PRS_project:/"

run_relatedness="plink2 --bfile /liftover/ukb_c1-22_hg38_merged \
	--king-cutoff 0.0884 \
	--out related_pairs"

dx run swiss-army-knife\
	-iin="/liftover/ukb_c1-22_hg38_merged.bed" \
	-iin="/liftover/ukb_c1-22_hg38_merged.bim" \
	-iin="/liftover/ukb_c1-22_hg38_merged.fam"\
	-icmd="${run_relatedness}" --tag="qc_kin" --instance-type "mem1_ssd1_v2_x16"\
	--destination="/step1_qc/" --brief --yes
