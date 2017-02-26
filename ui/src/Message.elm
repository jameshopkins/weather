module Message exposing (..)

import Http exposing (Error)
import RemoteData exposing (WeatherForecast)


type Message
    = UpdateQuery String
    | Fetch
    | Receive (Result Error WeatherForecast)
