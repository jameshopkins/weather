module RemoteData exposing (..)

import Date exposing (Date)
import Date.Extra.Format exposing (format, isoDateFormat)
import Date.Extra.Config.Config_en_gb exposing (config)
import List.Extra exposing (groupWhile)
import Json.Decode exposing (..)
import Date exposing (Date, fromString)


-- Types


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


type alias City =
    { name : String
    , country : String
    }


type alias WeatherForecast =
    { forecast : List Day
    , location : City
    }



-- Formatters


formatIsoDate : Date -> String
formatIsoDate date =
    format config isoDateFormat date


isSameDay : Date -> Date -> Bool
isSameDay x y =
    (formatIsoDate x) == (formatIsoDate y)



-- Decoders


stringToDate : Decoder Date
stringToDate =
    string
        |> andThen
            (\val ->
                case fromString val of
                    Err err ->
                        fail err

                    Ok ms ->
                        succeed <| ms
            )


timeSegment : Decoder TimeSegment
timeSegment =
    map7 TimeSegment
        (field "time" stringToDate)
        (field "temp" float)
        (field "pressure" float)
        (field "humidity" int)
        (field "overall" string)
        (field "description" string)
        (field "icon" string)


day : Decoder Day
day =
    map2 Day
        (field "day" stringToDate)
        (field "segments" (list timeSegment))


city : Decoder City
city =
    map2 City
        (field "name" string)
        (field "country" string)


forecast : Decoder WeatherForecast
forecast =
    map2 WeatherForecast
        (field "forecast" (list day))
        (field "location" city)


decodeResponse : Decoder a -> String -> Result String a
decodeResponse =
    decodeString
