#' Find the target language
#' @importFrom stringr str_locate
#' @importFrom stringr str_sub
#' @importFrom stringr fixed
ask_target_language <- function() {
  raw <- Sys.getenv("LANG")
  pos <- str_locate(raw, fixed("_"))[1]
  if (is.na(pos)) return(raw)
  str_sub(raw, end = pos - 1)
}

#' Return the message in the target language
express_message <- function(exception) {
  lang <- ask_target_language()
  extract_message(exception, lang)
}

extract_message <- function(exception, lang) {
  if (is.null(exception$message[[lang]])) {
    out <- exception$message["default"]
  } else {
    out <- exception$message[lang]
  }
  out
}

