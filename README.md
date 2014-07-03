# polr

Political data interface in R.

## Usage

Get API keys.

- [Google Civic API](https://developers.google.com/civic-information/docs/using_api)
- [Sunlight Congress API](http://sunlightfoundation.com/api/accounts/register/)

Install `polr` from source.

    install.packages("/path/to/polr", type="source", repos=NULL)

Import `polr`, and initialize with API keys.

    library("polr")
    InitPolr()

Call API with method type.

    PopongAPI("bill")
    PopongAPI("party")
    PopongAPI("person")
    SunlightAPI("legislators")
    SunlightAPI("committees")
    SunlightAPI("bills")
    SunlightAPI("votes")

## License
[Apache Licence 2.0](http://www.apache.org/licenses/LICENSE-2.0)
