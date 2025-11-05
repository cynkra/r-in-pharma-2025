tbl <- duckplyr::read_parquet_duckdb(
  "personas.parquet"
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
