% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/st-search-domain-filter.R
\name{st_domain_search}
\alias{st_domain_search}
\title{Search Domain (Filter strings)}
\usage{
st_domain_search(..., include_ips = TRUE, page = 1L,
  trails_key = trails_api_key())
}
\arguments{
\item{...}{individual \link{named filter strings}. Current supported strings include:
"\code{ipv4}", "\code{ipv6}", "\code{apex_domain}", "\code{keyword}", "\code{mx}", "\code{ns}", "\code{cname}",
"\code{subdomain}", "\code{soa_email}", "\code{tld}", "\code{whois_email}", "\code{whois_street1}",
"\code{whois_street2}", "\code{whois_street3}", "\code{whois_street4}", "\code{whois_telephone}",
"\code{whois_postalCode}", "\code{whois_organization}", "\code{whois_name}", "\code{whois_fax}",
"\code{whois_city}".\cr\cr
Using simple filter composition, any type of data fetching is possible.
Given this, you can create any number of queries, depending on the need.
It's worth noting that all of the filters are combined using \code{AND} fashion
and work in combination.}

\item{include_ips}{resolve any A records and additionally return IP addresses? Default: \code{TRUE}.}

\item{page}{the page of the returned results.}

\item{trails_key}{your \href{https://docs.securitytrails.com/docs/authentication}{SecurityTrails API Key}.
See \code{\link[=trails_api_key]{trails_api_key()}}.}
}
\description{
Search Domain (Filter strings)
}
\note{
use the \code{pages} list element to determine if you need to call this function
again to retrieve more results from the result set.
}
\examples{
st_domain_search(apex_domain = "stackoverflow.com")
}
\references{
\href{https://docs.securitytrails.com/v1.0/reference#search}{Search filters}
}
