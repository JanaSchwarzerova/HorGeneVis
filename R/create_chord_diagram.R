#' Create a chord diagram with default settings
#'
#' @param subset_new_df Subset of the input data frame for creating the chord diagram.
#' @param transparency Transparency level for the chord diagram (default is 0.5).
#' @export
#' @seealso [create_initial_matrix()] [add_entries_to_matrix()]
#' @examples
#' # Example data
#' cd_hit_file <- HorGeneVis_example_data("HGT_output_CD_hit.txt")
#'
#' initial_matrix <- create_initial_matrix(cd_hit_file)
#' new_df <- add_entries_to_matrix(initial_matrix)
#' create_chord_diagram(new_df[1:15, 16:20])
create_chord_diagram <- function(subset_new_df, transparency = 0.5) {
    # Create chord diagram
    chordDiagram(subset_new_df, transparency = transparency)
}
