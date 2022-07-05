# Code to generate tx2gene from reference transcriptome for use with tximport() in R
# Code found here: https://support.bioconductor.org/p/123134/
# Reference transcriptome: wget ftp://ftp.ensembl.org/pub/release-97/fasta/homo_sapiens/cdna/Homo_sapiens.GRCh38.cdna.all.fa.gz

 
zcat Homo_sapiens.GRCh38.cdna.all.fa.gz | grep '>' | cut -d ' ' -f1,4,7 > temp
paste <(cut -d '>' -f2 temp | cut -d ' ' -f1) <(cut -d ' ' -f2 temp | cut -d ':' -f2) <(cut -d ' ' -f3 temp | cut -d ':' -f2) >> tx2gene.txt
rm temp