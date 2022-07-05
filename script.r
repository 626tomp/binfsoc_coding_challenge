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

write.table(txi, file = "txi")

count_matrix <- txi$counts


# https://www.reneshbedre.com/blog/edger-tutorial.html
library("edgeR")
sample_info <- c("trt", "trt", "trt", "ctr", "ctr", "ctr")
dge <- DGEList(counts = count_matrix, group = factor(sample_info))
keep <- filterByExpr(y = dge)

dge <- dge[keep, , keep.lib.sizes=FALSE]
dge <- calcNormFactors(object = dge)
dge <- estimateDisp(y = dge)

et <- exactTest(object = dge)
top_degs = topTags(object = et, n = "Inf")

summary(decideTests(object = et, lfc = 1))
write.csv(as.data.frame(top_degs), file="condition_infected_vs_control_dge.csv")

