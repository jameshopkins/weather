module Message exposing (..)

import Http exposing (Error)
import Types exposing (WeatherForecastUnformatted)


type Message
    = UpdateQuery String
    | Fetch
    | Receive (Result Error WeatherForecastUnformatted)
