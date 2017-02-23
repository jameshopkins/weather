module Types exposing (..)

import Json.Decode exposing (..)
import Date exposing (Date, fromTime)
import String
import Time exposing (Time)


type alias Day =
    List TimeSegment


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
    { date : Date
    , main : Foo
    , weather : List Weather
    , clouds : Clouds
    , wind : Wind
    }


date : Decoder Date.Date
date =
    float
        |> andThen
            (((*) 1000) >> fromTime >> succeed)


timeSegment : Decoder TimeSegment
timeSegment =
    map5 TimeSegment
        (field "dt" date)
        (field "main" foo)
        (field "weather" (list weather))
        (field "clouds" clouds)
        (field "wind" wind)


type alias Location =
    { name : String
    , country : String
    }


location : Decoder Location
location =
    map2 Location
        (field "name" string)
        (field "country" string)


type alias Forecast =
    { forecast : List TimeSegment
    , location : Location
    }


forecast : Decoder Forecast
forecast =
    map2 Forecast
        (field "list" (list timeSegment))
        (field "city" location)


parse : Decoder a -> String -> Result String a
parse =
    decodeString
