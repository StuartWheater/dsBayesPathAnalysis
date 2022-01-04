dsBayesPathAnalysis
===================

DataSHIELD Bayes Path Analysis server-side R library

## Installing dsBayesPathAnalysis

The installation of the dsBayesPathAnalysis package for DataSHIELD requires the

### Install R packages required by rBSEM package

On the machine running the Opal Server, install the 'readr', 'coda' and 'igraph' R packages:

> install.packages(c('readr', 'coda', 'igraph'))

This shouldn't be done via the Opal Web Portal, but the R command prompt.

### Install rBSEM package

Copy the rBSEM "tar.gz" file, created by "devtools::build", to the machine running the Opal server.
This can be install using the R command:

> install.packages('rBSEM_0.2.2.tar.gz')

### Install dsBayesPathAnalysis package

Within the dsBayesPathAnalysis package source there is a directory "scripts", which contains a script
which will deploy dsBayesPathAnalysis. You will required to copy the file 'server_details-default.R' to
'server_details.R' then edit to specify the username, password and url. This following R command will
install the dsBayesPathAnalysis package:

> R -q -f scripts/deploy_package.R

This script will build and remotely deploy the dsBayesPathAnalysis DataSHIELD package into the Opal server.

Create a directory "tmp" within "/opt/hess_sem/" directory with permission bits of "777".

### Increase Memory available to Rock

Change /etc/default/rock to contain:

JAVA_ARGS="-Xmx512M -XX:MaxPermSize=128M -XX:+UseG1GC"

(May need to restart 'rock')

### Create Resource

Name of resource: "sem_data"
Catagory:         "Commands"
Type:             "Shell"
Parameters:
    Work directory: "/opt/hess_sem"
    Shell commands:
        Executable: "/bin/ls"
        Executable: "/usr/bin/R"
