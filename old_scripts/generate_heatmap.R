# Function to generate a heatmap from a matrix
# Args:
#   final_mFin_ff_p (matrix): Input matrix for generating the heatmap.
#   palette (character): Name of the color palette to use (default is "Blues").
#   n_colors (numeric): Number of colors in the palette (default is 25).
# Returns:
#   NULL

generate_heatmap_with_legend <- function(final_mFin_ff_p, palette = "BrBG") {
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
            col = colorRampPalette(brewer.pal(25, palette))(25), 
            scale = "none")
    
    # Add color scale legend
    legend("right", 
           legend = seq(min(final_mFin_ff_p), max(final_mFin_ff_p), length.out = 5), 
           fill = colorRampPalette(brewer.pal(25, palette))(5),
           title = "Scale",
           cex = 0.8,
           box.lty = 0)
    
    dev.off()  # Close the graphics device
}

# Example usage:
# generate_heatmap_with_legend(new_df, palette = "Greys")






