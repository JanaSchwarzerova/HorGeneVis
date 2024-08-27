#' Get path to HorGeneVis example data
#'
#' HorGeneVis comes bundled with some example files in its `inst/extdata`
#' directory. This function make them easy to access.
#'
#' @param path Name of file. If `NULL`, the example files will be listed.
#' @export
#' @examples
#' HorGeneVis_example_data()
#' cd_hit_file <- HorGeneVis_example_data("HGT_output_CD_hit.txt")
#' tree_file <- HorGeneVis_example_data("PhylogeneticTree_newick.txt")
#' tree_list_file <- HorGeneVis_example_data("Tree_list_Rectangular_output_IToL.txt")
HorGeneVis_example_data <- function(path = NULL) {
    if (is.null(path)) {
        dir(system.file("extdata", package = "HorGeneVis"))
    } else {
        system.file("extdata", path, package = "HorGeneVis", mustWork = TRUE)
    }
}