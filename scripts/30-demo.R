# Restart R session if needed
stopifnot(!("duckplyr" %in% loadedNamespaces()))
library(tidyverse)

G <- 200
N <- 5000

data <-
  crossing(g1 = 1:G, g2 = 1:G, id = 1:N) |>
  mutate(x = rnorm(n()))

data |>
  summarize(.by = c(g1, g2), m = mean(x)) |>
  system.time()
