module Types exposing (..)

import String
import Date exposing (Date)


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


type alias Weather =
    { id : Int
    , main : String
    , description : String
    , icon : String
    }


type alias Clouds =
    { all : Float }


type alias Wind =
    { speed : Float
    , deg : Float
    }


type alias TimeSegment =
    { date : Date
    , main : Foo
    , weather : List Weather
    , clouds : Clouds
    , wind : Wind
    }


type alias Location =
    { name : String
    , country : String
    }


type alias WeatherForecastFormatted =
    { forecast : List Day
    , location : Location
    }


type alias WeatherForecastUnformatted =
    { forecast : List TimeSegment
    , location : Location
    }
