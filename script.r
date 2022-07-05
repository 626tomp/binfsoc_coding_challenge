if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install(version = "3.15")
BiocManager::install("edgeR")
BiocManager::install("tximport")

# https://bioconductor.org/packages/release/bioc/vignettes/tximport/inst/doc/tximport.html

library(tximport)
library(tximportData)


# haven't been tested/run, from link above

samples <- read.table(file.path("samples.txt"), header = TRUE)
samples

files <- file.path("quant.sf")

names(files) <- paste0("sample", 1)

library(tximport)
txi <- tximport(files, type = "salmon", txOut = TRUE)
names(txi)
names(txi$infReps)

head(txi.salmon$counts)