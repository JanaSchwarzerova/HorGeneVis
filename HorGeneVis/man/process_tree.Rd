\name{process_tree}
\alias{process_tree}
\title{
Process a phylogenetic tree file and extract new names
}
\description{
Process a phylogenetic tree file and extract new names.
}
\usage{
process_tree(tree_file, mFin_T)
}
\arguments{
  \item{tree_file}{
Path to the phylogenetic tree file.
}
  \item{mFin_T}{
Matrix where the column names are to be matched. The output from \code{\link{create_initial_matrix}} function.
}
}
\value{
Returns vector of new names extracted from the tree file.
}
\author{
Jana Schwarzerova
}
\seealso{
\code{\link{create_initial_matrix}}
}
\examples{
initial_matrix <- create_initial_matrix('HGT_output_CD_hit.txt')
new_names <- process_tree('PhylogeneticTree_newick.txt', initial_matrix)
}