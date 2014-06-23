.apiJson <- system.file("extdata", "api.json", package="polR")


#' @export apiInfo
apiInfo <- jsonlite::fromJSON(.apiJson)


apiSources <- sapply(ls(apiInfo), Capitalize)


GetAPIKey <- function(apiSource) {
    apiKey <- getOption(sprintf("polr%sKey", apiSource))
    if(is.null(apiKey)) apiKey <- ""
    return(apiKey)
}


MethodInAPI <- function(apiSource, method) {
    .methods <- eval(parse(text=sprintf("apiInfo$%s$methods", apiSource)))[[1]]
    if(!(is.element(method, .methods))) {
        stop("Please check the method name.")
    }
}


SetAPIKey <- function(apiSource) {
    apiKey = readline(sprintf("Enter %s API key: ", apiSource))
    eval(parse(text=sprintf("options(polr%sKey='%s')", apiSource, apiKey)))
}


#' Show API Keys
#'
#' @export ShowAPIKeys
ShowAPIKeys <- function() {
    for(apiSource in apiSources) {
        cat(sprintf("%s API key: \"%s\"\n", apiSource, GetAPIKey(apiSource)))
    }
}


PromptAPIKey <- function(apiSource, apiKey) {
    prompt <- sprintf("Is %s API key \"%s\" (y/n)? ", apiSource, apiKey)
    reply <- readline(prompt)
    if(reply=="n") {
        SetAPIKey(apiSource)
    }
    return(reply)
}
