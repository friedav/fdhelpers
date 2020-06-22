

#' Setup internals of data science project
#'
#' This function is meant to run within a new R project directory to
#' 1. Consistently set up the directory structure
#' 2. Initialize new project-local environment with renv
#'
#' @export
setup_project <- function() {
  dir.create(here::here("bin"), showWarnings = T)
  dir.create(here::here("data"), showWarnings = T)
  dir.create(here::here("output"), showWarnings = T)
  dir.create(here::here("reports"), showWarnings = T)

  if (!("renv" %in% list.files())) {
    renv::init()
  } else {
    source("renv/activate.R")
  }
}
