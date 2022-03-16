library(tidyverse)

df_imported <-
  list.files(path = "./data/",
             pattern = "*.csv",
             full.names = T) %>% 
  map_df(~read_csv(.))

#### To Filter No. of Units > 1

df <- df_imported %>%
  filter(`Number of Units` == 1)

#### Convert Sale date to POSIXlt format
df$`Sale Date` <- strptime(df$`Sale Date`, 
                           format = "%d %b %Y")

#### Extract Tenure Information

df <- df %>%
  mutate("Tenure Duration" = str_split(df$Tenure, " ", simplify = TRUE)[,1],
         "Tenure Date" = str_split(df$Tenure, " ", simplify = TRUE)[,4] %>%
           strptime(format = "%d/%m/%Y"))
