
## used chat gpt for help with this function
add_na_every_k<- function(vec, k) {
  split_list <- split(vec, ceiling(seq_along(vec) / k))
  result <- unlist(lapply(split_list, function(group) c(group, NA)))
  return(result)
}