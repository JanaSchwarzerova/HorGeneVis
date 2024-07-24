#' Generate a heatmap from a matrix
#'
#' @param final_mFin_ff_p Input matrix for generating the heatmap.
#' @param palette Name of the color palette to use (default is "Blues").
#' @param n_colors Number of colors in the palette (default is 25).
#' @examples
#' initial_matrix <- create_initial_matrix('HGT_output_CD_hit.txt')
#' new_df <- add_entries_to_matrix(initial_matrix)
#' final_mFin_ff_p <- process_final_matrix('Tree_list_Rectangular_output_IToL.txt', new_df)
#'
#' # Generate heatmap using the default "Blues" palette and 25 colors
#' generate_heatmap(final_mFin_ff_p)
#'
#' # Generate heatmap using the "Greens" palette and 25 colors
#' generate_heatmap(final_mFin_ff_p, palette = "Greens")
#'
#' # Generate heatmap using the "BrBG" palette and 25 colors
#' generate_heatmap(final_mFin_ff_p, palette = "BrBG")
#'
#' # Generate heatmap using the "Accent" palette and 25 colors
#' generate_heatmap(final_mFin_ff_p, palette = "Accent")
generate_heatmap <- function(final_mFin_ff_p, palette = "BrBG", n_colors = 25) {
    # Replace NA values with 0
    final_mFin_ff_p <- as.matrix(final_mFin_ff_p)
    final_mFin_ff_p[is.na(final_mFin_ff_p)] <- 0
    
    # Specify the graphics device
    if (!is.null(dev.list())) dev.off()  # Close any existing devices
    png(filename="heatmap.png", width=800, height=800)
    
    # Generate heatmap with specified color palette
    heatmap(log(final_mFin_ff_p + 1), 
            Colv = NA, 
            Rowv = NA, 
            col = colorRampPalette(brewer.pal(n_colors, palette))(25),
            scale = "none")
    
    # Add color scale legend
    legend("right", 
           legend = seq(min(final_mFin_ff_p), max(final_mFin_ff_p), length.out = 5), 
           fill = colorRampPalette(brewer.pal(n_colors, palette))(5),
           title = "Scale",
           cex = 0.8,
           box.lty = 0)
    
    dev.off()  # Close the graphics device
}
