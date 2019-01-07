#' WHOIS history by domain
#'
#' Lists out specific historical information about the given hostname parameter
#'
#' @note use the `pages` list element to determine if you need to call this function
#'       again to retrieve more results from the result set.
#' @param domain domain to get
#' @param page page # of the return results
#' @param trails_key your [SecurityTrails API Key](https://docs.securitytrails.com/docs/authentication).
#'        See [trails_api_key()].
#' @return a list
#' @family History functions
#' @export
#' @examples
#' st_whois_history("oracle.com")
st_whois_history <- function(domain, page = 1L, trails_key = trails_api_key()) {

  httr::GET(
    url = sprintf("https://api.securitytrails.com/v1/history/%s/whois", domain[1]),
    query = list(
      page = page
    ),
    httr::add_headers(`APIKEY` = trails_key),
    httr::user_agent(.st_ua)
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as = "text", encoding = "UTF-8")

  out <- jsonlite::fromJSON(out)

  return(out)

}
