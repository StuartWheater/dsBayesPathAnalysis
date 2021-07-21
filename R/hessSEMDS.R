#'
#' @title Concatenates objects into a vector or list
#' @description This function is similar to the R base function 'c'.
#' @details Unlike the R base function 'c' on vector or list of certain 
#' @param resource a resource which is used to access the data set.
#' @param infile is the ...
#' @param nIter is the ...
#' @param nChains is the ...
#' @param seed is the ...
#' @param method is the ...
#' @return a vector or list
#' @author DataSHIELD Development Team
#' @import rBSEM
#' @import readr
#' @export
#'
hessSEMDS <- function (resource, infile, nIter, nChains, seed, method) {
    if (! any(c('ShellResourceClient') %in% class(resource))) {
        stop("Resource need to be a 'ShellResourceClient'", call. = FALSE)
    }

    inFile  <- infile
    tempDir <- paste0(base::tempdir(), '/')

    command.args <- c('-q', '-f', '/opt/hess_sem/HESS_SEM_Wrapper.R', '--args', inFile, tempDir, nIter, nChains, seed, method)

    res <- resource$exec('/usr/bin/R', command.args)

    outs <- resource$exec('/bin/ls', tempDir)$output

    outs <- outs[grep("_out.txt", outs)]

    output <- list()
    for (out in outs) {
       output[[substr(out, 1, nchar(out) - 8)]] <- readr::read_table(paste0(tempDir, '/', out), col_names = FALSE, na = "NA")
    }

    base::unlink(tempDir, recursive = TRUE)
    resource$close()

    return(output)
}
