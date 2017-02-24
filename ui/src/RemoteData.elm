module RemoteData exposing (..)

import Date exposing (Date)
import Date.Extra.Format exposing (format, isoDateFormat)
import Date.Extra.Config.Config_en_gb exposing (config)
import Types exposing (Clouds, Day, Foo, Location, TimeSegment, Weather, WeatherForecastFormatted, WeatherForecastUnformatted, Wind)
import List.Extra exposing (groupWhile)
import Json.Decode exposing (..)
import Date exposing (Date, fromTime)


-- Formatters


formatIsoDate : Date -> String
formatIsoDate date =
    format config isoDateFormat date


isSameDay : Date -> Date -> Bool
isSameDay x y =
    (formatIsoDate x) == (formatIsoDate y)


formatResponse : WeatherForecastUnformatted -> WeatherForecastFormatted
formatResponse response =
    { response | forecast = groupWhile (\x y -> isSameDay x.date y.date) response.forecast }



-- Decoders


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


weather : Decoder Weather
weather =
    map4 Weather
        (field "id" int)
        (field "main" string)
        (field "description" string)
        (field "icon" string)


clouds : Decoder Clouds
clouds =
    map Clouds
        (field "all" float)


wind : Decoder Wind
wind =
    map2 Wind
        (field "speed" float)
        (field "deg" float)


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


location : Decoder Location
location =
    map2 Location
        (field "name" string)
        (field "country" string)


forecast : Decoder WeatherForecastUnformatted
forecast =
    map2 WeatherForecastUnformatted
        (field "list" (list timeSegment))
        (field "city" location)


decodeResponse : Decoder a -> String -> Result String a
decodeResponse =
    decodeString
