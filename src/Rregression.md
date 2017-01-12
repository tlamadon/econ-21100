ECON 21100 - R regression
================
Wooyong Lee









Linear regression
=================

The lm function
---------------

The function that does the regression is `lm`. To see how it works, let's use this dataset as an example.

``` r
library(datasets)
mtcars
```

    ##                      mpg cyl  disp  hp drat    wt  qsec vs am gear carb
    ## Mazda RX4           21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
    ## Mazda RX4 Wag       21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
    ## Datsun 710          22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
    ## Hornet 4 Drive      21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1
    ## Hornet Sportabout   18.7   8 360.0 175 3.15 3.440 17.02  0  0    3    2
    ## Valiant             18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1
    ## Duster 360          14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4
    ## Merc 240D           24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
    ## Merc 230            22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
    ## Merc 280            19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
    ## Merc 280C           17.8   6 167.6 123 3.92 3.440 18.90  1  0    4    4
    ## Merc 450SE          16.4   8 275.8 180 3.07 4.070 17.40  0  0    3    3
    ## Merc 450SL          17.3   8 275.8 180 3.07 3.730 17.60  0  0    3    3
    ## Merc 450SLC         15.2   8 275.8 180 3.07 3.780 18.00  0  0    3    3
    ## Cadillac Fleetwood  10.4   8 472.0 205 2.93 5.250 17.98  0  0    3    4
    ## Lincoln Continental 10.4   8 460.0 215 3.00 5.424 17.82  0  0    3    4
    ## Chrysler Imperial   14.7   8 440.0 230 3.23 5.345 17.42  0  0    3    4
    ## Fiat 128            32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1
    ## Honda Civic         30.4   4  75.7  52 4.93 1.615 18.52  1  1    4    2
    ## Toyota Corolla      33.9   4  71.1  65 4.22 1.835 19.90  1  1    4    1
    ## Toyota Corona       21.5   4 120.1  97 3.70 2.465 20.01  1  0    3    1
    ## Dodge Challenger    15.5   8 318.0 150 2.76 3.520 16.87  0  0    3    2
    ## AMC Javelin         15.2   8 304.0 150 3.15 3.435 17.30  0  0    3    2
    ## Camaro Z28          13.3   8 350.0 245 3.73 3.840 15.41  0  0    3    4
    ## Pontiac Firebird    19.2   8 400.0 175 3.08 3.845 17.05  0  0    3    2
    ## Fiat X1-9           27.3   4  79.0  66 4.08 1.935 18.90  1  1    4    1
    ## Porsche 914-2       26.0   4 120.3  91 4.43 2.140 16.70  0  1    5    2
    ## Lotus Europa        30.4   4  95.1 113 3.77 1.513 16.90  1  1    5    2
    ## Ford Pantera L      15.8   8 351.0 264 4.22 3.170 14.50  0  1    5    4
    ## Ferrari Dino        19.7   6 145.0 175 3.62 2.770 15.50  0  1    5    6
    ## Maserati Bora       15.0   8 301.0 335 3.54 3.570 14.60  0  1    5    8
    ## Volvo 142E          21.4   4 121.0 109 4.11 2.780 18.60  1  1    4    2

``` r
rownames(mtcars) = NULL # let's remove the row-labels as we don't care them for our purpose.
mtcars
```

    ##     mpg cyl  disp  hp drat    wt  qsec vs am gear carb
    ## 1  21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
    ## 2  21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
    ## 3  22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
    ## 4  21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1
    ## 5  18.7   8 360.0 175 3.15 3.440 17.02  0  0    3    2
    ## 6  18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1
    ## 7  14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4
    ## 8  24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
    ## 9  22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
    ## 10 19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
    ## 11 17.8   6 167.6 123 3.92 3.440 18.90  1  0    4    4
    ## 12 16.4   8 275.8 180 3.07 4.070 17.40  0  0    3    3
    ## 13 17.3   8 275.8 180 3.07 3.730 17.60  0  0    3    3
    ## 14 15.2   8 275.8 180 3.07 3.780 18.00  0  0    3    3
    ## 15 10.4   8 472.0 205 2.93 5.250 17.98  0  0    3    4
    ## 16 10.4   8 460.0 215 3.00 5.424 17.82  0  0    3    4
    ## 17 14.7   8 440.0 230 3.23 5.345 17.42  0  0    3    4
    ## 18 32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1
    ## 19 30.4   4  75.7  52 4.93 1.615 18.52  1  1    4    2
    ## 20 33.9   4  71.1  65 4.22 1.835 19.90  1  1    4    1
    ## 21 21.5   4 120.1  97 3.70 2.465 20.01  1  0    3    1
    ## 22 15.5   8 318.0 150 2.76 3.520 16.87  0  0    3    2
    ## 23 15.2   8 304.0 150 3.15 3.435 17.30  0  0    3    2
    ## 24 13.3   8 350.0 245 3.73 3.840 15.41  0  0    3    4
    ## 25 19.2   8 400.0 175 3.08 3.845 17.05  0  0    3    2
    ## 26 27.3   4  79.0  66 4.08 1.935 18.90  1  1    4    1
    ## 27 26.0   4 120.3  91 4.43 2.140 16.70  0  1    5    2
    ## 28 30.4   4  95.1 113 3.77 1.513 16.90  1  1    5    2
    ## 29 15.8   8 351.0 264 4.22 3.170 14.50  0  1    5    4
    ## 30 19.7   6 145.0 175 3.62 2.770 15.50  0  1    5    6
    ## 31 15.0   8 301.0 335 3.54 3.570 14.60  0  1    5    8
    ## 32 21.4   4 121.0 109 4.11 2.780 18.60  1  1    4    2

If we want to regress `mpg` on a constant and `wt`, we write this.

``` r
regressionFit = lm(mpg ~ wt, data = mtcars)
```

We saved the return value of `lm` to `regressionFit`. It is a complicated object:

``` r
str(regressionFit)
```

    ## List of 12
    ##  $ coefficients : Named num [1:2] 37.29 -5.34
    ##   ..- attr(*, "names")= chr [1:2] "(Intercept)" "wt"
    ##  $ residuals    : Named num [1:32] -2.28 -0.92 -2.09 1.3 -0.2 ...
    ##   ..- attr(*, "names")= chr [1:32] "1" "2" "3" "4" ...
    ##  $ effects      : Named num [1:32] -113.65 -29.116 -1.661 1.631 0.111 ...
    ##   ..- attr(*, "names")= chr [1:32] "(Intercept)" "wt" "" "" ...
    ##  $ rank         : int 2
    ##  $ fitted.values: Named num [1:32] 23.3 21.9 24.9 20.1 18.9 ...
    ##   ..- attr(*, "names")= chr [1:32] "1" "2" "3" "4" ...
    ##  $ assign       : int [1:2] 0 1
    ##  $ qr           :List of 5
    ##   ..$ qr   : num [1:32, 1:2] -5.657 0.177 0.177 0.177 0.177 ...
    ##   .. ..- attr(*, "dimnames")=List of 2
    ##   .. .. ..$ : chr [1:32] "1" "2" "3" "4" ...
    ##   .. .. ..$ : chr [1:2] "(Intercept)" "wt"
    ##   .. ..- attr(*, "assign")= int [1:2] 0 1
    ##   ..$ qraux: num [1:2] 1.18 1.05
    ##   ..$ pivot: int [1:2] 1 2
    ##   ..$ tol  : num 1e-07
    ##   ..$ rank : int 2
    ##   ..- attr(*, "class")= chr "qr"
    ##  $ df.residual  : int 30
    ##  $ xlevels      : Named list()
    ##  $ call         : language lm(formula = mpg ~ wt, data = mtcars)
    ##  $ terms        :Classes 'terms', 'formula'  language mpg ~ wt
    ##   .. ..- attr(*, "variables")= language list(mpg, wt)
    ##   .. ..- attr(*, "factors")= int [1:2, 1] 0 1
    ##   .. .. ..- attr(*, "dimnames")=List of 2
    ##   .. .. .. ..$ : chr [1:2] "mpg" "wt"
    ##   .. .. .. ..$ : chr "wt"
    ##   .. ..- attr(*, "term.labels")= chr "wt"
    ##   .. ..- attr(*, "order")= int 1
    ##   .. ..- attr(*, "intercept")= int 1
    ##   .. ..- attr(*, "response")= int 1
    ##   .. ..- attr(*, ".Environment")=<environment: R_GlobalEnv> 
    ##   .. ..- attr(*, "predvars")= language list(mpg, wt)
    ##   .. ..- attr(*, "dataClasses")= Named chr [1:2] "numeric" "numeric"
    ##   .. .. ..- attr(*, "names")= chr [1:2] "mpg" "wt"
    ##  $ model        :'data.frame':   32 obs. of  2 variables:
    ##   ..$ mpg: num [1:32] 21 21 22.8 21.4 18.7 18.1 14.3 24.4 22.8 19.2 ...
    ##   ..$ wt : num [1:32] 2.62 2.88 2.32 3.21 3.44 ...
    ##   ..- attr(*, "terms")=Classes 'terms', 'formula'  language mpg ~ wt
    ##   .. .. ..- attr(*, "variables")= language list(mpg, wt)
    ##   .. .. ..- attr(*, "factors")= int [1:2, 1] 0 1
    ##   .. .. .. ..- attr(*, "dimnames")=List of 2
    ##   .. .. .. .. ..$ : chr [1:2] "mpg" "wt"
    ##   .. .. .. .. ..$ : chr "wt"
    ##   .. .. ..- attr(*, "term.labels")= chr "wt"
    ##   .. .. ..- attr(*, "order")= int 1
    ##   .. .. ..- attr(*, "intercept")= int 1
    ##   .. .. ..- attr(*, "response")= int 1
    ##   .. .. ..- attr(*, ".Environment")=<environment: R_GlobalEnv> 
    ##   .. .. ..- attr(*, "predvars")= language list(mpg, wt)
    ##   .. .. ..- attr(*, "dataClasses")= Named chr [1:2] "numeric" "numeric"
    ##   .. .. .. ..- attr(*, "names")= chr [1:2] "mpg" "wt"
    ##  - attr(*, "class")= chr "lm"

But we see familiar names such as `coefficients`, `residuals`, and `fitted.values`. We can access these in the way that we access subvariables in a list.

``` r
regressionFit$coefficients
```

    ## (Intercept)          wt 
    ##   37.285126   -5.344472

``` r
regressionFit$residuals
```

    ##          1          2          3          4          5          6 
    ## -2.2826106 -0.9197704 -2.0859521  1.2973499 -0.2001440 -0.6932545 
    ##          7          8          9         10         11         12 
    ## -3.9053627  4.1637381  2.3499593  0.2998560 -1.1001440  0.8668731 
    ##         13         14         15         16         17         18 
    ## -0.0502472 -1.8830236  1.1733496  2.1032876  5.9810744  6.8727113 
    ##         19         20         21         22         23         24 
    ##  1.7461954  6.4219792 -2.6110037 -2.9725862 -3.7268663 -3.4623553 
    ##         25         26         27         28         29         30 
    ##  2.4643670  0.3564263  0.1520430  1.2010593 -4.5431513 -2.7809399 
    ##         31         32 
    ## -3.2053627 -1.0274952

``` r
regressionFit$fitted.values
```

    ##         1         2         3         4         5         6         7 
    ## 23.282611 21.919770 24.885952 20.102650 18.900144 18.793255 18.205363 
    ##         8         9        10        11        12        13        14 
    ## 20.236262 20.450041 18.900144 18.900144 15.533127 17.350247 17.083024 
    ##        15        16        17        18        19        20        21 
    ##  9.226650  8.296712  8.718926 25.527289 28.653805 27.478021 24.111004 
    ##        22        23        24        25        26        27        28 
    ## 18.472586 18.926866 16.762355 16.735633 26.943574 25.847957 29.198941 
    ##        29        30        31        32 
    ## 20.343151 22.480940 18.205363 22.427495

To see the usual results that we get from other languages, type these:

``` r
regressionFit
```

    ## 
    ## Call:
    ## lm(formula = mpg ~ wt, data = mtcars)
    ## 
    ## Coefficients:
    ## (Intercept)           wt  
    ##      37.285       -5.344

``` r
print(regressionFit)
```

    ## 
    ## Call:
    ## lm(formula = mpg ~ wt, data = mtcars)
    ## 
    ## Coefficients:
    ## (Intercept)           wt  
    ##      37.285       -5.344

``` r
summary(regressionFit)
```

    ## 
    ## Call:
    ## lm(formula = mpg ~ wt, data = mtcars)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -4.5432 -2.3647 -0.1252  1.4096  6.8727 
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)  37.2851     1.8776  19.858  < 2e-16 ***
    ## wt           -5.3445     0.5591  -9.559 1.29e-10 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 3.046 on 30 degrees of freedom
    ## Multiple R-squared:  0.7528, Adjusted R-squared:  0.7446 
    ## F-statistic: 91.38 on 1 and 30 DF,  p-value: 1.294e-10

To run a regression without a constant, do the following.

``` r
regFitWithoutConst = lm(mpg ~ -1 + wt, data=mtcars)
summary(regFitWithoutConst)
```

    ## 
    ## Call:
    ## lm(formula = mpg ~ -1 + wt, data = mtcars)
    ## 
    ## Residuals:
    ##      Min       1Q   Median       3Q      Max 
    ## -18.3018  -3.3177   0.7468   7.7538  24.1899 
    ## 
    ## Coefficients:
    ##    Estimate Std. Error t value Pr(>|t|)    
    ## wt   5.2916     0.5932   8.921 4.55e-10 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 11.27 on 31 degrees of freedom
    ## Multiple R-squared:  0.7197, Adjusted R-squared:  0.7106 
    ## F-statistic: 79.58 on 1 and 31 DF,  p-value: 4.553e-10

Of course we can add other regressors.

``` r
regressionFit = lm(mpg ~ wt + cyl + disp, data=mtcars)
summary(regressionFit)
```

    ## 
    ## Call:
    ## lm(formula = mpg ~ wt + cyl + disp, data = mtcars)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -4.4035 -1.4028 -0.4955  1.3387  6.0722 
    ## 
    ## Coefficients:
    ##              Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept) 41.107678   2.842426  14.462 1.62e-14 ***
    ## wt          -3.635677   1.040138  -3.495  0.00160 ** 
    ## cyl         -1.784944   0.607110  -2.940  0.00651 ** 
    ## disp         0.007473   0.011845   0.631  0.53322    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 2.595 on 28 degrees of freedom
    ## Multiple R-squared:  0.8326, Adjusted R-squared:  0.8147 
    ## F-statistic: 46.42 on 3 and 28 DF,  p-value: 5.399e-11

As we have seen in the `ggplot2` tutorial, the variable `cyl` has only three values: `4`, `6,` `8`. We may want to treat `cyl` as a categorical variable and not a continuous variable. To do this so that we regress `mpg` on indicators of `cyl`, we use the `factor` function.

``` r
regressionFit = lm(mpg ~ wt + factor(cyl) + disp, data=mtcars)
summary(regressionFit)
```

    ## 
    ## Call:
    ## lm(formula = mpg ~ wt + factor(cyl) + disp, data = mtcars)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -4.5965 -1.2361 -0.4855  1.4740  5.8043 
    ## 
    ## Coefficients:
    ##               Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)  34.041673   1.963039  17.341 3.66e-16 ***
    ## wt           -3.306751   1.105083  -2.992  0.00586 ** 
    ## factor(cyl)6 -4.305559   1.464760  -2.939  0.00666 ** 
    ## factor(cyl)8 -6.322786   2.598416  -2.433  0.02186 *  
    ## disp          0.001715   0.013481   0.127  0.89972    
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 2.603 on 27 degrees of freedom
    ## Multiple R-squared:  0.8375, Adjusted R-squared:  0.8135 
    ## F-statistic:  34.8 on 4 and 27 DF,  p-value: 2.726e-10

If you want to use `wt^2` as a regressor, one way is to create another column in the `data.frame`.

``` r
mtcars$wt2 = mtcars$wt^2 # the dataframe creates the column wt2 and assign the values.
mtcars
```

    ##     mpg cyl  disp  hp drat    wt  qsec vs am gear carb       wt2
    ## 1  21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4  6.864400
    ## 2  21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4  8.265625
    ## 3  22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1  5.382400
    ## 4  21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1 10.336225
    ## 5  18.7   8 360.0 175 3.15 3.440 17.02  0  0    3    2 11.833600
    ## 6  18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1 11.971600
    ## 7  14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4 12.744900
    ## 8  24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2 10.176100
    ## 9  22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2  9.922500
    ## 10 19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4 11.833600
    ## 11 17.8   6 167.6 123 3.92 3.440 18.90  1  0    4    4 11.833600
    ## 12 16.4   8 275.8 180 3.07 4.070 17.40  0  0    3    3 16.564900
    ## 13 17.3   8 275.8 180 3.07 3.730 17.60  0  0    3    3 13.912900
    ## 14 15.2   8 275.8 180 3.07 3.780 18.00  0  0    3    3 14.288400
    ## 15 10.4   8 472.0 205 2.93 5.250 17.98  0  0    3    4 27.562500
    ## 16 10.4   8 460.0 215 3.00 5.424 17.82  0  0    3    4 29.419776
    ## 17 14.7   8 440.0 230 3.23 5.345 17.42  0  0    3    4 28.569025
    ## 18 32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1  4.840000
    ## 19 30.4   4  75.7  52 4.93 1.615 18.52  1  1    4    2  2.608225
    ## 20 33.9   4  71.1  65 4.22 1.835 19.90  1  1    4    1  3.367225
    ## 21 21.5   4 120.1  97 3.70 2.465 20.01  1  0    3    1  6.076225
    ## 22 15.5   8 318.0 150 2.76 3.520 16.87  0  0    3    2 12.390400
    ## 23 15.2   8 304.0 150 3.15 3.435 17.30  0  0    3    2 11.799225
    ## 24 13.3   8 350.0 245 3.73 3.840 15.41  0  0    3    4 14.745600
    ## 25 19.2   8 400.0 175 3.08 3.845 17.05  0  0    3    2 14.784025
    ## 26 27.3   4  79.0  66 4.08 1.935 18.90  1  1    4    1  3.744225
    ## 27 26.0   4 120.3  91 4.43 2.140 16.70  0  1    5    2  4.579600
    ## 28 30.4   4  95.1 113 3.77 1.513 16.90  1  1    5    2  2.289169
    ## 29 15.8   8 351.0 264 4.22 3.170 14.50  0  1    5    4 10.048900
    ## 30 19.7   6 145.0 175 3.62 2.770 15.50  0  1    5    6  7.672900
    ## 31 15.0   8 301.0 335 3.54 3.570 14.60  0  1    5    8 12.744900
    ## 32 21.4   4 121.0 109 4.11 2.780 18.60  1  1    4    2  7.728400

``` r
summary(lm(mpg ~ wt + wt2, data=mtcars))
```

    ## 
    ## Call:
    ## lm(formula = mpg ~ wt + wt2, data = mtcars)
    ## 
    ## Residuals:
    ##    Min     1Q Median     3Q    Max 
    ## -3.483 -1.998 -0.773  1.462  6.238 
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)  49.9308     4.2113  11.856 1.21e-12 ***
    ## wt          -13.3803     2.5140  -5.322 1.04e-05 ***
    ## wt2           1.1711     0.3594   3.258  0.00286 ** 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 2.651 on 29 degrees of freedom
    ## Multiple R-squared:  0.8191, Adjusted R-squared:  0.8066 
    ## F-statistic: 65.64 on 2 and 29 DF,  p-value: 1.715e-11

Another way that does not involve creating a column is the following.

``` r
summary(lm(mpg ~ wt + I(wt^2), data=mtcars))
```

    ## 
    ## Call:
    ## lm(formula = mpg ~ wt + I(wt^2), data = mtcars)
    ## 
    ## Residuals:
    ##    Min     1Q Median     3Q    Max 
    ## -3.483 -1.998 -0.773  1.462  6.238 
    ## 
    ## Coefficients:
    ##             Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)  49.9308     4.2113  11.856 1.21e-12 ***
    ## wt          -13.3803     2.5140  -5.322 1.04e-05 ***
    ## I(wt^2)       1.1711     0.3594   3.258  0.00286 ** 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 2.651 on 29 degrees of freedom
    ## Multiple R-squared:  0.8191, Adjusted R-squared:  0.8066 
    ## F-statistic: 65.64 on 2 and 29 DF,  p-value: 1.715e-11

The sums work similarly: e.g. `I(cyl+disp)`.

What is the function `I()`? The answer is related to what is the nature of the first argument of `lm`.

The formula
-----------

We have been omitting the label for the first argument. The first argument of the `lm` function is `formula`:

``` r
lm(formula = mpg ~ wt + disp, data=mtcars)
```

    ## 
    ## Call:
    ## lm(formula = mpg ~ wt + disp, data = mtcars)
    ## 
    ## Coefficients:
    ## (Intercept)           wt         disp  
    ##    34.96055     -3.35083     -0.01772

`formula` is a special object that interprets "expression". Note that we don't need to specify `mpg ~ wt + disp` as string, in which case we need to write `"mpg ~ wt + disp"`. In this "expression", the operators like `~` and `+` work differently from the usual way. For example, `+` in the formula is not an arithmetic operator, but an operator that says we have multiple regressors.

The function `I` orders R to read operators like `+` and `^` inside `I` as an arithmetic operator. So the operator `^` in `I(wt^2)` is interpreted as a power operator. Similarly, `I(cyl+disp)` interprets `+` as an arithmetic operator and not the operator that says we have two regressors `cyl` and `disp`.

probit and logit
================

For probit and logit, we use `glm`. Using it is very much similar to using `lm`.

``` r
# recall:
mtcars
```

    ##     mpg cyl  disp  hp drat    wt  qsec vs am gear carb       wt2
    ## 1  21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4  6.864400
    ## 2  21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4  8.265625
    ## 3  22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1  5.382400
    ## 4  21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1 10.336225
    ## 5  18.7   8 360.0 175 3.15 3.440 17.02  0  0    3    2 11.833600
    ## 6  18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1 11.971600
    ## 7  14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4 12.744900
    ## 8  24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2 10.176100
    ## 9  22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2  9.922500
    ## 10 19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4 11.833600
    ## 11 17.8   6 167.6 123 3.92 3.440 18.90  1  0    4    4 11.833600
    ## 12 16.4   8 275.8 180 3.07 4.070 17.40  0  0    3    3 16.564900
    ## 13 17.3   8 275.8 180 3.07 3.730 17.60  0  0    3    3 13.912900
    ## 14 15.2   8 275.8 180 3.07 3.780 18.00  0  0    3    3 14.288400
    ## 15 10.4   8 472.0 205 2.93 5.250 17.98  0  0    3    4 27.562500
    ## 16 10.4   8 460.0 215 3.00 5.424 17.82  0  0    3    4 29.419776
    ## 17 14.7   8 440.0 230 3.23 5.345 17.42  0  0    3    4 28.569025
    ## 18 32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1  4.840000
    ## 19 30.4   4  75.7  52 4.93 1.615 18.52  1  1    4    2  2.608225
    ## 20 33.9   4  71.1  65 4.22 1.835 19.90  1  1    4    1  3.367225
    ## 21 21.5   4 120.1  97 3.70 2.465 20.01  1  0    3    1  6.076225
    ## 22 15.5   8 318.0 150 2.76 3.520 16.87  0  0    3    2 12.390400
    ## 23 15.2   8 304.0 150 3.15 3.435 17.30  0  0    3    2 11.799225
    ## 24 13.3   8 350.0 245 3.73 3.840 15.41  0  0    3    4 14.745600
    ## 25 19.2   8 400.0 175 3.08 3.845 17.05  0  0    3    2 14.784025
    ## 26 27.3   4  79.0  66 4.08 1.935 18.90  1  1    4    1  3.744225
    ## 27 26.0   4 120.3  91 4.43 2.140 16.70  0  1    5    2  4.579600
    ## 28 30.4   4  95.1 113 3.77 1.513 16.90  1  1    5    2  2.289169
    ## 29 15.8   8 351.0 264 4.22 3.170 14.50  0  1    5    4 10.048900
    ## 30 19.7   6 145.0 175 3.62 2.770 15.50  0  1    5    6  7.672900
    ## 31 15.0   8 301.0 335 3.54 3.570 14.60  0  1    5    8 12.744900
    ## 32 21.4   4 121.0 109 4.11 2.780 18.60  1  1    4    2  7.728400

``` r
# let's run probit with some random formula. 
probitFit = glm(am ~ mpg + disp, family = binomial(link="probit"), data = mtcars)
probitFit
```

    ## 
    ## Call:  glm(formula = am ~ mpg + disp, family = binomial(link = "probit"), 
    ##     data = mtcars)
    ## 
    ## Coefficients:
    ## (Intercept)          mpg         disp  
    ##   -1.439509     0.104365    -0.004225  
    ## 
    ## Degrees of Freedom: 31 Total (i.e. Null);  29 Residual
    ## Null Deviance:       43.23 
    ## Residual Deviance: 28.6  AIC: 34.6

``` r
summary(probitFit)
```

    ## 
    ## Call:
    ## glm(formula = am ~ mpg + disp, family = binomial(link = "probit"), 
    ##     data = mtcars)
    ## 
    ## Deviance Residuals: 
    ##     Min       1Q   Median       3Q      Max  
    ## -1.5240  -0.6536  -0.3211   0.5906   2.1394  
    ## 
    ## Coefficients:
    ##              Estimate Std. Error z value Pr(>|z|)
    ## (Intercept) -1.439509   2.659683  -0.541    0.588
    ## mpg          0.104365   0.092554   1.128    0.259
    ## disp        -0.004225   0.004314  -0.979    0.327
    ## 
    ## (Dispersion parameter for binomial family taken to be 1)
    ## 
    ##     Null deviance: 43.230  on 31  degrees of freedom
    ## Residual deviance: 28.601  on 29  degrees of freedom
    ## AIC: 34.601
    ## 
    ## Number of Fisher Scoring iterations: 6

``` r
# let's run logit.
logitFit = glm(am ~ mpg + disp, family = binomial(link="logit"), data = mtcars)
logitFit
```

    ## 
    ## Call:  glm(formula = am ~ mpg + disp, family = binomial(link = "logit"), 
    ##     data = mtcars)
    ## 
    ## Coefficients:
    ## (Intercept)          mpg         disp  
    ##   -2.256714     0.169978    -0.007615  
    ## 
    ## Degrees of Freedom: 31 Total (i.e. Null);  29 Residual
    ## Null Deviance:       43.23 
    ## Residual Deviance: 28.61     AIC: 34.61

``` r
summary(logitFit)
```

    ## 
    ## Call:
    ## glm(formula = am ~ mpg + disp, family = binomial(link = "logit"), 
    ##     data = mtcars)
    ## 
    ## Deviance Residuals: 
    ##     Min       1Q   Median       3Q      Max  
    ## -1.5186  -0.6261  -0.3316   0.5960   2.1655  
    ## 
    ## Coefficients:
    ##              Estimate Std. Error z value Pr(>|z|)
    ## (Intercept) -2.256714   4.760079  -0.474    0.635
    ## mpg          0.169978   0.168373   1.010    0.313
    ## disp        -0.007615   0.007811  -0.975    0.330
    ## 
    ## (Dispersion parameter for binomial family taken to be 1)
    ## 
    ##     Null deviance: 43.230  on 31  degrees of freedom
    ## Residual deviance: 28.606  on 29  degrees of freedom
    ## AIC: 34.606
    ## 
    ## Number of Fisher Scoring iterations: 5
