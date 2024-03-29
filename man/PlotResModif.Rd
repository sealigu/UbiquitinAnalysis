% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/PlotResModif.R
\name{PlotResModif}
\alias{PlotResModif}
\title{This function is used to plot a graph that shows all the
residue modification positons in the selected protein sequences.
Input two interested proteins, the plot will show the modified positon
for each selected protein and comparing to see whether these two proteins
have the same modified position}
\arguments{
\item{protein1}{A protein Uniprot}

\item{protein2}{A protein Uniprot}
}
\value{
Returns a plot to show all the protein residue positions
}
\description{
This function is used to plot a graph that shows all the
residue modification positons in the selected protein sequences.
Input two interested proteins, the plot will show the modified positon
for each selected protein and comparing to see whether these two proteins
have the same modified position
}
\examples{
PlotResModification("Q9UHB7", "Q9UKV5")

}
