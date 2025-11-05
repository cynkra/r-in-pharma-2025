tbl <- duckplyr::duckdb_tibble(
  a = 1:10,
  b = rep(letters[1:2], each = 5),
)

# dplyr code
tbl |>
  dplyr::count()

# Logical plan
tbl |>
  dplyr::count() |>
  dplyr::explain()

# Underlying query
tbl |>
  dplyr::count() |>
  duckdb:::rel_from_altrep_df()
