
[![Travis-CI Build
Status](https://travis-ci.org/hrbrmstr/securitytrails.svg?branch=master)](https://travis-ci.org/hrbrmstr/securitytrails)
[![Coverage
Status](https://codecov.io/gh/hrbrmstr/securitytrails/branch/master/graph/badge.svg)](https://codecov.io/gh/hrbrmstr/securitytrails)
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/securitytrails)](https://cran.r-project.org/package=securitytrails)

# securitytrails

Tools to Query the
‘[SecurityTrails](https://securitytrails.com/corp/api)’ ‘API’

## Description

‘[SecurityTrails](https://securitytrails.com/corp/api)’
(\<securitytrails.com\>) offers an ‘API’ to query information about
domains, ‘IP’ addresses, hostnames and more. Methods are provided to
query ‘SecurityTrails’ ‘API’ endpoints.

## What’s Inside The Tin

  - `st_assoc_domains`: Find associated domains
  - `st_dns_history`: DNS history by record type
  - `st_domain`: Get Domain
  - `st_domain_search`: Search Domain (Filter strings)
  - `st_explore_ips`: Explore IPs
  - `st_ping`: Test Access To the SecurityTrails API
  - `st_subdomains`: List Subdomains
  - `st_tags`: List Tags
  - `st_whois`: Get WHOIS
  - `st_whois_history`: WHOIS history by domain
  - `trails_api_key`: Get or set `SECURITYTRAILS_API_KEY` value

The following functions are implemented:

## Installation

``` r
devtools::install_git("https://gitlab.com/hrbrmstr/securitytrails.git")
# or
devtools::install_github("hrbrmstr/securitytrails")
```

## Usage

``` r
library(securitytrails)

# current version
packageVersion("securitytrails")
## [1] '0.1.0'
```

## securitytrails Metrics

| Lang | \# Files |  (%) | LoC |  (%) | Blank lines | (%) | \# Lines |  (%) |
| :--- | -------: | ---: | --: | ---: | ----------: | --: | -------: | ---: |
| R    |       16 | 0.94 | 155 | 0.96 |          71 | 0.8 |      199 | 0.83 |
| Rmd  |        1 | 0.06 |   7 | 0.04 |          18 | 0.2 |       41 | 0.17 |

## Code of Conduct

Please note that this project is released with a [Contributor Code of
Conduct](CONDUCT.md). By participating in this project you agree to
abide by its terms.
