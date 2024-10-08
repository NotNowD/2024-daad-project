
install_if_missing <- function(package_name, bioconductor = FALSE, github_repo = NULL) {
  if (!requireNamespace(package_name, quietly = TRUE)) {
    # Спробуйте встановити з CRAN або Bioconductor
    if (bioconductor) {
      BiocManager::install(package_name)
    } else {
      install.packages(package_name)
    }
    
    # Якщо пакет все ще не встановлений, спробуйте встановити з GitHub
    if (!requireNamespace(package_name, quietly = TRUE) && !is.null(github_repo)) {
      if (!requireNamespace("devtools", quietly = TRUE)) {
        install.packages("devtools")
      }
      devtools::install_github(github_repo)
    }
  }
  library(package_name, character.only = TRUE)
}

# Базові бібліотеки
install_if_missing("readr")
install_if_missing("tidyverse")
install_if_missing("ggrepel")
install_if_missing("patchwork")
install_if_missing("pheatmap")
install_if_missing("conflicted")
install_if_missing("scales")
install_if_missing("BiocManager")

# Bioconductor пакети
install_if_missing("recount3", bioconductor = TRUE)
install_if_missing("DESeq2", bioconductor = TRUE)

# Інші пакети
install_if_missing("ashr")
install_if_missing("EnhancedVolcano", github_repo = "kevinblighe/EnhancedVolcano")

# KEGG pathway аналіз
install_if_missing("pathview", bioconductor = TRUE)
install_if_missing("clusterProfiler", bioconductor = TRUE)

# Допоміжні бібліотеки для роботи з анотаціями генів
install_if_missing("org.Hs.eg.db", bioconductor = TRUE)
install_if_missing("biomaRt", bioconductor = TRUE)
