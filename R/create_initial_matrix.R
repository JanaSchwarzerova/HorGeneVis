#' Create an initial matrix from a genome list file
#'
#' @param file_path Path to the genome list file.
#' @return Returns initial matrix with rows and columns corresponding to unique genome IDs.
#' @export
#' @examples
#' # Example data
#' cd_hit_file <- HorGeneVis_example_data("HGT_output_CD_hit.txt")
#'
#' initial_matrix <- create_initial_matrix(cd_hit_file)
create_initial_matrix <- function(file_path) {
    # Read the HGT genome list
    hgtList <- read.delim2(file_path, header = FALSE, sep = '')

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
