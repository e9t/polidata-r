#' Initialize PolR
#'
#' @export

InitPolr <- function() {

    getApiKey <- function(apiSource) {
        apiKey <- getOption(sprintf("polr%sKey", apiSource))
        if(is.null(apiKey)) apiKey <- ""
        return(apiKey)
    }

    setApiKey <- function(apiSource) {
        apiKey = readline(sprintf("Enter %s API key: ", apiSource))
        eval(parse(text=sprintf("options(polr%sKey='%s')", apiSource, apiKey)))
    }

    promptApiKey <- function(apiSource, apiKey) {
        prompt <- sprintf("Is %s API key \"%s\" (y/n)? ", apiSource, apiKey)
        reply <- readline(prompt)
        if(reply=="n") {
            setApiKey(apiSource)
        }
        return(reply)
    }

    isValidReply <- function(reply) {
        return(is.element(reply, c("y", "n")))
    }


    for(apiSource in apiSources) {
        reply <- ""
        apiKey <- getApiKey(apiSource)
        while(!isValidReply(reply)) {
            reply <- promptApiKey(apiSource, apiKey)
        }
    }

    ShowAPIKeys()
    cat("API setting complete.")
}
