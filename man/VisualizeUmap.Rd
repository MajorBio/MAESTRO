% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/VisualizeUmap.R
\docType{methods}
\name{VisualizeUmap}
\alias{VisualizeUmap}
\title{UMAP plot to show expression level or regulatory potential of genes}
\usage{
VisualizeUmap(
  genes,
  type,
  SeuratObj,
  ncol = NULL,
  width = 6,
  height = 4,
  name = "MultipleUmapPlot"
)
}
\arguments{
\item{genes}{Genes or TFs to plot.}

\item{type}{Type of the dataset. If \code{type} is "RNA", the expression level of genes will be visulized. 
If \code{type} is "ATAC", the regulatory potential will be used.}

\item{SeuratObj}{A Seurat object. If \code{type} is "RNA", \code{SeuratObj} should be the Seurat object generated by \code{\link{RNARunSeurat}} function.
If \code{type} is "ATAC", \code{SeuratObj} should be a Seurat object created using RP matrix achievesd from \code{\link{ATACAnnotateCelltype}} function.}

\item{ncol}{Number of columns by which multiple plots are arranged.}

\item{width}{Width of the plots.}

\item{height}{Height of the plots.}

\item{name}{Output name of the plots. Default is "MultipleUmapPlot".}
}
\description{
Draw a UMAP plot to show the expression level (RNA) or regulatory potential (ATAC) of given genes in different clusters.
}
\examples{
data(pbmc.RNA)
pbmc <- RNARunSeurat(inputMat = pbmc.RNA, project = "PBMC.scRNA.Seurat")
pbmc.tfs <- RNAAnnotateTranscriptionFactor(pbmc$RNA, pbmc$genes, project = "PBMC.scRNA.TF", method = "LISA")

# TFs of interest
tfs = sapply(pbmc.tfs[[1]], function(x){return(unlist(strsplit(x, split = " | ", fixed = TRUE))[1])})
VisualizeUmap(genes = tfs, type = "RNA", SeuratObj = pbmc$RNA, ncol = 5, width = 6, height = 3, name = "PBMC.scRNA.tf")

# Genes of interest
VisualizeUmap(genes = c("MS4A1","FCGR3A","CD3D","GZMB"), type = "RNA", SeuratObj = pbmc$RNA, ncol = 2, width = 7, height =4.5, name = "PBMC.scRNA.genes")


}
\author{
Chenfei Wang, Dongqing Sun
}
