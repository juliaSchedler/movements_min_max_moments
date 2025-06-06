## chatgpt helped with this function
## description: a modification of cummax function that ignores NAs

cummax_ignore_na <- function(x, start_condition) {
  out <- rep(NA_real_, length(x))
  current_max <- NA_real_
  for (i in seq_along(x)) {
    if (start_condition[i]) {
      if (!is.na(x[i])) {
        if (is.na(current_max)) {
          current_max <- x[i]
        } else {
          current_max <- max(current_max, x[i], na.rm = TRUE)
        }
      }
      out[i] <- current_max
    } else {
      out[i] <- NA_real_
    }
  }
  out
}
