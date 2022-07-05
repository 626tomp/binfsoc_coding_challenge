if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

install.packages("readr")

BiocManager::install(version = "3.15")
BiocManager::install("edgeR")
BiocManager::install("tximport")


library(tximport)

# get data
files <- file.path("results", list.files("./results"))

# name samples
names(files) <- paste0("sample", 1:6)

#get list of gene names
tx2gene <- read.table(file.path("tx2gene.txt"))


library(tximport)
txi <- tximport(files, type = "salmon", tx2gene = tx2gene)
  names(txi)
head(txi$counts)
