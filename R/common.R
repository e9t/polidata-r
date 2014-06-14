#' @export api

.apiJson <- system.file("extdata", "api.json", package="polR")

api <- jsonlite::fromJSON(.apiJson)
apiSources <- sapply(ls(api), .Capitalize)
