module Model exposing (..)

import Types exposing (WeatherForecast)


type Broadcast
    = NotAsked
    | Loading
    | Failure
    | Success WeatherForecast


type alias Model =
    { query : String
    , forecast : Broadcast
    }
