#!/usr/bin/R

library("rBSEM")

args = commandArgs(trailingOnly = TRUE)

if (length(args) != 9) {
    stop("Incorrect number of arguments", call. = TRUE)
}

inFile           <- args[1]
blockList        <- list(c(9:28), c(1:5), c(6:8))
varType          <- NULL
SEMGraph         <- matrix(c(0, 1, 1, 0, 0, 1, 0, 0, 0), byrow = TRUE, ncol = 3, nrow = 3)
outFilePath      <- args[2]
autoAddIntercept <- as.logical(args[3])
gammaInit        <- args[4]
nIter            <- as.numeric(args[5])
burnin           <- as.numeric(args[6])
nChains          <- as.numeric(args[7])
seed             <- as.numeric(args[8])
method           <- as.numeric(args[9])
writeOutputLevel <- 1

rBSEM::rHESS_SEM(inFile = inFile, blockList = blockList, varType = varType, SEMGraph = SEMGraph, outFilePath = outFilePath, autoAddIntercept = autoAddIntercept, 
                 gammaInit = gammaInit, nIter = nIter, burnin = burnin, nChains = nChains, seed = seed, method = method, writeOutputLevel = writeOutputLevel)
