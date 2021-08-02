#!/usr/bin/R

library("rBSEM")

args = commandArgs(trailingOnly = TRUE)

if (length(args) != 12) {
    stop("Incorrect number of arguments", call. = TRUE)
}

inFile           <- args[1]
outFilePath      <- args[2]
blockList        <- base::eval(parse(text=args[3]))
varType          <- base::eval(parse(text=args[4]))
SEMGraph         <- base::eval(parse(text=args[5]))
autoAddIntercept <- as.logical(args[6])
gammaInit        <- args[7]
nIter            <- as.numeric(args[8])
burnin           <- as.numeric(args[9])
nChains          <- as.numeric(args[10])
seed             <- as.numeric(args[11])
method           <- as.numeric(args[12])
writeOutputLevel <- 1

rBSEM::rHESS_SEM(inFile = inFile, outFilePath = outFilePath, blockList = blockList, varType = varType, SEMGraph = SEMGraph, autoAddIntercept = autoAddIntercept,
                 gammaInit = gammaInit, nIter = nIter, burnin = burnin, nChains = nChains, seed = seed, method = method, writeOutputLevel = writeOutputLevel)
