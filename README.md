
<!-- README.md is generated from README.Rmd. Please edit that file -->

# L1fdvGenetics

<!-- badges: start -->

<!-- badges: end -->

The goal of `L1fdvGenetics` is to provide interactive tutorials for the
Genetics project. Tutorials are packaged so you can install them on you
computer and do the exercices without access to an internet connection.

## Local Installation

You only need to perform each of the following steps **once**:

  - installing **R**
  - installing **Rstudio**
  - installing **R** packages `remotes` and `learnr`

However each of them may take some time.

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

### Installing R packages

Launch Rstudio (by clicking on the corresponding icon) and execute the
following commands in the console

``` r
install.packages("remotes") 
install.packages("learnr") 
```

## Installation (II)

You need to install the tutorials **every time** I update them
(hopefully not too often)

### Installing the tutorials

You can install the tutorials from [GitHub](https://github.com/) by
launching Rstudio and typing the following command in the console:

``` r
remotes::install_github("mahendra-mariadassou/L1fdvGenetics")
```

The tutorials included in `L1fdvGenetics` are lightweight and have no
dependencies. It should be quite fast and not consume a lot of data.

## Remote installation

If you have trouble installing R on your computer, you can also use it
on a remote server. **This is not the preferred solution as it’s limited
to 9 people**. Favor the local installation if you can.

  - Sign up on [Rstudio Cloud](https://rstudio.cloud/)
  - Join the [Genetics
    project](https://rstudio.cloud/spaces/71850/join?access_code=Ojh4cBY8MsdNd44weVIZ6u5txVALu8l8wLriT99k)
  - Choose ‘Join Space’
  - Choose ‘Projects’ and select ‘Start’ (blue buttons)
    ![](inst/images/login_screen.png)
  - Rstudio deploys the project on a remote server, **you don’t need to
    install anything else**
  - You can then start the tutorial as shown below

## Starting a tutorial

This package is intended for use with `learnr` (which should be
installed when you install `L1fdvGenetics`)

There are two tutorials in the package

### Candidate gene (single marker) approach

``` r
## Launch only one tutorial at the time!!
learnr::run_tutorial("01_candidate_gene", package = "L1fdvGenetics")
```

If you have an error (occurs on Windows, with R 4.0.0)s, you can try the
following command:

``` r
rmarkdown::run(file = NULL, 
               dir = learnr:::get_tutorial_path("01_candidate_gene",  
                                                package = "L1fdvGenetics"), 
               shiny_args = list(launch.browser = 1))
```

### QTL detection by Simple Interval Mapping (SIM)

``` r
## Launch only one tutorial at the time!!
learnr::run_tutorial("02_interval_mapping", package = "L1fdvGenetics")
```

If you have an error, you can try the following command:

``` r
rmarkdown::run(file = NULL, 
               dir = learnr:::get_tutorial_path("02_interval_mapping",  
                                                package = "L1fdvGenetics"), 
               shiny_args = list(launch.browser = 1))
```
