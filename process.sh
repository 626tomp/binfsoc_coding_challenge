# https://combine-lab.github.io/salmon/getting_started/

#salmon index -t GRCh38.all.fa.gz -i genome_index

FILES="SRR13783589.fastq.gz
SRR13783590.fastq.gz"
for f in *.fastq.gz
do
    echo "Processing $f"
    filename= echo $f | cut -d'.' -f1
    #salmon quant -i genome_index -l A -r SRR13783589.fastq.gz -p 8 --validateMappings -o quants/$filename

done




