#' Explore IPs
#'
#' Returns the neighbors in any given IP level range and essentially allows you to explore closeby IP addresses.
#'
#' @param ip_address Starting IP address (optionally with CIDR subnet mask)
#' @param trails_key your [SecurityTrails API Key](https://docs.securitytrails.com/docs/authentication).
#'        See [trails_api_key()].
#' @return a list
#' @family IP functions
#' @export
#' @examples
#' st_explore_ips("8.8.8.8")
st_explore_ips <- function(ip_address, trails_key = trails_api_key()) {

  httr::GET(
    url = sprintf("https://api.securitytrails.com/v1/ips/nearby/%s", ip_address[1]),
    httr::add_headers(`APIKEY` = trails_key),
    httr::user_agent(.st_ua)
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as = "text", encoding = "UTF-8")

  out <- jsonlite::fromJSON(out)

  return(out)

}
