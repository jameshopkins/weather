module Types exposing (..)

import String
import Date exposing (Date)


type alias Day =
    { day : Date
    , segments : List TimeSegment
    }


type alias TimeSegment =
    { time : Date
    , temp : Float
    , pressure : Float
    , humidity : Int
    , overall : String
    , description : String
    , icon : String
    }


type alias Location =
    { name : String
    , country : String
    }


type alias WeatherForecast =
    { forecast : List Day
    , location : Location
    }
