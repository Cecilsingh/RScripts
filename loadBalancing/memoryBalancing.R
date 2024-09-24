#!/usr/bin/Rscript

get_nodes <- function(nodes = Sys.getenv("RSTUDIO_NODES")) {
  unlist(strsplit(nodes, ",", fixed = TRUE))
}

get_health_check <- function(node_address) {
  con <- url(sprintf("http://%s/health-check", node_address))
  on.exit(close(con))
  readLines(con)
}

parse_health_check <- function(health_check) {
  fields <- unlist(strsplit(health_check, "\n|,"))

  keys <- sub(
    ":",
    "",
    regmatches(fields, regexpr("^[a-z\\-]+:", fields))
  )

  values <- sub(
    ": ",
    "",
    regmatches(fields, regexpr(":.+$", fields))
  )
  data.frame(keys, values, stringsAsFactors = FALSE)
}

get_value <- function(hc_table, hc_value) {
  as.double(hc_table[hc_table[["keys"]] == hc_value, "values"])
}

main <- function() {
  nodes <- get_nodes()
  named_hc <- setNames(lapply(nodes, get_health_check), nodes)
  parsed_hc <- lapply(named_hc, parse_health_check)
  mem_percent <- lapply(parsed_hc, get_value, "memory-percent")
  least_mem <- names(which.min(unlist(mem_percent)))

  least_mem
}

cat(main())
