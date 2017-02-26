module Model exposing (..)

import RemoteData exposing (WeatherForecast)


type Broadcast
    = NotAsked
    | Loading
    | HttpFailure
    | HttpSuccess WeatherForecast


type alias Model =
    { query : String
    , forecast : Broadcast
    , locations : String
    }
