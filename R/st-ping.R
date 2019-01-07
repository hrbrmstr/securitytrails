#' Test Access To the SecurityTrails API
#'
#' @param trails_key your [SecurityTrails API Key](https://docs.securitytrails.com/docs/authentication).
#'        See [trails_api_key()].
#' @export
#' @examples
#' st_ping()
st_ping <- function(trails_key = trails_api_key()) {

  httr::GET(
    url = "https://api.securitytrails.com/v1/ping",
    httr::add_headers(`APIKEY` = trails_key),
    httr::user_agent(.st_ua)
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as = "text", encoding = "UTF-8")

  out <- jsonlite::fromJSON(out)

  return(out$success)

}
