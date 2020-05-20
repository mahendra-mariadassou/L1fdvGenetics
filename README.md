
<!-- README.md is generated from README.Rmd. Please edit that file -->

# L1fdvGenetics

<!-- badges: start -->

<!-- badges: end -->

The goal of `L1fdvGenetics` is to provide interactive tutorials for the
Genetics project. Tutorials are packaged so you can install them on you
computer and do the exercices without access to an internet connection.

## Installation

You first need to install **R** and **Rstudio** on your computer.

### Installing R

Go to the CRAN [webpage](https://cran.r-project.org/), select your OS
and follow the instructions.

  - On Windows, you should just download and execute an .exe file.
  - On MacOS, you should just download and execute a .pkg file.
  - On Linux, you can get install R from the command line using
    something like

<!-- end list -->

``` bash
## If you're on Ubuntu
sudo apt-get install r-base
```

On **Windows**: you may need **Rtools** and **git**

  - **Rtools**: visit the dedicated
    [page](https://cran.r-project.org/bin/windows/Rtools/), download the
    suggested exe and install it on your computer
  - **git**: visit the dedicated
    [page](https://git-scm.com/download/win), download the suggested exe
    and install it on your computer

On **MacOS**: you may need **XCode**

  - **XCode**: visit the dedicated
    [page](https://mac.r-project.org/tools/), download the **Mandatory
    tools** and install them on your computer

### Installing RStudio Desktop

Go to the
[download](https://rstudio.com/products/rstudio/download/#download)
page. Select, download and install the file corresponding to your OS.

### Installing the tutorials

You can install the development version from
[GitHub](https://github.com/) by launching Rstudio and typing the
following command in the
console:

``` r
## You only need to install remotes the very first time you launch Rstudio.
## If that's the case, uncomment the next line
# install.packages("remotes") 
remotes::install_github("mahendra-mariadassou/L1fdvGenetics")
```

<!-- If the installation of `devtools` fails, you may need to install some system dependencies (for example on ubuntu/debian): -->

<!-- ```{bash, eval = FALSE} -->

<!-- sudo apt-get install libxml2-dev libcurl4-openssl-dev libssl-dev -->

<!-- ``` -->

<!-- On Mac, you may need some of the compiling tools listed [here](https://cran.r-project.org/bin/macosx/tools/) -->

## Starting a tutorial

This package is intended for use with `learnr` (which should be
installed when you install `L1fdvGenetics`)

``` r
library(learnr)
library(L1fdvGenetics)
```

## Candidate gene (single marker) approach

``` r
## Launch only one tutorial at the time!!
learnr::run_tutorial("01_candidate_gene", package = "L1fdvGenetics")
```

## QTL detection by Simple Interval Mapping (SIM)

``` r
## Launch only one tutorial at the time!!
learnr::run_tutorial("02_interval_mapping", package = "L1fdvGenetics")
```
