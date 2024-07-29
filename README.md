# HorGeneVis: Horizontal Gene Transfer Visualization

This R toolbox involves the analysis of horizontal gene transfer (HGT) between individual taxonomic categories using 
genomic data. The analysis is performed using R version 4.1.3.

## Analysis Overview

The analysis involves several steps:

1. **Initialization of Matrix**: The initial matrix is created from a genome list file, with rows and columns 
   corresponding to unique genome IDs.

2. **Processing Phylogenetic Tree**: The phylogenetic tree file is processed to extract new names, which are matched 
   with the column names of the matrix.

3. **Adding Entries to Matrix**: Entries are added to the matrix based on the genome pairs obtained from the initial 
   matrix.

4. **Final Matrix Processing**: The final matrix is processed based on a tree list file to match the column names and 
   fill the matrix.

5. **Heatmap Generation**: Heatmaps are generated from the final matrix to visualize the results.

## Functions

### `create_initial_matrix()`

Function to create an initial matrix from a genome list file.

### `process_tree()`

Function to process a phylogenetic tree file and extract new names.

### `add_entries_to_matrix()`

Function to add entries to the matrix based on the genome pairs.

### `process_final_matrix()`

Function to process the final matrix based on a tree list file.

### `generate_heatmap()`

Function to generate a heatmap from a matrix.

## Example Usage
HorGeneVis contains example data which were used to demonstrate its function. 
Use `HorGeneVis_example_data()` function to access them.
```r
# Example data
cd_hit_file <- HorGeneVis_example_data("HGT_output_CD_hit.txt")
tree_file <- HorGeneVis_example_data("PhylogeneticTree_newick.txt")
tree_list_file <- HorGeneVis_example_data("Tree_list_Rectangular_output_IToL.txt")
```
Then continue with further analysis.
```r
# Process the HGT genome list to create the initial matrix
initial_matrix <- create_initial_matrix(cd_hit_file)

# Call the function to process the tree file and extract new names
new_names <- process_tree(tree_file, initial_matrix)

# Add entries to the matrix based on the genome pairs
new_df <- add_entries_to_matrix(initial_matrix)

# Final processing of matrix as core for heat map visualization
final_mFin_ff_p <- process_final_matrix(tree_list_file, new_df)

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
```
