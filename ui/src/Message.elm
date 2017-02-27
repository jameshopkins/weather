module Message exposing (..)

import Http exposing (Error)
import RemoteData exposing (WeatherForecast)


type Message
    = ChangeLocationQuery String
    | FetchLocationWeather String
    | ReceiveLocationWeather (Result Error WeatherForecast)
