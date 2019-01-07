# Search Domain (DSL)
#
# @param query the SecurityTrails [DSL query string](https://docs.securitytrails.com/docs/how-to-use-the-dsl)
# @param include_ips resolve any A records and additionally return IP addresses? Default: `TRUE`.
# @param page the page of the returned results.
# @param trails_key your [SecurityTrails API Key](https://docs.securitytrails.com/docs/authentication).
#        See [trails_api_key()].
# @export
# @references [How to use the DSL](https://docs.securitytrails.com/docs/how-to-use-the-dsl)
# @examples
# st_domain_search_dsl("whois_email = 'domain-contact_ww_grp@@oracle.com'")
# st_domain_search_dsl <- function(query, include_ips = TRUE, page = 1L, trails_key = trails_api_key()) {
#
#   httr::POST(
#     url = "https://api.securitytrails.com/v1/domains/list",
#     query = list(
#       include_ips = if (include_ips[1]) "true" else "false",
#       page = as.integer(page),
#       api_key = trails_key,
#       scroll = TRUE
#     ),
#     body = list(
#       query = query
#     ),
#     httr::add_headers(`APIKEY` = trails_key),
#     httr::user_agent(.st_ua),
#     httr::content_type_json(),
#     encode = "json"
#   ) -> res
#
#   httr::stop_for_status(res)
#
#   out <- httr::content(res, as = "text", encoding = "UTF-8")
#
#   out <- jsonlite::fromJSON(out)
#
#   return(out)
#
# }
