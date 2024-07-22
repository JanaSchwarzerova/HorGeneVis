\name{generate_heatmap}
\alias{generate_heatmap}
\title{
Generate a heatmap from a matrix
}
\description{
Generate a heatmap from a matrix.
}
\usage{
generate_heatmap(final_mFin_ff_p, palette = "BrBG", n_colors = 25)
}
\arguments{
  \item{final_mFin_ff_p}{
Input matrix for generating the heatmap.
}
  \item{palette}{
Name of the color palette to use (default is "Blues").
}
  \item{n_colors}{
Number of colors in the palette (default is 25).
}
}
\author{
Jana Schwarzerova
}
\seealso{
\code{\link{create_initial_matrix}}, \code{\link{add_entries_to_matrix}}, \code{\link{process_final_matrix}}
}
\examples{
initial_matrix <- create_initial_matrix('HGT_output_CD_hit.txt')
new_df <- add_entries_to_matrix(initial_matrix)
final_mFin_ff_p <- process_final_matrix('Tree_list_Rectangular_output_IToL.txt', new_df)

# Generate heatmap using the default "Blues" palette and 25 colors
generate_heatmap(final_mFin_ff_p)

# Generate heatmap using the "Greens" palette and 25 colors
generate_heatmap(final_mFin_ff_p, palette = "Greens")

# Generate heatmap using the "BrBG" palette and 25 colors
generate_heatmap(final_mFin_ff_p, palette = "BrBG")

# Generate heatmap using the "Accent" palette and 25 colors
generate_heatmap(final_mFin_ff_p, palette = "Accent")
}
