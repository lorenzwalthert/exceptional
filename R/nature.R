lookup_allowed_natrues <- function(lvls = c("note", "warning", "error")) {
  factor(levels = lvls, ordered = TRUE)
}

#' Create one of the allowed natures
#'
#' @param nature A character string of length one indicating the desired
#'   nature of the exception
#' @param allowed an ordered, empty factor that contains the levels that are
#'   allowed.
create_nature <- function(nature, allowed = lookup_allowed_natrues()) {
  if (nature %in% levels(allowed))
    return(factor(nature, levels = levels(allowed)))
  message <- create_message(
    c("Nature must be one of ", paste(levels(allowed), collapse = ", "), ".")
  )
  return(create_exception(
    message,
    nature = "error"
  ))
}
