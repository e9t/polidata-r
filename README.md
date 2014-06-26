# polr

Political data interface in R.

## Usage

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
