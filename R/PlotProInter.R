#################################################################
# This function is used to plot a graph that shows all the
# interacted proteins with the two input proteins. The output is
# a graph to show all the interactors and comparing to see whether
# they have the same interacting proteins.
#
# @examples
# PlotProteinInteractions("Q9UHB7", "Q9UKV5")
#
# @return Returns a plot to show all the protein interactors

citation("UniprotR");
citation("stringi");
citation("scales");
citation("pheatmap");
library(UniprotR);
library(stringr);
library(scales);
library(pheatmap);

PlotProteinInteractions <- function(protein1, protein2) {
  pro1_obj <- as.character(GetProteinInteractions(protein1)$Interacts.with);
  pro2_obj <- as.character(GetProteinInteractions(protein2)$Interacts.with);

  pro1_list <- strsplit(pro1_obj, ";"); #list
  pro2_list <- strsplit(pro2_obj, ";");
  pro1_sp <- unlist(pro1_list); #character
  pro2_sp <- unlist(pro2_list);

  #change "Itself" into its uniprot id
  for(i in 1:length(pro1_sp)){
    if(identical(pro1_sp[i], "Itself")){
      pro1_sp[i] <- as.character(protein1);
    }
  }

  for(j in 1:length(pro2_sp)){
    if(identical(pro2_sp[j], "Itself")){
      pro2_sp[j] <- as.character(protein2);
    }
  }

  pro1_mat <- matrix(1, nrow =  1,
                     ncol = length(pro1_sp),
                     dimnames = list(as.character(protein1), c(pro1_sp)));
  pro2_mat <- matrix(1, nrow = 1,
                     ncol = length(pro2_sp),
                     dimnames = list(as.character(protein2), c(pro2_sp)));

  # https://stackoverflow.com/questions/5738773/r-how-to-merge-two-matrix-according-to-their-column-and-row-names
  # authors: Chase and Joris Meys
  # According to above code to merge two matrix together
  # and convert list to matrix

  df <- merge(pro1_mat, pro2_mat, by = "row.names", all = TRUE);
  df[is.na(df)] <- 0; #replacing NA's with 0
  tab <- as.matrix(df[-1]);
  rownames(tab) <- df[,1];

  col<- colorRampPalette(c("white", "blue"))(256);
  final_tab <- pheatmap(tab, scale = "none", col = col);
  return(final_tab);
}