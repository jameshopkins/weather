module Model exposing (..)

import Types exposing (WeatherForecastFormatted)


type Broadcast
    = NotAsked
    | Loading
    | Failure
    | Success WeatherForecastFormatted


type alias Model =
    { query : String
    , forecast : Broadcast
    }
