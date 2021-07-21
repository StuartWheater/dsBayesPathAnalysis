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
#' @export
#'
hessSEMDS <- function (resource, infile, nIter, nChains, seed, method) {

    if (! any(c('ShellResourceClient') %in% class(resource))) {
        stop("Resource need to be a 'ShellResourceClient'", call. = FALSE)
    }

    inFile  <- infile
    tempDir <- paste0(base::tempdir(), '/')

    command.rhess_sem <- paste('/usr/bin/R', '-q', '-f', 'HESS_SEM_Wrapper.R', '--args', inFile, tempDir, nIter, nChains, seed, method, collapse = ' ', sep=' ')
    print(command.rhess_sem)

    output <- list()

    return(output)
}
