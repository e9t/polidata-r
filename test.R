# This is a test file for polr

wd <- '.' # Input your working directory
setwd(wd)

devtools::document('polr')
install.packages("polr", type="source", repos=NULL)
library("polr")
ls("package:polr")
InitPolr()
ShowAPIKeys()
PopongAPI("bill")
PopongAPI("party")
PopongAPI("person")
SunlightAPI("legislators")
GoogleAPI("elections")
