module Components exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput, onSubmit)
import Flags exposing (Location, Locations)
import List exposing (filterMap)
import String exposing (contains, toLower)


searchQuery : (String -> msg) -> (String -> msg) -> String -> Html msg
searchQuery updateQuery fetch query =
    Html.form [ onSubmit (fetch "Foo") ]
        [ label [ for "query" ] [ Html.text "City " ]
        , input [ id "query", onInput updateQuery ] []
        , span []
            [ button [ type_ "submit" ] [ Html.text "Get weather" ] ]
        , p [] [ Html.text query ]
        ]


layout : List (Html msg) -> Html msg
layout children =
    div [ class "app" ] children


narrowSearch : (String -> msg) -> String -> Location -> Maybe (Html msg)
narrowSearch fetch query location =
    if contains (toLower query) (toLower location.city) then
        Just (li [ onClick (fetch location.ll) ] [ Html.text location.city ])
    else
        Nothing


searchResults : Locations -> (String -> msg) -> String -> Html msg
searchResults locations fetch query =
    ul [] <| filterMap (narrowSearch fetch query) locations
