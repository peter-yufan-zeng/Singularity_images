# Fail fast
set -o errexit

# Fill this file with your environment creation
git clone https://github.com/McGranahanLab/CONIPHER-wrapper/
cd CONIPHER-wrapper
mamba create -n conipher -c conda-forge -c bioconda pyclone r-base=3.6.1 r-essentials r-tidyverse r-cowplot r-ggpubr r-fst r-biocmanager r-devtools r-seqminer
mamba activate conipher \
	&& Rscript -e 'install.packages("mclust");
	BiocManager::install("GenomicRanges");
BiocManager::install("Rsamtools");
install.packages("gplots");
install.packages("gdata");
install.packages("future");
install.packages("optparse");
install.packages("bootstrap");
BiocManager::install("copynumber");
devtools::install_version("sequenza", version = "2.1.2");
install.packages("coin");
install.packages("wordcloud");
devtools::install_github("McGranahanLab/CONIPHER")'
