# https://combine-lab.github.io/salmon/getting_started/

#conda activate salmon
#salmon index -t GRCh38.all.fa.gz -i genome_index

for f in *.fastq.gz
do
    echo "Processing $f"
    filename=$(echo $f | cut -d'.' -f1)
    echo "Running: salmon quant -i genome_index -l A -r $f -p 8 --validateMappings -o quants/${filename}/"
    #salmon quant -i genome_index -l A -r $f -p 8 --validateMappings -o quants/${filename}/
    
    $(cp quants/${filename}/quant.sf  results/${filename}.sf)

done




