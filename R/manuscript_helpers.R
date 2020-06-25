#' @title Generate list of authors
#'
#' @description
#' Generate MS Word doc with formatted author list and formatted affiliations
#' from input tsv file
#'
#' Assumptions:
#' - input file contains columns 'Author name' and 'affiliation 1', 'affiliation 2', ...
#' - rows are sorted by desired occurence of authors on manuscript
#' - affiliation indices per author are sorted numerically
#'
#' @param input Input tsv file <filename.tsv>
#' @param output Output docx file. If not specified, <filename.docx> is used.
#'
#' @export
render_list_of_authors <- function(input, output = NULL) {

  # if no output file is specified, use same file name as input
  output <- ifelse(is.null(output),
                   stringr::str_replace(input, "\\.tsv$", "\\.docx"),
                   output)

  rmarkdown::render(input = system.file("rmd", "manuscript_list_of_authors.Rmd",
                                        package = "fdhelpers"),
                    params = list(input = input),
                    output_file = output)
}
