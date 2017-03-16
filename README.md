# DHS API in R

This package parses most of the output from the [DHS API](https://api.dhsprogram.com/#/index.html).  Overall, these are helper functions to load in data about indicators and codebooks for the DHS data sets.

# Installation

In `R`:
```r
if (!("devtools" %in% installed.packages)){
    install.packages("devtools")
}
devtools::install_github("muschellij2/dhs")
```


After installation, you can load the library and get the list of countries/surveys from DHS:

```r
library(dhs)
head(dhs_countries())
head(dhs_surveys())
```
