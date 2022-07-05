if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install(version = "3.15")
BiocManager::install("edgeR")
BiocManager::install("tximport")

# https://bioconductor.org/packages/release/bioc/vignettes/tximport/inst/doc/tximport.html

library(tximport)
library(tximportData)


# haven't been tested/run, from link above


# gets names of samples from samples.txt
samples <- read.table(file.path("samples.txt"), header = TRUE)
samples

files <- file.path(dir, "salmon", samples$run, "results/quant.sf")

names(files) <- paste0("sample", 1)

txi.salmon <- tximport(files, type = "salmon", tx2gene = tx2gene)

head(txi.salmon$counts)
