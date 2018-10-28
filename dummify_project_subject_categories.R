library(dplyr)
library(purrr)

setwd("C:\\DAL Assignment 2")
list.files()
df <- read.csv("Projects with Donations Merged.csv")

unique.subject.category <- 
  unique(df$Project.Subject.Category.Tree) %>%
  as.vector() %>%
  lapply(strsplit,split = ",") %>%
  unlist() %>%
  trimws() %>%
  unique()

for (c in unique.subject.category) {
  df[paste("Is", c)] <- as.integer(grepl(c, df$Project.Subject.Category.Tree, fixed = T))
}

df2 <- df[,c(1:15,27:36,16:26)]

write.csv(df2, "Projects with Dummified Subject Categories.csv", row.names = F)
