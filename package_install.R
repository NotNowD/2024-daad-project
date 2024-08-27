
install_if_missing <- function(package_name, bioconductor = FALSE) {
  if (!requireNamespace(package_name, quietly = TRUE)) {
    if (bioconductor) {
      BiocManager::install(package_name)
    } else {
      install.packages(package_name)
    }
  }
  library(package_name, character.only = TRUE)
}

install_if_missing("readr")
install_if_missing("tidyverse")
install_if_missing("conflicted")
install_if_missing("scales")
install_if_missing("BiocManager")
install_if_missing("recount3", bioconductor = TRUE)
install_if_missing("DESeq2", bioconductor = TRUE)
