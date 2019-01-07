#' Find associated domains
#'
#' Find all domains that are related to a domain you input
#'
#' @param domain domain to get
#' @param trails_key your [SecurityTrails API Key](https://docs.securitytrails.com/docs/authentication).
#'        See [trails_api_key()].
#' @return a list
#' @family Domain details
#' @export
#' @examples
#' st_assoc_domains("oracle.com")
st_assoc_domains <- function(domain, trails_key = trails_api_key()) {

  httr::GET(
    url = sprintf("https://api.securitytrails.com/v1/domain/%s/associated", host[1]),
    httr::add_headers(`APIKEY` = trails_key),
    httr::user_agent(.st_ua)
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as = "text", encoding = "UTF-8")

  out <- jsonlite::fromJSON(out)

  return(out)

}
