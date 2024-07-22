# Function to create a chord diagram with default settings
# Args:
#   subset_new_df (data.frame): Subset of the input dataframe for creating the chord diagram.
#   transparency (numeric): Transparency level for the chord diagram (default is 0.5).
# Returns:
#   NULL
create_chord_diagram <- function(subset_new_df, transparency = 0.5) {
    # Create chord diagram
    chordDiagram(subset_new_df, transparency = transparency)
}

# Example usage:
# Assuming 'new_df' is defined with appropriate data, provide the subset
# create_chord_diagram(new_df[1:15, 16:20])
#

