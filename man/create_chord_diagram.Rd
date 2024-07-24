\name{create_chord_diagram}
\alias{create_chord_diagram}
\title{
Create a chord diagram with default settings
}
\description{
Create a chord diagram with default settings.
}
\usage{
create_chord_diagram(subset_new_df, transparency = 0.5)
}
\arguments{
  \item{subset_new_df}{
Subset of the input data frame for creating the chord diagram.
}
  \item{transparency}{
Transparency level for the chord diagram (default is 0.5).
}
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
create_chord_diagram(new_df[1:15, 16:20])
}
