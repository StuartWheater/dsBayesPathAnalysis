library(devtools)
library(opalr)

buildfile_location <- devtools::build()

source('scripts/server_details.R')

opal <- opalr::opal.login(username = server.details$username, password = server.details$password, url = server.details$url, opts = getOption("opal.opts", list(ssl_verifyhost=0, ssl_verifypeer=0)))

opalr::dsadmin.install_local_package(opal = opal, path = buildfile_location, profile = server.details$profile)

opalr::opal.logout(opal)
