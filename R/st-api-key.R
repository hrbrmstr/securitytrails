#' Get or set SECURITYTRAILS_API_KEY value
#'
#' The API wrapper functions in this package all rely on a SecurityTrails API
#' key residing in the environment variable `SECURITYTRAILS_API_KEY`. The
#' easiest way to accomplish this is to set it in the `~.Renviron`` file in your
#' home directory.
#'
#' @param force force setting a new SecurityTrails API key for the current environment?
#' @return atomic character vector containing the SecurityTrails API key
#' @export
trails_api_key <- function(force = FALSE) {
  env <- Sys.getenv("SECURITYTRAILS_API_KEY")
  if (!identical(env, "") && !force) return(env)

  if (!interactive()) {
    stop("Please set env var SECURITYTRAILS_API_KEY to your SecurityTrails API key",
      call. = FALSE
    )
  }

  message("Couldn't find env var SECURITYTRAILS_API_KEY See ?trails_api_key for more details.")
  message("Please enter your API key and press enter:")
  pat <- readline(": ")

  if (identical(pat, "")) {
    stop("SecurityTrails API key entry failed", call. = FALSE)
  }

  message("Updating SECURITYTRAILS_API_KEY env var...")

  Sys.setenv(SECURITYTRAILS_API_KEY = pat)

  pat

}
