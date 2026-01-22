get_fred_series <- function(series_id, start_date = as.Date("2000-01-01")) {
  fredr::fredr(
    series_id = series_id,
    observation_start = start_date
  ) %>%
    select(date, value) %>%
    rename(!!series_id := value)
}

read_zillow <- function(path, region_col = "RegionName") {
  read_csv(path) %>%
    pivot_longer(
      cols = -all_of(region_col),
      names_to = "date",
      values_to = "price"
    ) %>%
    mutate(
      date = ym(date),
      region = .data[[region_col]]
    ) %>%
    select(region, date, price)
}
