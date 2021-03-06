\name{convertBinary2HMP}
\alias{convertBinary2HMP}
\title{Convert a HMDP model stored in binary format to a hmp (xml) file.
The function simply parse the binary files and create hmp files using
the \link{hmpMDPWriter}.}
\usage{
  convertBinary2HMP(prefix="",
    binNames=c("stateIdx.bin","stateIdxLbl.bin","actionIdx.bin","actionIdxLbl.bin","actionWeight.bin","actionWeightLbl.bin","transProb.bin"),
    out=paste(prefix,'converted.hmp',sep=""), duration=1)
}
\arguments{
  \item{prefix}{A character string with the prefix which
  will be added to the binary files.}

  \item{binNames}{A character vector of length 7 giving the
  names of the binary files storing the model.}

  \item{out}{The name of the hmp file (e.g. mdp.hmp).}

  \item{duration}{Weight number storing the duration (NULL
  if none).}
}
\value{
  NULL (invisible).
}
\description{
  Convert a HMDP model stored in binary format to a hmp
  (xml) file. The function simply parse the binary files
  and create hmp files using the \link{hmpMDPWriter}.
}
\note{
  Note all indexes are starting from zero (C/C++ style).
}
\examples{
wDir <- getwd()
setwd(system.file("models", package = "MDP"))

## convert the machine example to a hmp file
prefix1<-"machine1_"
convertBinary2HMP(prefix1, duration=NULL)
# have a look at the hmp file
xmlTreeParse("machine1_converted.hmp",useInternalNodes=TRUE)

## convert the machine example hmp file to binary files
prefix2<-"machine_cov_"
convertHMP2Binary("machine1.hmp",prefix2)
stateIdxDf(prefix1)
stateIdxDf(prefix2)

## convert the machine example with a single dummy node to a hmp file
#convertBinary2HMP("machine2_")  # error since using scope = 3 not supported in hmp files
}
\author{
  Lars Relund \email{lars@relund.dk}
}
\seealso{
  convertHMP2Binary.
}

