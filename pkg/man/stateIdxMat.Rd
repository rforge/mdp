\name{stateIdxMat}
\alias{stateIdxMat}
\title{Info about the states in the HMDP model under consideration.}
\usage{
  stateIdxMat(prefix = "", file = "stateIdx.bin")
}
\arguments{
  \item{prefix}{A character string with the prefix added to
  til file(s).}

  \item{file}{The HMDP binary file containing the
  description under consideration.}
}
\value{
  A matrix with columns (sId, n0, s0, a0, ...) where sId is
  the state row id, n0 the index of the stage at level 0,
  s0 the index of the state and a0 the index of the action.
  If the HMDP has more than one level columns index (d1,
  s1, a1, ...) are added.
}
\description{
  Info about the states in the HMDP model under
  consideration.
}
\examples{
wDir<-getwd()
setwd(system.file("models", package = "MDP"))

prefix<-"machine1_"
stateIdxMat(prefix)
stateIdxDf(prefix)
actionIdxMat(prefix)
actionIdxDf(prefix)
actionWeightMat(prefix)
weightNames(prefix)
transProbMat(prefix)
a<-actionInfo(prefix)
a[order(a$sId),]

setwd(wDir)
}
\author{
  Lars Relund \email{lars@relund.dk}
}

