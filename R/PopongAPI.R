#' R interface for Popong API
#'
#' See \url{(http://data.popong.com)}
#'
#' @export

PopongAPI <- function(method, region="korea", key=getOption("polrPopongKey")) {
    # TODO: auto navigate pages
    # TODO: get API key with `getOption`
    apiSource   <- "popong"
    apiAttrs    <- eval(parse(text=sprintf("apiInfo$%s", apiSource)))
    apiVersion  <- paste0("v", apiAttrs$version)

    MethodInAPI(apiSource, method)

    paths <- c(apiAttrs$url, apiVersion, method)
    args  <- list("api_key"=key)
    url   <- FormatURL(paths, args)
    # TODO: convert request elements' encoding
    response <- jsonlite::fromJSON(url)

    return(response$items)
}
