\name{add_entries_to_matrix}
\alias{add_entries_to_matrix}
\title{
Add entries to the matrix based on the genome pairs
}
\description{
Add entries to the matrix based on the genome pairs.
}
\usage{
add_entries_to_matrix(df)
}
\arguments{
  \item{df}{
Input data frame containing genomes as columns.
}
}
\value{
Returns data frame with pairwise gene sums.
}
\author{
Jana Schwarzerova
}
\seealso{
\code{\link{create_initial_matrix}}
}
\examples{
initial_matrix <- create_initial_matrix('HGT_output_CD_hit.txt')
new_df <- add_entries_to_matrix(initial_matrix)
}
