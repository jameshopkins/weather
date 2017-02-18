module Types exposing (..)

import Json.Decode exposing (..)


type alias Foo =
    { temp : Float
    , tempMin : Float
    , tempMax : Float
    , pressure : Float
    , seaLevel : Float
    , grndLevel : Float
    , humidity : Int
    , tempKf : Float
    }


foo : Decoder Foo
foo =
    map8 Foo
        (field "temp" float)
        (field "temp_min" float)
        (field "temp_max" float)
        (field "pressure" float)
        (field "sea_level" float)
        (field "grnd_level" float)
        (field "humidity" int)
        (field "temp_kf" float)


type alias Weather =
    { id : Int
    , main : String
    , description : String
    , icon : String
    }


weather : Decoder Weather
weather =
    map4 Weather
        (field "id" int)
        (field "main" string)
        (field "description" string)
        (field "icon" string)


type alias Clouds =
    { all : Float }


clouds : Decoder Clouds
clouds =
    map Clouds
        (field "all" float)


type alias Wind =
    { speed : Float
    , deg : Float
    }


wind : Decoder Wind
wind =
    map2 Wind
        (field "speed" float)
        (field "deg" float)


type alias TimeSegment =
    { date : Int
    , main : Foo
    , weather : List Weather
    , clouds : Clouds
    , wind : Wind
    }


timeSegment : Decoder TimeSegment
timeSegment =
    map5 TimeSegment
        (field "dt" int)
        (field "main" foo)
        (field "weather" (list weather))
        (field "clouds" clouds)
        (field "wind" wind)


type alias Forecast =
    List TimeSegment


forecast : Decoder Forecast
forecast =
    field "list" (list timeSegment)


parse : Decoder a -> String -> Result String a
parse =
    decodeString
