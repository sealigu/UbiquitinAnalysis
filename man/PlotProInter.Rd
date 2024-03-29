% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/PlotProInter.R
\name{PlotProInter}
\alias{PlotProInter}
\title{This function is used to plot a graph that shows all the
interacted proteins with the two input proteins. The output is
a graph to show all the interactors and comparing to see whether
they have the same interacting proteins.}
\arguments{
\item{protein1}{A protein Uniprot}

\item{protein2}{A protein Uniprot}
}
\value{
Returns a plot to show all the protein interactors
}
\description{
This function is used to plot a graph that shows all the
interacted proteins with the two input proteins. The output is
a graph to show all the interactors and comparing to see whether
they have the same interacting proteins.
}
\examples{
PlotProteinInteractions("Q9UHB7", "Q9UKV5")

}
