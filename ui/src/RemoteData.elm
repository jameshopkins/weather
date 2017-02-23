module RemoteData exposing (..)

import Date exposing (Date)
import Date.Extra.Format exposing (format, isoDateFormat)
import Date.Extra.Config.Config_en_gb exposing (config)
import Types exposing (Day, Location, TimeSegment)
import List.Extra exposing (groupWhile)


formatIsoDate : Date -> String
formatIsoDate date =
    format config isoDateFormat date


isSameDay : Date -> Date -> Bool
isSameDay x y =
    (formatIsoDate x) == (formatIsoDate y)


formatResponse :
    { location : Location, forecast : List TimeSegment }
    -> { location : Location
       , forecast : List Day
       }
formatResponse response =
    { response | forecast = groupWhile (\x y -> isSameDay x.date y.date) response.forecast }
