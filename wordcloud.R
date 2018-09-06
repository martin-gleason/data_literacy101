## Court data/statistics wordcloud
library("tidyverse")
library("googlesheets")
library("wordcloud")
library("wordcloud2")
library("RColorBrewer")
library("sysfonts")
library("tidytext")
library("showtext")

url <- "https://docs.google.com/spreadsheets/d/1HdAUfbLAusvCUX-hQXUJuckv1-VeUyDn3KqoK2YuK_E/edit#gid=1285998547"
font_add_google(name = "Nobile")
source("../scripts/color_scheme.R")

responses <- gs_url(url)

sheet <- gs_read(responses)
email <- sheet$`Email Address`
length(unique(email))

words_untidy <- sheet[7]
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
