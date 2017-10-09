
DHS API in R
============

[![Travis build status](https://travis-ci.org/muschellij2/dhs.svg?branch=master)](https://travis-ci.org/muschellij2/dhs) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/muschellij2/dhs?branch=master&svg=true)](https://ci.appveyor.com/project/muschellij2/dhs) [![Coverage status](https://coveralls.io/repos/github/muschellij2/dhs/badge.svg?branch=master)](https://coveralls.io/r/muschellij2/dhs?branch=master) <!-- README.md is generated from README.Rmd. Please edit that file -->

This package parses most of the output from the [DHS API](https://api.dhsprogram.com/#/index.html). Overall, these are helper functions to load in data about indicators and codebooks for the DHS data sets.

Installation
============

In `R`:

``` r
if (!("devtools" %in% installed.packages)){
    install.packages("devtools")
}
devtools::install_github("muschellij2/dhs")
```

After installation, you can load the library and get the list of countries/surveys from DHS:

``` r
library(dhs)
head(dhs_countries())
```

    ##   UNAIDS_CountryCode   SubregionName WHO_CountryCode FIPS_CountryCode
    ## 1                AFG      South Asia              AF               AF
    ## 2                ALB Southern Europe              AL               AL
    ## 3                AGO   Middle Africa              AO               AO
    ## 4                ARM       West Asia              AM               AM
    ## 5                AZE       West Asia              AZ               AJ
    ## 6                BGD      South Asia              BD               BG
    ##   ISO2_CountryCode ISO3_CountryCode RegionOrder DHS_CountryCode
    ## 1               AF              AFG          41              AF
    ## 2               AL              ALB          24              AL
    ## 3               AO              AGO          12              AO
    ## 4               AM              ARM          26              AM
    ## 5               AZ              AZE          26              AZ
    ## 6               BD              BGD          41              BD
    ##   CountryName UNICEF_CountryCode UNSTAT_CountryCode
    ## 1 Afghanistan                AFG                AFG
    ## 2     Albania                ALB                ALB
    ## 3      Angola                ANG                AGO
    ## 4     Armenia                ARM                ARM
    ## 5  Azerbaijan                AZE                AZE
    ## 6  Bangladesh                BAN                BGD
    ##                      RegionName
    ## 1        South & Southeast Asia
    ## 2 North Africa/West Asia/Europe
    ## 3            Sub-Saharan Africa
    ## 4 North Africa/West Asia/Europe
    ## 5 North Africa/West Asia/Europe
    ## 6        South & Southeast Asia

``` r
head(dhs_surveys())
```

    ##   ReleaseDate  SurveyId MaxAgeWomen FieldworkStart MinAgeMen
    ## 1  2017-02-15 AF2015DHS          49     2015-06-01        15
    ## 2             AL2002RHS                 2002-08-01          
    ## 3  2010-03-15 AL2008DHS          49     2008-10-01        15
    ## 4  2008-02-27 AO2006MIS          49     2006-11-01          
    ## 5  2012-01-24 AO2011MIS          49     2011-01-01          
    ## 6  2017-06-30 AO2015DHS          49     2015-11-01        15
    ##                                                              ImplementingOrg
    ## 1 Central Statistics Organization (CSO) and Ministry of Public Health (MoPH)
    ## 2                                                                           
    ## 3     Institute of Statistics (INSTAT) and Institute of Public Health (IShP)
    ## 4                                                            COSEP, CONSAÚDE
    ## 5                                                         CONSAÚDE and COSEP
    ## 6                                   Instituto Nacional de Estatistica (INE) 
    ##                                                                                             SurveyCharacteristicIds
    ## 1                                    92, 39, 6, 1, 79, 31, 14, 57, 8, 34, 17, 22, 20, 24, 21, 13, 36, 59, 3, 11, 26
    ## 2                                                                                                                  
    ## 3                 33, 10, 43, 41, 31, 22, 26, 24, 21, 59, 11, 34, 60, 14, 32, 16, 86, 69, 3, 67, 70, 79, 20, 85, 93
    ## 4                                                                             8, 41, 57, 36, 68, 63, 61, 26, 79, 89
    ## 5                                                                                     79, 90, 41, 26, 57, 8, 17, 89
    ## 6 91, 15, 59, 33, 31, 22, 32, 26, 24, 21, 14, 57, 8, 20, 17, 34, 5, 6, 60, 3, 69, 79, 23, 41, 10, 70, 11, 1, 89, 85
    ##   SurveyType SurveyYearLabel IndicatorData MinAgeWomen SurveyYear
    ## 1        DHS            2015             1          15       2015
    ## 2        RHS            2002             1                   2002
    ## 3        DHS         2008-09             1          15       2008
    ## 4        MIS         2006-07             1          15       2006
    ## 5        MIS            2011             1          15       2011
    ## 6        DHS         2015-16             1          15       2015
    ##   FieldworkEnd DHS_CountryCode NumberOfSamplePoints CountryName
    ## 1   2016-02-01              AF                  950 Afghanistan
    ## 2   2002-12-01              AL                          Albania
    ## 3   2009-04-01              AL                  450     Albania
    ## 4   2007-04-01              AO                  120      Angola
    ## 5   2011-05-01              AO                  320      Angola
    ## 6   2016-02-01              AO                  627      Angola
    ##   NumberOfWomen   SubregionName MaxAgeMen SurveyNum SurveyStatus
    ## 1         29461      South Asia        49       471    Completed
    ## 2               Southern Europe                 378    Completed
    ## 3          7584 Southern Europe        49       327    Completed
    ## 4          2973   Middle Africa                 282    Completed
    ## 5          8589   Middle Africa                 395    Completed
    ## 6         14379   Middle Africa        54       477    Completed
    ##   NumberOfFacilities    UniverseOfMen                    RegionName
    ## 1                    Ever Married Men        South & Southeast Asia
    ## 2                                     North Africa/West Asia/Europe
    ## 3                             All Men North Africa/West Asia/Europe
    ## 4                                                Sub-Saharan Africa
    ## 5                                                Sub-Saharan Africa
    ## 6                             All Men            Sub-Saharan Africa
    ##      UniverseOfWomen      Footnotes PublicationDate NumberofHouseholds
    ## 1 Ever Married Women                     2017-01-01              24395
    ## 2                    CDC-RHS survey                                   
    ## 3          All Women                     2010-03-01               7999
    ## 4          All Women                     2007-11-01               2599
    ## 5          All Women                     2011-12-01               8030
    ## 6          All Women                     2017-06-01              16109
    ##   NumberOfMen
    ## 1       10760
    ## 2            
    ## 3        3013
    ## 4            
    ## 5            
    ## 6        5684
