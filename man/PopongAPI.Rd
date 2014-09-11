\name{PopongAPI}
\alias{PopongAPI}
\title{R interface for Popong API}
\usage{
PopongAPI(method, search = NULL, pages = 1, pageSize = 20,
  getSummary = FALSE, key = getOption("PopongAPIKey"), debug = FALSE)
}
\arguments{
  \item{method}{Method to call}

  \item{search}{Search term for names}

  \item{pages}{Number of pages to retrieve}

  \item{getSummary}{Toggle to get summary data}

  \item{key}{API key}

  \item{debug}{Enable debugging mode}
}
\description{
See \url{(http://data.popong.com)}
}
\seealso{
\code{\link{GoogleAPI}}, \code{\link{SunlightAPI}}
}
\keyword{API}

