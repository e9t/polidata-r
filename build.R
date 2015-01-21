# Reference: http://r-pkgs.had.co.nz/release.html
# install.packages(c("devtools", "knitr"))

wd = "."
setwd(wd)
getwd()

# Check  http://r-pkgs.had.co.nz/check.html
library(devtools)
devtools::check()

# Release http://r-pkgs.had.co.nz/release.html#release-submission
devtools::release()
