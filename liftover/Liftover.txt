LIFTOVER 

Loop to create IDs
BED FILES
for chr in {1..22}; do
    dx find data --name "ukb22418_c${chr}_b0_v2.bed" --brief >> bed_file_ids.txt
done

BIM FILES
for chr in {1..22}; do
    dx find data --name "ukb22418_c${chr}_b0_v2.bim" --brief >> bim_file_ids.txt
done

FAM FILES
for chr in {1..22}; do
    dx find data --name "ukb22418_c${chr}_b0_v2.fam" --brief >> fam_file_ids.txt
done

ALTERNATIVELY

we can add the chromosome name to conform the corresponding FILE-ID using;
for chr in {1..22}; do
    file_id=$(dx find data --name "ukb22418_c${chr}_b0_v2.bed" --brief)
    echo "CHR${chr} - ID ${file_id}" >> bed_file_name.txt
done

for chr in {1..22}; do
    file_id=$(dx find data --name "ukb22418_c${chr}_b0_v2.bim" --brief)
    echo "CHR${chr} - ID ${file_id}" >> bim_file_name.txt
done

for chr in {1..22}; do
    file_id=$(dx find data --name "ukb22418_c${chr}_b0_v2.fam" --brief)
    echo "CHR${chr} - ID ${file_id}" >> fam_file_name.txt
done
