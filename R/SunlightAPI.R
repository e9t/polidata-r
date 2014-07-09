#' R interface for Sunlight API
#'
#' See \url{(https://sunlightlabs.github.io/congress/)}
#'
#' @import jsonlite
#' @export
#' @param method method to call
#' @param key API key
#' @keywords API
#' @seealso \code{\link{GoogleAPI}}, \code{\link{PopongAP}}
#'
#' @examples
#'

SunlightAPI <- function(method, key=getOption("polrSunlightKey")) {
    # TODO: auto navigate pages
    # TODO: get API key with `getOption`
    apiSource   <- "sunlight"
    apiAttrs    <- eval(parse(text=sprintf("apiInfo$%s", apiSource)))

    MethodInAPI(apiSource, method)

    paths <- c(apiAttrs$url, method)
    query <- list("apikey"=key)
    url   <- FormatURL(paths, query)
    # TODO: convert request elements' encoding
    response <- jsonlite::fromJSON(url)

    return(response$results)
}
