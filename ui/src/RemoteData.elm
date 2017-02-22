module RemoteData exposing (..)

import Types exposing (Forecast, TimeSegment)


type alias Formatted =
    List TimeSegment


formatResponse : List TimeSegment -> List (List TimeSegment)
formatResponse segments =
    [ segments ]
