# Function to generate a heatmap from a matrix
# Args:
#   final_mFin_ff_p (matrix): Input matrix for generating the heatmap.
#   palette (character): Name of the color palette to use (default is "Blues").
#   n_colors (numeric): Number of colors in the palette (default is 25).
# Returns:
#   NULL
generate_heatmap <- function(final_mFin_ff_p, palette = "Blues", n_colors = 25) {
    # Replace NA values with 0
    final_mFin_ff_p <- as.matrix(final_mFin_ff_p)
    final_mFin_ff_p[is.na(final_mFin_ff_p)] <- 0
    
    # Generate heatmap with specified color palette
    heatmap(log(final_mFin_ff_p), 
            Colv = NA, 
            Rowv = NA, 
            col = colorRampPalette(brewer.pal(n_colors, palette))(n_colors), 
            scale = "none")
}

# Example usage:
# generate heatmap using the default "Blues" palette and 25 colors
generate_heatmap(final_mFin_ff_p)

# generate heatmap using the "Greens" palette and 25 colors
generate_heatmap(new_df, palette = "Greens")

# generate heatmap using the "BrBG" palette and 25 colors
generate_heatmap(new_df, palette = "BrBG")

# generate heatmap using the "Accent" palette and 25 colors
generate_heatmap(new_df, palette = "Accent")
