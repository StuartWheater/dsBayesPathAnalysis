
#!/usr/bin/R

library("rBSEM")

args = commandArgs(trailingOnly = TRUE)

if (length(args) != 12) {
    stop("Incorrect number of arguments", call. = TRUE)
}

blockList.expr <- "NULL"
if (args[3] != "NULL") {
    blockList.expr <- rawToChar(as.raw(strtoi(unlist(strsplit(gsub("(..)", "\\1 ", args[3]), " ")), base = 16L)))
}

varType.expr <- "NULL"
if (args[4] != "NULL") {
    varType.expr <- rawToChar(as.raw(strtoi(unlist(strsplit(gsub("(..)", "\\1 ", args[4]), " ")), base = 16L)))
}

SEMGraph.expr <- "NULL"
if (args[5] != "NULL") {
    SEMGraph.expr <- rawToChar(as.raw(strtoi(unlist(strsplit(gsub("(..)", "\\1 ", args[5]), " ")), base = 16L)))
}

inFile           <- args[1]
outFilePath      <- args[2]
blockList        <- base::eval(parse(text=blockList.expr))
varType          <- base::eval(parse(text=varType.expr))
SEMGraph         <- base::eval(parse(text=SEMGraph.expr))
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
