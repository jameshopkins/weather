module Message exposing (..)

import Http exposing (Error)
import Types exposing (Forecast)


type Message
    = UpdateQuery String
    | MorePlease
    | WeatherForecast (Result Error Forecast)
