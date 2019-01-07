#' List Tags
#'
#' Returns tags for a given hostname
#'
#' @param host hostname
#' @param trails_key your [SecurityTrails API Key](https://docs.securitytrails.com/docs/authentication).
#'        See [trails_api_key()].
#' @return a list
#' @family Domain details
#' @export
#' @examples
#' st_tags("oracle.com")
st_tags <- function(domain, trails_key = trails_api_key()) {

  httr::GET(
    url = sprintf("https://api.securitytrails.com/v1/domain/%s/tags", host[1]),
    httr::add_headers(`APIKEY` = trails_key),
    httr::user_agent(.st_ua)
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as = "text", encoding = "UTF-8")

  out <- jsonlite::fromJSON(out)

  return(out)

}
