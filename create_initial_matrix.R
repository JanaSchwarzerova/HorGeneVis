# Function to read the HGT genome list and create an initial matrix
#Path:
setwd('...')


create_initial_matrix <- function(file_path) {
    
    # Read the HGT genome list
    hgtList <- read.delim(file_path, head = FALSE, sep = '')
    
    # Convert columns to factors
    hgtList$V1 <- as.factor(hgtList$V1)
    hgtList$V2 <- as.factor(hgtList$V2)
    
    # Get levels of factors
    r_levels <- levels(hgtList$V2)
    c_levels <- levels(hgtList$V1)
    
    # Create an initial matrix with all zeros
    matrix_final <- matrix(0, nrow = length(r_levels), ncol = length(c_levels))
    
    # Set row names and column names
    row.names(matrix_final) <- r_levels
    colnames(matrix_final) <- c_levels
    
    return(matrix_final)
    
}

initial_matrix <- create_initial_matrix('HGT_output_CD_hit.txt')
