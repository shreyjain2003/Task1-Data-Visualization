# Install required R packages if not already installed
required_packages <- c("ggplot2", "dplyr")

# Function to check and install missing packages
install_if_missing <- function(p) {
  if (!requireNamespace(p, quietly = TRUE)) {
    install.packages(p, dependencies = TRUE)
  }
}

# Apply installation function to all required packages
invisible(lapply(required_packages, install_if_missing))

# Load installed packages
library(ggplot2)
library(dplyr)
