module RemoteData exposing (..)

import Date exposing (Date)
import Date.Extra.Format exposing (format, isoDateFormat)
import Date.Extra.Config.Config_en_gb exposing (config)
import Types exposing (Day, Location, TimeSegment, WeatherForecast)
import List.Extra exposing (groupWhile)
import Json.Decode exposing (..)
import Date exposing (Date, fromString)


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


location : Decoder Location
location =
    map2 Location
        (field "name" string)
        (field "country" string)


forecast : Decoder WeatherForecast
forecast =
    map2 WeatherForecast
        (field "forecast" (list day))
        (field "location" location)


decodeResponse : Decoder a -> String -> Result String a
decodeResponse =
    decodeString
