#' Search Domain (Filter strings)
#'
#' @note use the `pages` list element to determine if you need to call this function
#'       again to retrieve more results from the result set.
#' @param ... individual [named filter strings]. Current supported strings include:
#'       "`ipv4`", "`ipv6`", "`apex_domain`", "`keyword`", "`mx`", "`ns`", "`cname`",
#'       "`subdomain`", "`soa_email`", "`tld`", "`whois_email`", "`whois_street1`",
#'        "`whois_street2`", "`whois_street3`", "`whois_street4`", "`whois_telephone`",
#'        "`whois_postalCode`", "`whois_organization`", "`whois_name`", "`whois_fax`",
#'        "`whois_city`".\cr\cr
#'        Using simple filter composition, any type of data fetching is possible.
#'        Given this, you can create any number of queries, depending on the need.
#'        It's worth noting that all of the filters are combined using `AND` fashion
#'        and work in combination.
#' @param include_ips resolve any A records and additionally return IP addresses? Default: `TRUE`.
#' @param page the page of the returned results.
#' @param trails_key your [SecurityTrails API Key](https://docs.securitytrails.com/docs/authentication).
#'        See [trails_api_key()].
#' @export
#' @references [Search filters](https://docs.securitytrails.com/v1.0/reference#search)
#' @examples
#' st_domain_search(apex_domain = "stackoverflow.com")
st_domain_search <- function(..., include_ips = TRUE, page = 1L, trails_key = trails_api_key()) {

  vals <- list(...)
  filter <-  list(filter = vals)

  httr::POST(
    url = "https://api.securitytrails.com/v1/domains/list",
    query = list(
      include_ips = if (include_ips[1]) "true" else "false",
      page = as.integer(page),
      api_key = trails_key,
      scroll = TRUE
    ),
    body = filter,
    httr::add_headers(`APIKEY` = trails_key),
    httr::user_agent(.st_ua),
    httr::content_type_json(),
    encode = "json"
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as = "text", encoding = "UTF-8")

  out <- jsonlite::fromJSON(out)

  return(out)

}
