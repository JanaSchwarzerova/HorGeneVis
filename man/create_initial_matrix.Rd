\name{create_initial_matrix}
\alias{create_initial_matrix}
\title{
Create an initial matrix from a genome list file
}
\description{
Create an initial matrix from a genome list file.
}
\usage{
create_initial_matrix(file_path)
}
\arguments{
  \item{file_path}{
    Path to the genome list file.
}
}
\value{
Returns initial matrix with rows and columns corresponding to unique genome IDs.
}
\author{
Jana Schwarzerova
}
\examples{
initial_matrix <- create_initial_matrix('HGT_output_CD_hit.txt')
}