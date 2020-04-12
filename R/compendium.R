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
  usethis::create_package(
    path = path,
    # fields = getOption("usethis.description"),
    rstudio = rstudioapi::isAvailable(),
    open = interactive()
  )

  setwd(path)

  dirs <- list("analysis", "data", "data-raw", "doc", "fig", "output")
  purrr::map(dirs, ~usethis::use_directory(.x))

  invisible(file.copy(from = system.file("resources/styles.css",
                                         package = "compendium",
                                         mustWork = TRUE),
                      to = "analysis/",
                      recursive = TRUE))
  invisible(file.copy(from = system.file("resources/_output.yml",
                                         package = "compendium",
                                         mustWork = TRUE),
                      to = "analysis/",
                      recursive = TRUE))
  invisible(file.copy(from = system.file("resources/Makefile",
                                         package = "compendium",
                                         mustWork = TRUE),
                      to = "./",
                      recursive = TRUE))

}
