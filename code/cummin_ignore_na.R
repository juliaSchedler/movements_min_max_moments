## chatgpt helped with this function
## description: a modification of cummin function that ignores NAs

cummin_ignore_na <- function(x, start_condition) {
  out <- rep(NA_real_, length(x))
  current_min <- NA_real_
  for (i in seq_along(x)) {
    if (start_condition[i]) {
      if (!is.na(x[i])) {
        if (is.na(current_min)) {
          current_min <- x[i]
        } else {
          current_min <- min(current_min, x[i], na.rm = TRUE)
        }
      }
      out[i] <- current_min
    } else {
      out[i] <- NA_real_
    }
  }
  out
}
