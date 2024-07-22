# Function to create an initial matrix from a genome list file
# Args:
#   file_path (str): Path to the genome list file.
# Returns:
#   matrix: Initial matrix with rows and columns corresponding to unique genome IDs.


create_initial_matrix <- function(hgtList) {
    # Convert columns to factors
    hgtList$V1 <- as.factor(hgtList$V1)
    hgtList$V2 <- as.factor(hgtList$V2)
    
    # Get levels of factors
    r_lvl <- levels(hgtList$V2)
    c_lvl <- levels(hgtList$V1)
    
    # Create an initial matrix with all zeros
    mFin <- matrix(0, nrow = length(r_lvl), ncol = length(c_lvl))
    row.names(mFin) <- r_lvl
    colnames(mFin) <- c_lvl
    
    # Initialize variables
    s <- integer(0)
    r <- integer(0)
    s_p <- integer(0)
    r_p <- integer(0)
    
    # Iterate over rows of hgtList
    for(x in 1:nrow(hgtList)) {
        s_p <- grep(hgtList$V1[x], colnames(mFin))
        r_p <- grep(hgtList$V2[x], rownames(mFin))
        
        # Find matching columns and rows
        for (i in 1:length(s_p)){
            if (nchar(as.character(hgtList$V1[x])) == nchar(colnames(mFin)[s_p[i]])) {
                s <- s_p[i]
            }
        }
        for (j in 1:length(r_p)){
            if (nchar(as.character(hgtList$V2[x])) == nchar(rownames(mFin)[r_p[j]])) {
                r <- r_p[j]
            }
        }
        
        # Update matrix if both row and column are found
        if (!((identical(s,integer(0))) || (identical(r,integer(0))))) {
            mFin[r,s] <- 1
        }
        
        # Reset variables
        s <- integer(0)
        r <- integer(0)
        s_p <- integer(0)
        r_p <- integer(0)
    }
    
    # Transpose the matrix
    mFin_T <- t(mFin)
    
    return(mFin_T)
}

# # Read the HGT genome list
# hgtList <- read.delim2('HGT_output_CD_hit_fv.txt', header = FALSE, sep = '')
#
# # Process the HGT genome list to create the initial matrix
# initial_matrix <- create_initial_matrix(hgtList)
