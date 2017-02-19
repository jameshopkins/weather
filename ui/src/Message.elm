module Message exposing (..)

import Http exposing (Error)
import Types exposing (Forecast)


type Message
    = UpdateQuery String
    | Fetch
    | Receive (Result Error Forecast)
