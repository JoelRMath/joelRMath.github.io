bib_lines <- readLines("references.bib")
qmd_content <- paste(readLines("index.qmd"), collapse = " ")

bib_keys <- gsub("^@.*\\{(.*),.*", "\\1", grep("^@", bib_lines, value = TRUE))

missing_keys <- bib_keys[!sapply(bib_keys, function(k) grepl(k, qmd_content))]

if(length(missing_keys) > 0) {
  cat("The following bibliography keys are not yet cited on your home page:\n")
  print(missing_keys)
} else {
  cat("All publications from your .bib file are cited on the home page! ✓\n")
}