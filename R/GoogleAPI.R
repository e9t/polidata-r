#' R interface for Google Civic API
#'
#' See \url{(https://developers.google.com/civic-information/)}
#'
#' @export

GoogleAPI <- function(method, key=getOption("polrGoogleKey")) {
    # TODO: auto navigate pages
    # TODO: get API key with `getOption`
    apiSource   <- "google"
    apiAttrs    <- eval(parse(text=sprintf("apiInfo$%s", apiSource)))
    apiVersion  <- paste0("v", as.integer(apiAttrs$version))

    MethodInAPI(apiSource, method)

    paths <- c(apiAttrs$url, apiVersion, method)
    query  <- list("key"=key)
    url   <- FormatURL(paths, query)
    # TODO: convert request elements' encoding
    response <- jsonlite::fromJSON(url)

    return(response)
}
