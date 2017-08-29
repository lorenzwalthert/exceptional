
<!-- README.md is generated from README.Rmd. Please edit that file -->
Exceptional - Better exception handling for R
=============================================

The goal of exceptional is to create better exception handling. This is achived by:

-   providing tools for creating not just error or warning messages at the point where the exception occurs, but creating an objecto of class "exception" that contains the message that should be displayed ot the user, the nature of it (e.g. error, warning, note etc.) and other elements that can be accessed later by the user.
-   allowing the user to acces information about the exception that is beyond the scope of a simple message `warning()` or `stop()` can deliver. Again, this is possible through the class "exceptional".

Example
-------

This is a basic example:

``` r
library("exceptional")
```

Instead of

``` r
message("I am pretty urgent")
#> I am pretty urgent
```

We could do

``` r
my_alert <- create_exception(
  create_message(default = "I am pretty urgent"), 
  nature = "warning", 
  cause = "because the weather is getting bad. Look at the clouds",
  parameter = letters[1:3],
  id = create_id("mypackage", 1)
)

my_alert
#> [WARNING] I am pretty urgent
my_alert$parameter
#> [1] "a" "b" "c"
```

Exceptions should have a unique id composed of the package name and a number and may be documented.

``` r
my_alert$id
#> [1] "mypackage-1"
my_alert$cause
#> [1] "because the weather is getting bad. Look at the clouds"
```

We can also create different messages depending on the language setting.

``` r
f <- function() {
  msg <- create_message(default = "That's in english", de = "Deutsche Nachricht")
  create_exception(msg, nature = "error")
}
Sys.setenv(LANG = "en")
f()
#> [ERROR] That's in english

Sys.setenv(LANG = "de")
f()
#> [ERROR] Deutsche Nachricht
```
