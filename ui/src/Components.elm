module Components exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onSubmit)
import Flags exposing (Location, Locations)
import List exposing (filterMap)
import String exposing (contains, toLower)


searchQuery : (String -> msg) -> msg -> String -> Html msg
searchQuery updateQuery fetch query =
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


narrowSearch : String -> Location -> Maybe (Html msg)
narrowSearch query location =
    if contains (toLower query) (toLower location.city) then
        Just (li [] [ Html.text location.city ])
    else
        Nothing


searchResults : String -> Locations -> Html msg
searchResults query locations =
    ul [] <| filterMap (narrowSearch query) locations
