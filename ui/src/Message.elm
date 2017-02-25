module Message exposing (..)

import Http exposing (Error)
import Types exposing (WeatherForecast)


type Message
    = UpdateQuery String
    | Fetch
    | Receive (Result Error WeatherForecast)
