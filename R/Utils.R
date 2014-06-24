Capitalize <- function(x) {
    s <- strsplit(x, " ")[[1]]
    paste(toupper(substring(s, 1, 1)), substring(s, 2), sep = "", collapse = " ")
}

FormatURL <- function(paths, args) {
    pathstr <- paste(paths, collapse="/")
    argstr <- paste(names(args), args, sep="=", collapse="&")
    url <- paste(pathstr, argstr, sep="?")
    return (url)
}

IsValidReply <- function(reply) {
    return(is.element(reply, c("y", "n")))
}
