#keep project default working directory
prj.wd <- getwd()


#秤で計ったデータ
set.seed(10)
p.w <- sample(0:10, size=1)
dt.sc <- sample(c(rep(12.025, p.w), rep(12.030, (10-p.w))))


library(dplyr)
library(tidyr)

kawase.file <- paste(prj.wd, "data/quote.csv", sep="/")

kawase <- read.csv(file = kawase.file, header = TRUE, skip = 2, stringsAsFactors = FALSE)

names(kawase)[1] <- "date"
kawase <- kawase %>%
  select(1:2,3,4) %>%
  mutate(date=as.POSIXct(date))

