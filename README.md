# polidata

Political data. In R.
This package provides easy access to various political data APIs.

## Usage

Get API keys.

- [Google Civic API](https://developers.google.com/civic-information/docs/using_api)
- [Sunlight Congress API](http://sunlightfoundation.com/api/accounts/register/)

Install `polidata` from source.

    install.packages("/path/to/polidata", type="source", repos=NULL)

Import `polidata`, and initialize with API keys.

    library("polidata")
    InitPolidata()

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
