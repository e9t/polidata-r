# polR

Political data interface in R.

## Usage

Install `polR` from source.

    install.packages("/path/to/polR", type="source", repos=NULL)

Import `polR`, and initialize with API keys.

    library("polR")
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
