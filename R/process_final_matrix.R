#' Process the final matrix based on a tree list file
#'
#' @param tree_file Path to the tree list file.
#' @param mFin_ff Input matrix to process.
#' @returns Processed final matrix.
#' @export
#' @seealso [create_initial_matrix()] [add_entries_to_matrix()]
#' @examples
#' # Example data
#' cd_hit_file <- HorGeneVis_example_data("HGT_output_CD_hit.txt")
#' tree_list_file <- HorGeneVis_example_data("Tree_list_Rectangular_output_IToL.txt")
#'
#' initial_matrix <- create_initial_matrix(cd_hit_file)
#' new_df <- add_entries_to_matrix(initial_matrix)
#' final_mFin_ff_p <- process_final_matrix(tree_list_file, new_df)
#' sum(final_mFin_ff_p)
process_final_matrix <- function(tree_file, mFin_ff) {
    # Read the tree list file
    NamesInRightOrder <- read.delim2(tree_file, header = FALSE)
    NamesInRightOrder$V1 <- rev(NamesInRightOrder$V1)
    NamesInRightOrder <- as.data.frame(NamesInRightOrder)
    NamesInRightOrder_short <- NamesInRightOrder
    
    # Initialize the final matrix with NA values
    final_mFin_ff <- matrix(NA, nrow = nrow(NamesInRightOrder), ncol = nrow(NamesInRightOrder))
    
    # Extract short names from the first column
    for (i in 1:(nrow(NamesInRightOrder))) {
        a <- NamesInRightOrder[i,]
        h <- unlist(gregexpr("_", a))[1]
        NamesInRightOrder_short[i,] <- substr(a, h + 1, nchar(a))
    }
    
    # Set row and column names of the final matrix
    row.names(final_mFin_ff) <- t(NamesInRightOrder_short)
    colnames(final_mFin_ff) <- t(NamesInRightOrder_short)
    
    # Initialize variables
    r <- integer(0)
    s <- integer(0)
    
    # Iterate over rows and columns of mFin_ff to fill the final matrix
    for (i in 1:(ncol(mFin_ff))) {
        for (j in 1:(nrow(mFin_ff))) {
            r_p <- grep(rownames(mFin_ff)[i], row.names(final_mFin_ff))
            s_p <- grep(colnames(mFin_ff)[j], colnames(final_mFin_ff))
            for (n in 1:length(r_p)) {
                for (m in 1:length(s_p)) {
                    ind_r <- r_p[n]
                    ind_s <- s_p[m]
                    if (!((is.na(ind_r) || (length(ind_r) == 0)))) {
                        if (nchar(as.character(rownames(mFin_ff)[i])) == nchar(rownames(final_mFin_ff)[ind_r])) {
                            r <- r_p[n]
                        }
                    }
                    if (!((is.na(ind_s) || (length(ind_s) == 0)))) {
                        if (nchar(as.character(colnames(mFin_ff)[j])) == nchar(rownames(final_mFin_ff)[ind_s])) {
                            s <- s_p[m]
                        }
                    }
                }
            }
            # Fill the final matrix with values from mFin_ff
            final_mFin_ff[r,s] <- mFin_ff[i,j]       
        }
    }
    
    # Replace NA values with 0
    final_mFin_ff_p <- final_mFin_ff
    final_mFin_ff_p[is.na(final_mFin_ff_p)] <- 0
    
    return(final_mFin_ff_p)
}
