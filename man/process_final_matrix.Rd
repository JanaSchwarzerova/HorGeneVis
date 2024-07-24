\name{process_final_matrix}
\alias{process_final_matrix}
\title{
Process the final matrix based on a tree list file
}
\description{
Process the final matrix based on a tree list file.
}
\usage{
process_final_matrix(tree_file, mFin_ff)
}
\arguments{
  \item{tree_file}{
Path to the tree list file.
}
  \item{mFin_ff}{
Input matrix to process.
}
}
\value{
Returns processed final matrix.
}
\author{
Jana Schwarzerova
}
\seealso{
\code{\link{create_initial_matrix}}, \code{\link{add_entries_to_matrix}}
}
\examples{
initial_matrix <- create_initial_matrix('HGT_output_CD_hit.txt')
new_df <- add_entries_to_matrix(initial_matrix)
final_mFin_ff_p <- process_final_matrix('Tree_list_Rectangular_output_IToL.txt', new_df)
sum(final_mFin_ff_p)
}
