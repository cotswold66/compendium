# This function showcases how one might write a function to be used as an
# RStudio project template. This function will be called when the user invokes
# the New Project wizard using the project template defined in the template file
# at:
#
#   inst/rstudio/templates/project/compendium.dcf
#
# The function itself just echos its inputs and outputs to a file called INDEX,
# which is then opened by RStudio when the new project is opened.
compendium <- function(path, ...) {

  # ensure path exists
  dir.create(path, recursive = TRUE, showWarnings = FALSE)

  # create new package
  usethis::create_project(
    path = path,
    # fields = getOption("usethis.description"),
    rstudio = rstudioapi::isAvailable(),
#    open = interactive()
  )

  setwd(path)

  ## Create directories
  dirs <- list("analysis", "data", "data-raw", "doc", "fig", "output")
  purrr::map(dirs, ~usethis::use_directory(.x))

  ## Copy files
  pkg <- "compendium"
  files <- list(
    c("styles.css", "analysis/"),
    c("_output.yml", "analysis/"),
    c("Makefile", "./"),
    c("functions.R", "R/"),
    c("packages.R", "R/")
  )
  invisible(
    purrr::map(1:length(files), ~file.copy(
      from = system.file(paste0("resources/", files[[.x]][1]),
                         package = pkg,
                         mustWork = TRUE),
      to = files[[.x]][2],
      recursive = TRUE
    ))
  )

}
