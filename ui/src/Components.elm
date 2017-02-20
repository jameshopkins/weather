module Components exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onSubmit)


query : (String -> msg) -> msg -> String -> Html msg
query updateQuery fetch query =
    Html.form [ onSubmit fetch ]
        [ label [ for "query" ] [ Html.text "City " ]
        , input [ id "query", onInput updateQuery ] []
        , span []
            [ button [ type_ "submit" ] [ Html.text "Get weather" ] ]
        , p [] [ Html.text query ]
        ]


layout : List (Html msg) -> Html msg
layout children =
    div [ class "app" ] children
