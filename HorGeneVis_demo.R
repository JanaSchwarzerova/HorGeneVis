# Process the HGT genome list to create the initial matrix
initial_matrix <- create_initial_matrix('HGT_output_CD_hit.txt')

# Call the function to process the tree file and extract new names
new_names <- process_tree('PhylogeneticTree_newick.txt', initial_matrix)

# Add entries to the matrix based on the genome pairs
new_df <- add_entries_to_matrix(initial_matrix)

# Final processing of matrix as core for heat map visualization
final_mFin_ff_p <- process_final_matrix('Tree_list_Rectangular_output_IToL.txt', new_df)

# Example usage:
# Generate heatmap using the default "Blues" palette and 25 colors
generate_heatmap(final_mFin_ff_p)

# Generate heatmap using the "Greens" palette and 25 colors
generate_heatmap(final_mFin_ff_p, palette = "Greens")

# Generate heatmap using the "BrBG" palette and 25 colors
generate_heatmap(final_mFin_ff_p, palette = "BrBG")

# Generate heatmap using the "Accent" palette and 25 colors
generate_heatmap(final_mFin_ff_p, palette = "Accent")

# Generate chord diagram
create_chord_diagram(new_df[1:15, 16:20])
