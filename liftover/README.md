Array-Genotype LiftOver
UK Biobank SNP array genotype calls (bulk, genotype calls) for step 1 of REGENIE are mapped to GRCh37, while the WGS are mapped to GRCh38. We Therefore lift the coordinates of genotype calls over to GRCh38 using LiftOver before conducting the rest of the analysis, so that our genotype calls are consistent.

The pipeline https://github.com/dnanexus-rnd/liftover_plink_beds/blob/main/README.md is used for the liftover.

WDL input files;
1. liftover_input.json
2. target ref.
3. liftover chain file
4.

GRCh38_full_analysis_set_plus_decoy_hla.fa under /Bulk/Exome sequences/Exome OQFE CRAM files/helper_files/ on RAP) 
