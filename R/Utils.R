.Capitalize <- function(x) {
    s <- strsplit(x, " ")[[1]]
    paste(toupper(substring(s, 1, 1)), substring(s, 2), sep = "", collapse = " ")
}

.MethodInAPI <- function(apiSource, method) {
    .methods <- eval(parse(text=sprintf("api$%s$methods", "popong")))[[1]]
    if(!(is.element(method, .methods))) {
        stop("Please check the method name.")
    }
}
