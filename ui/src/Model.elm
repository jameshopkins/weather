module Model exposing (..)

import Types exposing (Forecast)


type Broadcast
    = NotAsked
    | Loading
    | Failure
    | Success Forecast


type alias Model =
    { query : String
    , forecast : Broadcast
    }
