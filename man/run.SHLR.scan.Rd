\name{run.SHLR.scan}
\alias{run.SHLR.scan}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
SHLR scan
}
\description{
This is a wrapper function that performs SHLR or SHLR-fam statistic to a genomic region
 one marker at a time. The scan results will be outputted to a file.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
run.SHLR.scan(haps, phen, marker.map, outfile, outcome, 
out.dist = "Gaussian", cov = "", missing.id.code = "0", 
method, nSplits = 1, pca.thres = NULL, hap.freq.thres = 0.005, 
window.size = 100, threads = NULL, corstr = "kinship", 
std.err = "naive", gender = "", fid = "", iid = "", pid = "", 
mid = "")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{haps}{
	Haplotypes array stored as a string of character per row.
	Every two rows contains the haplotypes for each individual. (Required)
%%     ~~Describe \code{haps} here~~
}
  \item{phen}{
	Phenotype table. The phenotype table contains information about trait of interest
	and other covariates. (Required)
%%     ~~Describe \code{phen} here~~
}
  \item{marker.map}{
	The marker map contains information about marker name (1st column) 
	and marker position (2nd column). (Required)
%%     ~~Describe \code{marker.map} here~~
}
  \item{outfile}{
	The desired name of the output file. (Required)
%%     ~~Describe \code{outfile} here~~
}

  \item{outcome}{
	The column name for the phenotype of interest in the phenotype table. (Required)
%%     ~~Describe \code{outcome} here~~
}
  \item{out.dist}{
	The assumed outcome distribution of the model. e.g. : gaussian, binomial, etc. 
	(Required)
%%     ~~Describe \code{out.dist} here~~
}
  \item{cov}{
	The column names for the covariates in the phenotype table.
%%     ~~Describe \code{cov} here~~
}
  \item{missing.id.code}{
	The code for missing id in the pedigree structure. Usually, it is coded as '0'. 
	(Required only if method is 'SHLR-fam' and corstr is 'kinship')
%%     ~~Describe \code{missing.code} here~~
}
  \item{method}{
	The choice for the SHLR method (i.e. : SHLR or SHLR-fam). (Required)
%%     ~~Describe \code{method} here~~
}
  \item{nSplits}{
	The number of splits. This option will determine how often the program prints out results
	to the output file. 
%%     ~~Describe \code{nSplits} here~~
}
  \item{pca.thres}{
	The proportion of variation retained in the design matrix of the model based on PCA.
%%     ~~Describe \code{pca.thres} here~~
}
  \item{hap.freq.thres}{
	The minimum haplotype frequency proportion threshold. Haplotypes that meet this
	threshold will be considered in the model.
%%     ~~Describe \code{hap.freq.thres} here~~
}
  \item{window.size}{
	The number of markers that form the haplotype.
%%     ~~Describe \code{window.size} here~~
}
  \item{threads}{
	The number of CPUs for parallel computation. 
%%     ~~Describe \code{threads} here~~
}
  \item{corstr}{
	The type of correlation structure. The options are: 'kinship', 'exchangeable', or 'independence'. (SHLR-fam parameter)
%%     ~~Describe \code{corstr} here~~
}
  \item{std.err}{
	The method for estimating variance for SHLR-fam. The options are: 'naive' or 'sandwich'. (SHLR-fam parameter)
%%     ~~Describe \code{std.err} here~~
}
  \item{gender}{
	The column name that indicates gender in the phenotype table. (Required if method is SHLR-fam and cor.str is 'kinship')
%%     ~~Describe \code{gender} here~~
}
  \item{fid}{
	The column name that indicates family id in the phenotype table. (Required if method is SHLR-fam and cor.str is 'kinship')
%%     ~~Describe \code{fid} here~~
}
  \item{iid}{
	The column name that indicates individual id in the phenotype table. (Required if method is SHLR-fam and cor.str is 'kinship')
%%     ~~Describe \code{iid} here~~
}
  \item{pid}{
	The column name that indicates father id in the phenotype table. (Required if method is SHLR-fam and cor.str is 'kinship')
%%     ~~Describe \code{pid} here~~
}
  \item{mid}{
	The column name that indicates mother id in the phenotype table. (Required if method is SHLR-fam and cor.str is 'kinship')
%%     ~~Describe \code{mid} here~~
}
}

\examples{
library(SHLR)

####reading in pedigree data
fam <- read.table(system.file("extdata","plink.fam",package="SHLR"), 
    header=FALSE, stringsAsFactors=FALSE)
colnames(fam) <- c("fam_id","id","dad_id","mom_id","sex","qtrait")

####add simulated covariates to create phenotype table
N <- dim(fam)[1]
cov1 <- rnorm(N, 0, 2)
cov2 <- rbinom(N, 1, 0.7)
phen <- data.frame(fam, cov1=cov1, cov2=cov2)

##Read phased haplotype
shapeit <- read.shapeit.haps(system.file("extdata","phased.haps",package="SHLR"))
haps <- shapeit$haps
marker.map <- shapeit$marker.map

##Initialize parameters for SHLR.scan
outfile <- "out.txt"
outcome <- "qtrait"
cov <- c("sex","cov1","cov2")
famid <- "fam_id"
iid <- "id"
pid <- "dad_id"
mid <- "mom_id"
gender <- "sex"
missid <- "0"
corstr <- "kinship"
out_dist <- "gaussian"
std.err <- "naive"
method <- "SHLR-fam"
window.size <- 35
pca.thres <- 0.8
nSplits <- 1

run.SHLR.scan(haps, phen, marker.map, outfile,
        outcome, out.dist=out_dist, cov=cov, missing.id.code=missid,
        method=method, nSplits=nSplits, pca.thres=pca.thres, hap.freq.thres=0.001,
        window.size=window.size, threads=2, corstr=corstr,
        std.err=std.err, gender=gender, fid=famid, iid=iid, pid=pid, mid=mid)
}
