#' Get Domain
#'
#' Returns the current data about the given domain. In addition to the current
#' data, you also get the current statistics associated with a particular record.
#' For example, for a records you'll get how many other domains have the same IP.
#'
#' @param domain domain to get
#' @param trails_key your [SecurityTrails API Key](https://docs.securitytrails.com/docs/authentication).
#'        See [trails_api_key()].
#' @return a list
#' @family Domain details
#' @export
#' @examples
#' st_domain("oracle.com")
st_domain <- function(domain, trails_key = trails_api_key()) {

  httr::GET(
    url = sprintf("https://api.securitytrails.com/v1/domain/%s", domain[1]),
    httr::add_headers(`APIKEY` = trails_key),
    httr::user_agent(.st_ua)
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as = "text", encoding = "UTF-8")

  out <- jsonlite::fromJSON(out)

  return(out)

}
