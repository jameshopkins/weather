module Model exposing (..)

import Types exposing (Day, Forecast, Location)


type alias Foo =
    { location : Location
    , forecast : List Day
    }


type Broadcast
    = NotAsked
    | Loading
    | Failure
    | Success Foo


type alias Model =
    { query : String
    , forecast : Broadcast
    }
