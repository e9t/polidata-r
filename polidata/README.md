# polidata

Political data. In R.
This package provides easy access to various political data APIs.

## Install

1. Get API keys.

    - [Google Civic API](https://developers.google.com/civic-information/docs/using_api)
    - [Sunlight Congress API](http://sunlightfoundation.com/api/accounts/register/)

2. Install `polidata`
    - Option 1: Install from CRAN

            install.packages("polidata")

    - Option 2: Install from source

            install.packages("/path/to/polidata", type="source", repos=NULL)

## Usage

Import `polidata`, and initialize with API keys.

    library("polidata")
    InitPolidata()

> To set an individual API key, `options(GoogleAPIKey='some_key')`

Call API with method type.

    PopongAPI("bill")
    PopongAPI("party")
    PopongAPI("person")
    SunlightAPI("legislators")
    SunlightAPI("committees")
    SunlightAPI("bills")
    SunlightAPI("votes")

## License

MIT
