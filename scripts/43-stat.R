library(tidyverse)

duckplyr::db_exec("INSTALL read_stat")
duckplyr::db_exec("LOAD read_stat")

tbl <- duckplyr::read_file_duckdb("nhcs2021ed_sas.sas7bdat", "read_stat")

# Alternative:
# tbl <- duckplyr::read_sql_duckdb("FROM read_stat('nhcs2021ed_sas.sas7bdat')")

tbl |>
  names()

# No projection pushdown yet:
tbl |>
  count(AGE, SEX) |>
  explain()

tbl_haven <- haven::read_sas("nhcs2021ed_sas.sas7bdat")

# Not yet loaded:
try(
  waldo::compare(tbl, tbl_haven, ignore_attr = TRUE)
)

tbl_collected <-
  tbl |>
  collect()

waldo::compare(tbl_collected, tbl_haven, ignore_attr = TRUE)
