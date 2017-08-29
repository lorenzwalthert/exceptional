#' Create an exception
#'
#' Create an objecto fo class "exceptional" that contains a message and data
#' that can be further manipulated programatically.
#' @param message The message that should be displayed to the user. Object of
#'   class "exceptional-message", created with [create_message()].
#' @param nature The nature of the exception.
#'   `allowed_natures`.
#' @import tibble
#' @export
create_exception <- function(message,
                             nature,
                             id = NULL,
                             ...,
                             allowed_natures = NULL) {
  if (is.null(allowed_natures)) {
    allowed_natures <- lookup_allowed_natrues()
  }
  nature <- create_nature(nature, allowed_natures)
  structure(
    lst(
      message,
      nature,
      id,
    ...
    ),
  class = c(as.character(nature), "exceptional")
  )
}


#' Create user messages
#'
#' @param default The default message as a string if no error message customized
#'   for the language local can be found.
#' @param ... further named arugments. The name must correspond to the
#'   [ISO-639-1](https://en.wikipedia.org/wiki/ISO_639-1) abbreviation (like
#'   hu for Hungary), the value is the message as a string.
#' @export
create_message <- function(default, ...) {
  if (missing(default))
    return(create_exception(create_message(paste0(
      "message must have a default", "error"
    ))))
  structure(
    lst(default,
      ...
    ),
    class = c("exceptional-message")
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
print.warning <- function(exception) {
  message("[WARNING] ", exception$message)
}


#' @export
print.error <- function(exception) {
  message("[ERROR] ", express_message(exception))
}
