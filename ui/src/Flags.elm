module Flags exposing (..)

import Json.Decode exposing (..)


-- Types


type alias Location =
    { city : String
    , ll : String
    }


type alias Locations =
    List Location


type alias Flags =
    { locations : String }



-- Decoders


location : Decoder Location
location =
    map2 Location
        (field "city" string)
        (field "ll" string)


locations : Decoder Locations
locations =
    list location


decodeResponse : Decoder a -> String -> Result String a
decodeResponse =
    decodeString
