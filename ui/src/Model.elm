module Model exposing (..)

import Types exposing (Forecast)


type alias Model =
    { query : String
    , forecast : Maybe Forecast
    }


emptyModel : Model
emptyModel =
    { query = ""
    , forecast = Nothing
    }
