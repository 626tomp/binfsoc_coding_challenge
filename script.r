if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install(version = "3.15")
BiocManager::install("edgeR")
BiocManager::install("tximport")
BiocManager::install("ensembldb")
BiocManager::install("AnnotationDbi")
BiocManager::install("TxDb.Hsapiens.UCSC.hg38.knownGene")


# https://bioconductor.org/packages/release/bioc/vignettes/tximport/inst/doc/tximport.html

library(tximport)
library(tximportData)


# haven't been tested/run, from link above


# gets names of samples from samples.txt
samples <- read.table(file.path("samples.txt"), header = TRUE)
samples

files <- file.path(samples, "quant.sf")

names(files) <- paste0("sample", 1:6)


library(TxDb.Hsapiens.UCSC.hg38.knownGene)
txdb <- TxDb.Hsapiens.UCSC.hg38.knownGene

k <- keys(txdb, keytype = "TXNAME")
tx2gene <- select(txdb, k, "GENEID", "TXNAME")


library(tximport)
txi <- tximport(files, type = "salmon", tx2gene = tx2gene)
names(txi)
head(txi$counts)
