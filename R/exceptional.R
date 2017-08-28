#' Create an exception
#'
#' Create an objecto fo class "exceptional" that contains a message and data
#' that can be further manipulated programatically.
#' @import tibble
#' @export
create_exception <- function(message, nature, ...) {
  structure(
    lst(
      message = message,
    ...
    ),
  class = c(nature, "exceptional")
  )
}

#' @export
create_id <- function(package, id) {
  paste(package, id, sep= "-")
}

#' @export
print.exceptional <- function(exception) {
  message(exception$message)
}

#' @export
print.info <- function(exception) {
  cat("Info: ", exception$message)
}

#' @export
print.alert <- function(exception) {
  message("Alert: ", exception$message)
}
