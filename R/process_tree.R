#' Process a phylogenetic tree file and extract new names
#'
#' @param tree_file Path to the phylogenetic tree file.
#' @param mFin_T Matrix where the column names are to be matched. The output from create_initial_matrix() function.
#' @returns Vector of new names extracted from the tree file.
#' @export
#' @seealso [create_initial_matrix()]
#' @examples
#' # Example data
#' cd_hit_file <- HorGeneVis_example_data("HGT_output_CD_hit.txt")
#' tree_file <- HorGeneVis_example_data("PhylogeneticTree_newick.txt")
#'
#' initial_matrix <- create_initial_matrix(cd_hit_file)
#' new_names <- process_tree(tree_file, initial_matrix)
process_tree <- function(tree_file, mFin_T) {
    # Read the phylogenetic tree file
    myTree <- read.tree(tree_file)
    
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
