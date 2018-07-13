## Court data/statistics wordcloud
library("tidyverse")
library("googlesheets")
library("wordcloud")
library("wordcloud2")
library("RColorBrewer")
library("tidytext")
library("showtext")
font_add_google(name = "Nobile")
source("../scripts/color_scheme.R")

responses <- gs_url("https://docs.google.com/spreadsheets/d/1oqOAeku8K8JGb31U8HGHu6PsAaxGWdtFxZFLUKtDlpE/edit#gid=1115118292")

sheet <- gs_read(responses)
email <- sheet$`Email Address`

words_untidy <- sheet[7]
names(words_untidy) <- "text"

words_tidy <- words_untidy %>%
  unnest_tokens(word, text) %>%
  anti_join(get_stopwords())

question_cloud <- words_tidy %>%
  count(word) %>%
  with(wordcloud(word, n, min.freq = 1,
                 max.words = 25, colors = pro_colors_scheme,
                 family = "Nobile",
                 scale = c(3, 3)))

# wc2 <- words_tidy %>%
#   count(word) %>%
#   wordcloud2(fontFamily = "Nobile", color = pro_colors_scheme2, size = 1)
