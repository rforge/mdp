library(roxygen)
roxygenize("pkg","pkg",copy.package=FALSE) # unlink.target=TRUE)

# hack to remove the files we don't want to have Rd files for
# since documented elsewhere
unlink(c("pkg/man/actionIdxDf.Rd","pkg/man/actionIdxMat.Rd",
	"pkg/man/actionInfo.Rd","pkg/man/actionWeightMat.Rd",
	"pkg/man/stateIdxDf.Rd","pkg/man/transProbMat.Rd",
	"pkg/man/deleteHMDP.Rd","pkg/man/checkWDurIdx.Rd",
	"pkg/man/checkWIdx.Rd","pkg/man/firstLib.Rd"
	))

#sessionInfo()
#packageDescription("roxygen")
