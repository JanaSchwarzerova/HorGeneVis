# Function to add entries to the matrix based on the genome pairs
# Args:
#   df (data.frame): Input dataframe containing genomes as columns.
# Returns:
#   data.frame: DataFrame with pairwise gene sums.
add_entries_to_matrix <- function(df) {
    # Copy input dataframe
    table <- as.data.frame(initial_matrix)
    
    # Get column names as genomes
    genomes <- colnames(table)
    
    # Generate pairs of genomes
    genome_pairs <- combn(genomes, 2)
    
    # Create a new dataframe for storing matrix entries
    new_df <- data.frame(matrix(ncol = length(genomes), nrow = length(genomes)), row.names = genomes)
    colnames(new_df) <- genomes
    
    # Iterate over pairs of genomes to compute gene sum and update new dataframe
    for (index in 1:dim(genome_pairs)[2]) {
        gene_sum <- sum(table[genome_pairs[1, index]] & table[genome_pairs[2, index]])
        
        # Update entries for both pairs of genomes
        new_df[genome_pairs[1, index], genome_pairs[2, index]] <- gene_sum
        new_df[genome_pairs[2, index], genome_pairs[1, index]] <- gene_sum
    }
    
    # Set diagonal elements to zero
    for (i in 1:(ncol(new_df))){
        new_df[i,i] <- 0
    }
    
    return(new_df)
}

# new_df <- add_entries_to_matrix(initial_matrix)
