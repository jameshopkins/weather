module Views exposing (manageForecast)

import Html exposing (..)
import Model exposing (Broadcast(..))
import Types exposing (Day, Forecast, Location)


location : Location -> Html msg
location location =
    div []
        [ h1 [] [ Html.text location.name ]
        , p [] [ Html.text location.country ]
        ]


type alias Foo =
    { location : Location
    , forecast : List Day
    }


forecast : Foo -> Html msg
forecast forecast =
    div []
        [ location forecast.location
        , div [] [ Html.text (toString forecast.forecast) ]
        ]


manageForecast : Broadcast -> Html msg
manageForecast status =
    case status of
        NotAsked ->
            p [] [ Html.text "Waiting for a submission!" ]

        Loading ->
            p [] [ Html.text "Loading!" ]

        Failure ->
            p [] [ Html.text "Whoops! Something went wrong!" ]

        Success fc ->
            forecast fc
