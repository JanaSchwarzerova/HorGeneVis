# Function to process a phylogenetic tree file and extract new names
# Args:
#   tree_file (str): Path to the phylogenetic tree file.
#   mFin_T (matrix): Matrix where the column names are to be matched.
# Returns:
#   character: Vector of new names extracted from the tree file.

process_tree <- function(tree_file, mFin_T) {
    # Read the phylogenetic tree file
    myTree <- ape::read.tree(tree_file)
    
    # Extract tip labels from the tree
    bac <- myTree[["tip.label"]]
    
    # Function to extract characters from the right of a string
    substrRight <- function(x, n) {
        substr(x, nchar(x) - n + 1, nchar(x))
    }
    
    # Initialize vector to store new names
    c <- c()
    
    # Iterate over tip labels
    for (x in 1:length(bac)) {
        b <- bac[x]
        
        # Find the index of the second underscore
        i <- unlist(gregexpr("_", b))[2]
        
        # Extract characters after the second underscore
        vz <- substr(b, i + 1, nchar(b))
        
        # Find matching column names in the matrix
        ss <- grep(vz, colnames(mFin_T))[1]
        
        # If no match is found or lengths of names are different, add to the new names vector
        if (is.na(ss)) {
            c <- c(c, vz)
        } else {
            if (nchar(colnames(mFin_T)[ss]) != nchar(vz)) {
                c <- c(c, vz)
            }
        }
    }
    
    # Return the vector of new names
    return(c)
}

# Call the function to process the tree file and extract new names
new_names <- process_tree('PhylogeneticTree_newick.txt', initial_matrix)
