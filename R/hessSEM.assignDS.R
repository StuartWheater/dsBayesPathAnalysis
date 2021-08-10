#'
#' @title Concatenates objects into a vector or list
#' @description This function is similar to the R base function 'c'.
#' @details Unlike the R base function 'c' on vector or list of certain 
#' @param resource a resource which is used to access the data set.
#' @param inFile is the ...
#' @param blockList is the name of ...
#' @param varType is the name of...
#' @param SEMGraph is the name of ...
#' @param autoAddIntercept is the ...
#' @param gammaInit is the ...
#' @param nIter is the ...
#' @param burnin is the ...
#' @param nChains is the ...
#' @param seed is the ...
#' @param method is the ...
#' @return a vector or list
#' @author DataSHIELD Development Team
#' @export
#'
hessSEM.assignDS <- function (resource, inFile, blockList, varType, SEMGraph, autoAddIntercept, gammaInit, nIter, burnin, nChains, seed, method) {
    if (! any(c('ShellResourceClient') %in% class(resource))) {
        stop("Resource need to be a 'ShellResourceClient'", call. = FALSE)
    }

    tempDir <- paste0(base::tempdir(), '/')

    blockList.arg <- gsub("\\s", "", base::deparse(blockList, width.cutoff = 500L))
    varType.arg   <- gsub("\\s", "", base::deparse(varType, width.cutoff = 500L))
    SEMGraph.arg  <- gsub("\\s", "", base::deparse(SEMGraph, width.cutoff = 500L))

    command.args <- c('-q', '-f', '/opt/hess_sem/HESS_SEM_Wrapper.R', '--args', inFile, tempDir, blockList.arg, varType.arg, SEMGraph.arg, autoAddIntercept, gammaInit, nIter, burnin, nChains, seed, method)

    res <- resource$exec('/usr/bin/R', command.args)

#    if (exists("error", where = res) && (length(res$error) != 0))
#        stop(res$error[1], call. = FALSE)

    outs <- resource$exec('/bin/ls', tempDir)$output

    outs <- outs[grep("_out.txt", outs)]

    output <- list()
    for (out in outs) {
       output[[substr(out, nchar(inFile) - 2, nchar(out) - 8)]] <- readr::read_table(paste0(tempDir, '/', out), col_names = FALSE, na = "NA")
    }

    base::unlink(tempDir, recursive = TRUE)
    resource$close()

    return(output)
}
