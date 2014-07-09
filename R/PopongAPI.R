#' R interface for Popong API
#'
#' See \url{(http://data.popong.com)}
#'
#' @import jsonlite RCurl
#' @export
#' @param method method to call
#' @param key API key
#' @param debug Enable debugging mode
#' @keywords API
#' @seealso \code{\link{GoogleAPI}}, \code{\link{SunlightAPI}}
#'

PopongAPI <- function(method, key=getOption("polrPopongKey"), debug=FALSE) {
    # TODO: auto navigate pages
    # TODO: get API key with `getOption`
    apiSource   <- "popong"
    apiAttrs    <- eval(parse(text=sprintf("apiInfo$%s", apiSource)))
    apiVersion  <- paste0("v", apiAttrs$version)

    MethodInAPI(apiSource, method)

    paths <- c(apiAttrs$url, apiVersion, method, "")
    query  <- list("api_key"=key)
    url   <- FormatURL(paths, query)
    jsontext <- RCurl::getURL(url)
    response <- jsonlite::fromJSON(jsontext)
    if(debug) { print(url) }

    return(response$items)
}
