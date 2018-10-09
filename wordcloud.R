## Court data/statistics wordcloud
library("tidyverse")
library("googlesheets")
library("wordcloud")
library("wordcloud2")
library("RColorBrewer")
library("sysfonts")
library("tidytext")
library("showtext")

url <- "https://docs.google.com/spreadsheets/d/1bN3ZZ1hVDD_VDCEtYmMYnIocaWkHn1gOsKs5r5Dt44A/edit#gid=1528966377"
font_add_google(name = "Nobile")
source("../scripts/color_scheme.R")
gs_auth()
responses <- gs_url("https://docs.google.com/spreadsheets/d/1bN3ZZ1hVDD_VDCEtYmMYnIocaWkHn1gOsKs5r5Dt44A/edit#gid=1528966377")

<<<<<<< HEAD
responses <- gs_url(url)

sheet <- gs_read(responses)
email <- sheet$`Email Address`
=======
gsheet <- gs_read(responses)
email <- gsheet$`Email Address`
>>>>>>> master
length(unique(email))

words_untidy <- gsheet[7]
names(words_untidy) <- "text"

words_tidy <- words_untidy %>%
  unnest_tokens(word, text) %>%
  anti_join(get_stopwords())




wc2 <- words_tidy %>%
  count(word) %>%
  arrange(desc(n)) %>%
  wordcloud2(fontFamily = "Nobile",
             color = pro_colors_scheme2,
             backgroundColor = "transparent",
             size = 1)
