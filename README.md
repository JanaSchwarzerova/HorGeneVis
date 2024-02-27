# HorGeneVis: Horizontal Gene Transfer Visualization

This R toolbox involves the analysis of horizontal gene transfer (HGT) between individual taxonomic categories using genomic data. The analysis is performed using R version 4.1.3.

## Analysis Overview

The analysis involves several steps:

1. **Initialization of Matrix**: The initial matrix is created from a genome list file, with rows and columns corresponding to unique genome IDs.

2. **Processing Phylogenetic Tree**: The phylogenetic tree file is processed to extract new names, which are matched with the column names of the matrix.

3. **Adding Entries to Matrix**: Entries are added to the matrix based on the genome pairs obtained from the initial matrix.

4. **Final Matrix Processing**: The final matrix is processed based on a tree list file to match the column names and fill the matrix.

5. **Heatmap Generation**: Heatmaps are generated from the final matrix to visualize the results.

## Functions

### create_initial_matrix

Function to create an initial matrix from a genome list file.

### process_tree

Function to process a phylogenetic tree file and extract new names.

### add_entries_to_matrix

Function to add entries to the matrix based on the genome pairs.

### process_final_matrix

Function to process the final matrix based on a tree list file.

### generate_heatmap

Function to generate a heatmap from a matrix.

## Example Usage

```r
# Read the HGT genome list
hgtList <- read.delim2('HGT_output_CD_hit_fv.txt', header = FALSE, sep = '')

# Process the HGT genome list to create the initial matrix
initial_matrix <- create_initial_matrix(hgtList)

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
Author
This analysis was conducted by Jana Schwarzerova.

Copy code
This readme file provides an overview of the Horizontal Gene Transfer (HGT) analysis project conducted in R. It outlines the analysis steps, functions used, and example usage.

Analysis Overview
The analysis involves the following steps:

Initialization of Matrix: Creation of an initial matrix from a genome list file.
Processing Phylogenetic Tree: Processing of a phylogenetic tree file to extract new names.
Adding Entries to Matrix: Addition of entries to the matrix based on genome pairs.
Final Matrix Processing: Processing of the final matrix based on a tree list file.
Heatmap Generation: Generation of heatmaps from the final matrix to visualize the results.
Functions
create_initial_matrix: Creates an initial matrix from a genome list file.
process_tree: Processes a phylogenetic tree file and extracts new names.
add_entries_to_matrix: Adds entries to the matrix based on genome pairs.
process_final_matrix: Processes the final matrix based on a tree list file.
generate_heatmap: Generates a heatmap from a matrix.
Example Usage
r
Copy code
# Read the HGT genome list
hgtList <- read.delim2('HGT_output_CD_hit_fv.txt', header = FALSE, sep = '')

# Process the HGT genome list to create the initial matrix
initial_matrix <- create_initial_matrix(hgtList)

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
Author
This analysis was conducted by Jana Schwarzerova.
