This template demonstrates many of the bells and whistles of the `reprex::reprex_document()` output format. The YAML sets many options to non-default values, such as using `#;-)` as the comment in front of output.

## Code style

Since `style` is `TRUE`, this difficult-to-read code (look at the `.Rmd` source file) will be restyled according to the Tidyverse style guide when it’s rendered. Whitespace rationing is not in effect!

``` r
x=1;y=2;z=x+y;z
#;-) [1] 3
```

## Quiet tidyverse

The tidyverse meta-package is quite chatty at startup, which can be very useful in exploratory, interactive work. It is often less useful in a reprex, so by default, we suppress this.

However, when `tidyverse_quiet` is `FALSE`, the rendered result will include a tidyverse startup message about package versions and function masking.

``` r
library(tidyverse)
#;-) ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.1 ──
#;-) ✓ ggplot2 3.3.3     ✓ purrr   0.3.4
#;-) ✓ tibble  3.1.2     ✓ dplyr   1.0.6
#;-) ✓ tidyr   1.1.3     ✓ stringr 1.4.0
#;-) ✓ readr   1.4.0     ✓ forcats 0.5.1
#;-) ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
#;-) x dplyr::filter() masks stats::filter()
#;-) x dplyr::lag()    masks stats::lag()
```

## Chunks in languages other than R

Remember: knitr supports many other languages than R, so you can reprex bits of code in Python, Ruby, Julia, C++, SQL, and more. Note that, in many cases, this still requires that you have the relevant external interpreter installed.

Let’s try Python!

``` python
x = 'hello, python world!'
print(x.split(' '))
#;-) ['hello,', 'python', 'world!']
```

And bash!

``` bash
echo "Hello Bash!";
pwd;
ls | head;
#;-) Hello Bash!
#;-) /Users/siwachoat/Library/Mobile Documents/com~apple~CloudDocs/github/ssiwacho/2758501/ssiwacho.github.io/DL/DL
#;-) Untitled.Rmd
#;-) Untitled.html
#;-) Untitled_reprex.Rmd
#;-) Untitled_reprex.md
#;-) Untitled_reprex_std_out_err.txt
#;-) index.bib
```

Write a function in C++, use Rcpp to wrap it and …

``` cpp
#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
NumericVector timesTwo(NumericVector x) {
  return x * 2;
}
```

then immediately call your C++ function from R!

``` r
timesTwo(1:4)
#;-) [1] 2 4 6 8
```

## Standard output and error

Some output that you see in an interactive session is not actually captured by rmarkdown, when that same code is executed in the context of an `.Rmd` document. When `std_out_err` is `TRUE`, `reprex::reprex_render()` uses a feature of `callr:r()` to capture such output and then injects it into the rendered result.

Look for this output in a special section of the rendered document (and notice that it does not appear right here).

``` r
system2("echo", args = "Output that would normally be lost")
```

## Session info

Because `session_info` is `TRUE`, the rendered result includes session info, even though no such code is included here in the source document.

<details style="margin-bottom:10px;">
<summary>
Standard output and standard error
</summary>

``` sh
x Install the styler package in order to use `style = TRUE`.
running: bash  -c 'echo "Hello Bash!";
pwd;
ls | head;'
Building shared library for Rcpp code chunk...
In file included from file74551417672e.cpp:1:
In file included from /Library/Frameworks/R.framework/Versions/4.0/Resources/library/Rcpp/include/Rcpp.h:57:
/Library/Frameworks/R.framework/Versions/4.0/Resources/library/Rcpp/include/Rcpp/DataFrame.h:136:18: warning: unused variable 'data' [-Wunused-variable]
            SEXP data = Parent::get__();
                 ^
1 warning generated.
Output that would normally be lost
```

</details>
<details style="margin-bottom:10px;">
<summary>
Session info
</summary>

``` r
sessioninfo::session_info()
#;-) ─ Session info ───────────────────────────────────────────────────────────────
#;-)  setting  value                       
#;-)  version  R version 4.0.5 (2021-03-31)
#;-)  os       macOS Big Sur 10.16         
#;-)  system   x86_64, darwin17.0          
#;-)  ui       X11                         
#;-)  language (EN)                        
#;-)  collate  en_US.UTF-8                 
#;-)  ctype    en_US.UTF-8                 
#;-)  tz       Asia/Bangkok                
#;-)  date     2021-06-05                  
#;-) 
#;-) ─ Packages ───────────────────────────────────────────────────────────────────
#;-)  package     * version date       lib source        
#;-)  assertthat    0.2.1   2019-03-21 [1] CRAN (R 4.0.2)
#;-)  backports     1.2.1   2020-12-09 [1] CRAN (R 4.0.2)
#;-)  broom         0.7.6   2021-04-05 [1] CRAN (R 4.0.2)
#;-)  cellranger    1.1.0   2016-07-27 [1] CRAN (R 4.0.2)
#;-)  cli           2.5.0   2021-04-26 [1] CRAN (R 4.0.2)
#;-)  colorspace    2.0-1   2021-05-04 [1] CRAN (R 4.0.2)
#;-)  crayon        1.4.1   2021-02-08 [1] CRAN (R 4.0.2)
#;-)  DBI           1.1.1   2021-01-15 [1] CRAN (R 4.0.2)
#;-)  dbplyr        2.1.1   2021-04-06 [1] CRAN (R 4.0.2)
#;-)  digest        0.6.27  2020-10-24 [1] CRAN (R 4.0.2)
#;-)  dplyr       * 1.0.6   2021-05-05 [1] CRAN (R 4.0.2)
#;-)  ellipsis      0.3.2   2021-04-29 [1] CRAN (R 4.0.2)
#;-)  evaluate      0.14    2019-05-28 [1] CRAN (R 4.0.1)
#;-)  fansi         0.5.0   2021-05-25 [1] CRAN (R 4.0.5)
#;-)  forcats     * 0.5.1   2021-01-27 [1] CRAN (R 4.0.2)
#;-)  fs            1.5.0   2020-07-31 [1] CRAN (R 4.0.2)
#;-)  generics      0.1.0   2020-10-31 [1] CRAN (R 4.0.2)
#;-)  ggplot2     * 3.3.3   2020-12-30 [1] CRAN (R 4.0.2)
#;-)  glue          1.4.2   2020-08-27 [1] CRAN (R 4.0.2)
#;-)  gtable        0.3.0   2019-03-25 [1] CRAN (R 4.0.2)
#;-)  haven         2.4.1   2021-04-23 [1] CRAN (R 4.0.2)
#;-)  hms           1.1.0   2021-05-17 [1] CRAN (R 4.0.2)
#;-)  htmltools     0.5.1.1 2021-01-22 [1] CRAN (R 4.0.2)
#;-)  httr          1.4.2   2020-07-20 [1] CRAN (R 4.0.2)
#;-)  jsonlite      1.7.2   2020-12-09 [1] CRAN (R 4.0.2)
#;-)  knitr         1.33    2021-04-24 [1] CRAN (R 4.0.2)
#;-)  lattice       0.20-44 2021-05-02 [1] CRAN (R 4.0.2)
#;-)  lifecycle     1.0.0   2021-02-15 [1] CRAN (R 4.0.2)
#;-)  lubridate     1.7.10  2021-02-26 [1] CRAN (R 4.0.2)
#;-)  magrittr      2.0.1   2020-11-17 [1] CRAN (R 4.0.2)
#;-)  Matrix        1.3-3   2021-05-04 [1] CRAN (R 4.0.2)
#;-)  modelr        0.1.8   2020-05-19 [1] CRAN (R 4.0.2)
#;-)  munsell       0.5.0   2018-06-12 [1] CRAN (R 4.0.2)
#;-)  pillar        1.6.1   2021-05-16 [1] CRAN (R 4.0.2)
#;-)  pkgconfig     2.0.3   2019-09-22 [1] CRAN (R 4.0.2)
#;-)  png           0.1-7   2013-12-03 [1] CRAN (R 4.0.2)
#;-)  purrr       * 0.3.4   2020-04-17 [1] CRAN (R 4.0.2)
#;-)  R6            2.5.0   2020-10-28 [1] CRAN (R 4.0.2)
#;-)  Rcpp          1.0.6   2021-01-15 [1] CRAN (R 4.0.2)
#;-)  readr       * 1.4.0   2020-10-05 [1] CRAN (R 4.0.2)
#;-)  readxl        1.3.1   2019-03-13 [1] CRAN (R 4.0.2)
#;-)  reprex        2.0.0   2021-04-02 [1] CRAN (R 4.0.2)
#;-)  reticulate    1.20    2021-05-03 [1] CRAN (R 4.0.2)
#;-)  rlang         0.4.11  2021-04-30 [1] CRAN (R 4.0.2)
#;-)  rmarkdown     2.8     2021-05-07 [1] CRAN (R 4.0.2)
#;-)  rstudioapi    0.13    2020-11-12 [1] CRAN (R 4.0.2)
#;-)  rvest         1.0.0   2021-03-09 [1] CRAN (R 4.0.2)
#;-)  scales        1.1.1   2020-05-11 [1] CRAN (R 4.0.2)
#;-)  sessioninfo   1.1.1   2018-11-05 [1] CRAN (R 4.0.2)
#;-)  stringi       1.6.2   2021-05-17 [1] CRAN (R 4.0.2)
#;-)  stringr     * 1.4.0   2019-02-10 [1] CRAN (R 4.0.2)
#;-)  tibble      * 3.1.2   2021-05-16 [1] CRAN (R 4.0.2)
#;-)  tidyr       * 1.1.3   2021-03-03 [1] CRAN (R 4.0.2)
#;-)  tidyselect    1.1.1   2021-04-30 [1] CRAN (R 4.0.2)
#;-)  tidyverse   * 1.3.1   2021-04-15 [1] CRAN (R 4.0.2)
#;-)  utf8          1.2.1   2021-03-12 [1] CRAN (R 4.0.2)
#;-)  vctrs         0.3.8   2021-04-29 [1] CRAN (R 4.0.2)
#;-)  withr         2.4.2   2021-04-18 [1] CRAN (R 4.0.2)
#;-)  xfun          0.23    2021-05-15 [1] CRAN (R 4.0.2)
#;-)  xml2          1.3.2   2020-04-23 [1] CRAN (R 4.0.2)
#;-)  yaml          2.2.1   2020-02-01 [1] CRAN (R 4.0.2)
#;-) 
#;-) [1] /Library/Frameworks/R.framework/Versions/4.0/Resources/library
```

</details>
