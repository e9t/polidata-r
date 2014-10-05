#' R interface for Popong API
#'
#' See \url{(http://data.popong.com)}
#'
#' @import jsonlite RCurl
#' @export
#' @param method Method to call
#' @param search Search term for names
#' @param getSummary Toggle to get summary data
#' @param key API key
#' @param debug Enable debugging mode
#' @keywords API
#' @seealso \code{\link{GoogleAPI}}, \code{\link{SunlightAPI}}
#'

PopongAPI <- function(method, search=NULL, pages=1, pageSize=20, getSummary=FALSE, key=getOption("PopongAPIKey"), debug=FALSE) {
    apiSource   <- "popong"
    apiAttrs    <- eval(parse(text=sprintf("apiInfo$%s", apiSource)))
    apiVersion  <- paste0("v", apiAttrs$version)

    MethodInAPI(apiSource, method)

    if(is.null(search)) {
        paths <- c(apiAttrs$url, apiVersion, method, "")
        query <- list("api_key"=key)
    } else {
        paths <- c(apiAttrs$url, apiVersion, method, "search")
        query <- list("api_key"=key, "q"=search)
    }

    itemlist <- list()
    if(length(pages)>10) {
        query <- c(query, "per_page"=200)
        npages <- tail(pages, 1) - pages[1] + 1
        pages <- ceiling(npages/10)
    }
    for(page in pages) {
        cat(sprintf("Got page %s (n=%s)\n", page, pageSize))
        query    <- c(query, "page"=page, "per_page"=pageSize)
        url      <- FormatURL(paths, query)
        jsontext <- RCurl::getURL(url)
        response <- jsonlite::fromJSON(jsontext)
        if(debug) { print(url) }
        if(!(getSummary)) { response$items$summary <- NULL }
        itemlist[[page]] <- response$items
    }

    items = do.call(rbind, itemlist)
    return(items)
}
