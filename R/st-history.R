#' DNS history by record type
#'
#' Lists out specific historical information about the given hostname parameter
#'
#' @note use the `pages` list element to determine if you need to call this function
#'       again to retrieve more results from the result set.
#' @param domain domain to get
#' @param type one of `a`, `aaaa`, `mx`, `ns`, `soa` or `txt`
#' @param page page # of the return results
#' @param trails_key your [SecurityTrails API Key](https://docs.securitytrails.com/docs/authentication).
#'        See [trails_api_key()].
#' @return a list
#' @family History functions
#' @export
#' @examples
#' st_dns_history("oracle.com")
st_dns_history <- function(domain, type = c("a", "aaaa", "mx", "ns", "soa", "txt"),
                           page = 1L, trails_key = trails_api_key()) {

  type <- match.arg(tolower(type[1]), c("a", "aaaa", "mx", "ns", "soa", "txt"))

  httr::GET(
    url = sprintf("https://api.securitytrails.com/v1/history/%s/dns/%s",
                  domain[1], type),
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
