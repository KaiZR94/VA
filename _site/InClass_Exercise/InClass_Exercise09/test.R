library(tidyverse)

import_df <- 
  list.files(path = "./data/",
             pattern = "*.csv",
             full.names = T) %>%
  map_df(~read_csv(.))
