# Verify the data source: R 4.6.1 and maps 3.4.3. Run: uvr run check-versions.R
cat("R", as.character(getRversion()), "\n")
cat("maps", as.character(packageVersion("maps")), "\n")
cat("databases:", paste(c("world", "world2", "usa", "state", "county",
                          "france", "italy", "nz", "lakes")[
  vapply(c("world", "world2", "usa", "state", "county", "france", "italy", "nz", "lakes"),
         function(db) !inherits(try(maps::map(db, plot = FALSE), silent = TRUE), "try-error"),
         logical(1))], collapse = " "), "\n")
stopifnot(as.character(packageVersion("maps")) == "3.4.3")
