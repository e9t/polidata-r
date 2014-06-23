#' R interface for Popong API
#'
#' See \url{(http://data.popong.com)}
#'
#' @export

PopongAPI <- function(method, region="korea", key=getOption("polrPopongKey")) {
    # TODO: auto navigate pages
    # TODO: get API key with `getOption`
    apiSource   <- "popong"
    apiInfo     <- eval(parse(text=sprintf("api$%s", apiSource)))
    apiVersion  <- paste0("v", apiInfo$version)

    MethodInAPI(apiSource, method)

    baseurl <- paste(apiInfo$url, apiVersion, method, sep="/")
    # TODO: get multiple args
    args <- sprintf("api_key=%s", key)
    url <- paste(baseurl, args, sep="/?")
    # TODO: convert request elements' encoding
    response <- jsonlite::fromJSON(url)

    return(response$items)
}
