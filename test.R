# This is a test file for polR

wd <- '.' # Input your working directory
setwd(wd)

devtools::document('polR')
install.packages("polR", type="source", repos=NULL)
library("polR")
ls("package:polR")
InitPolr()
ShowAPIKeys()
PopongAPI("bill")
PopongAPI("party")
PopongAPI("person")
