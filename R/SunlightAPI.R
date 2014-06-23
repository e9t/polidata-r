#' R interface for Sunlight API
#'
#' See \url{(https://sunlightlabs.github.io/congress/)}
#'
#' @export

SunlightAPI <- function(method, region="korea", key=getOption("polrSunlightKey")) {
    # TODO: auto navigate pages
    # TODO: get API key with `getOption`
    apiSource   <- "sunlight"
    apiInfo     <- eval(parse(text=sprintf("api$%s", apiSource)))
    #apiVersion  <- NULL

    MethodInAPI(apiSource, method)

    baseurl <- paste(apiInfo$url, method, sep="/")
    # TODO: get multiple args
    args <- sprintf("apikey=%s", key)
    url <- paste(baseurl, args, sep="?")
    print(url)
    # TODO: convert request elements' encoding
    response <- jsonlite::fromJSON(url)

    return(response$items)
}
