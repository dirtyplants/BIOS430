# last modified by dirtyplants on Aug. 21, 2025.
#
# evoswirl FA2020 was the last stable version
# now moved to github.com/dirtyplants/BIOS430
# (evoswirl_2025.08.21.*)
#
# https://stackoverflow.com/questions/35720660/how-to-use-an-r-script-from-github
#
# requires these platform-specific files with '?raw=TRUE' suffix for calls to github:
#
# https://github.com/dirtyplants/BIOS430/blob/main/evoswirl_2025.08.21.zip?raw=TRUE
# (Windows binary)
#
# https://github.com/dirtyplants/BIOS430/blob/main/evoswirl_2025.08.21.tgz?raw=TRUE
# (Mac binary)
#
# https://github.com/dirtyplants/BIOS430/blob/main/evoswirl_2025.08.21.tar.gz?raw=TRUE (source)
#
install.missing <- function(packages, ...) {
  new.packages <- packages[!(packages %in% installed.packages()[,'Package'])]
  if(length(new.packages)) {
    install.packages(new.packages, ...)
  }
}

eswirl.version <- '2025.08.21'
os.type <- as.character(Sys.info()['sysname'])

if (os.type == 'Windows') {

  writeLines('PATH="${RTOOLS40_HOME}\\usr\\bin;${PATH}"', con = '~/.Renviron')
  install.missing(c('devtools', 'httr', 'rvest', 'stringi', 'stringr', 'testthat', 'xml2', 'yaml', 'base64enc', 'RCurl', 'XML', 'ggplot2'), quiet=FALSE, verbose=TRUE, type='win.binary')
  install.packages(paste0('https://github.com/dirtyplants/BIOS430/blob/main/evoswirl_', eswirl.version, '.zip?raw=TRUE'), type='win.binary', repos=NULL, quiet=TRUE, verbose=FALSE)
  # install.packages(paste0('https://github.com/dirtyplants/BIOS430/blob/main/evoswirl_', eswirl.version, '.tar.gz?raw=TRUE'), type='source', repos=NULL, quiet=TRUE, verbose=FALSE)

} else {

  install.missing(c('devtools', 'httr', 'rvest', 'stringi', 'stringr', 'testthat', 'xml2', 'yaml', 'base64enc', 'RCurl', 'XML', 'ggplot2'), quiet=FALSE, verbose=TRUE)
  install.packages(paste0('https://github.com/dirtyplants/BIOS430/blob/main/evoswirl_', eswirl.version, '.tgz?raw=TRUE'), type='mac.binary', repos=NULL, quiet=TRUE, verbose=FALSE)
  # install.packages(paste0('https://github.com/dirtyplants/BIOS430/blob/main/evoswirl_', eswirl.version, '.tar.gz?raw=TRUE'), type='source', repos=NULL, quiet=TRUE, verbose=FALSE)

}

FILE_SEP <<- .Platform$file.sep
HOME_DIR <<- normalizePath(path=Sys.getenv('HOME'))

BIOS430_DIR <<- normalizePath(file.path(HOME_DIR, 'BIOS430', fsep=FILE_SEP), mustWork=FALSE)
dir.create(BIOS430_DIR, recursive=TRUE, showWarnings=FALSE)

setwd(BIOS430_DIR)

SWIRL_DATA_DIR <<- normalizePath(file.path(BIOS430_DIR, 'Swirl', 'Data', fsep=FILE_SEP), mustWork=FALSE)
dir.create(SWIRL_DATA_DIR, recursive=TRUE, showWarnings=FALSE)

cat(paste0('\nYour class directory location is: ', BIOS430_DIR, '\n\n'))

evoswirl::swirl_options(swirl_data_dir=SWIRL_DATA_DIR)

cat('Looks like everything worked well, you are ready to begin!\n\n')

cat('At the console prompt, first type:\n\n> library(evoswirl)\n\nto load the evoswirl package.\n\n')

cat('After that, to begin evoswirl lessons, type:\n\n> swirl()\n\n')
