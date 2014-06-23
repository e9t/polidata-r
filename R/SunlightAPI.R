#' R interface for Sunlight API
#'
#' See \url{(https://sunlightlabs.github.io/congress/)}
#'
#' @export

SunlightAPI <- function(method, region="korea", key=getOption("polrSunlightKey")) {
    # TODO: auto navigate pages
    # TODO: get API key with `getOption`
    apiSource   <- "sunlight"
    apiAttrs    <- eval(parse(text=sprintf("apiInfo$%s", apiSource)))
    #apiVersion  <- NULL

    MethodInAPI(apiSource, method)

    baseurl <- paste(apiAttrs$url, method, sep="/")
    # TODO: get multiple args
    args <- sprintf("apikey=%s", key)
    url <- paste(baseurl, args, sep="?")
    # TODO: convert request elements' encoding
    response <- jsonlite::fromJSON(url)

    return(response$results)
}
