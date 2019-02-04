#' Get WHOIS
#'
#' Returns the current WHOIS data about a given domain with the stats merged together
#'
#' @param domain domain to get
#' @param trails_key your [SecurityTrails API Key](https://docs.securitytrails.com/docs/authentication).
#'        See [trails_api_key()].
#' @return a list
#' @export
#' @family Domain details
#' @examples
#' st_whois("oracle.com")
st_whois <- function(domain, trails_key = trails_api_key()) {

  httr::GET(
    url = sprintf("https://api.securitytrails.com/v1/domain/%s/whois", domain[1]),
    httr::add_headers(`APIKEY` = trails_key),
    httr::user_agent(.st_ua)
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as = "text", encoding = "UTF-8")

  out <- jsonlite::fromJSON(out)

  return(out)

}
