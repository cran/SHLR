\name{read.shapeit.haps}
\alias{read.shapeit.haps}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
Helper function to read phased haplotypes produces by SHAPEIT
}
\description{
This function reads phased haplotypes produces by SHAPEIT and 
convert them into a data structure required by run.SHLR.scan()
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
read.shapeit.haps(infile)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{infile}{
%%     ~~Describe \code{X_pca} here~~
	The phased haplotype file produces by SHAPEIT
}
}

\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
\item{haps}{Haplotype array consists of one haplotype per row.}
\item{marker.map}{Marker map contains information about 
				marker name in the 1st column and 
				marker position in the 2nd column}
%% ...
}

%% ~Make other sections like Warning with \section{Warning }{....} ~
