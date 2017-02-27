module Components exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput, onSubmit)
import Flags exposing (Location, Locations)
import List exposing (filterMap)
import String exposing (contains, toLower)


searchQuery : (String -> msg) -> (String -> msg) -> String -> Html msg
searchQuery updateQuery fetch query =
    div [ class "location-query" ]
        [ h1 [ class "search-locations-title" ] [ Html.text "Find your weather!" ]
        , Html.form
            [ onSubmit (fetch "Foo") ]
            [ label []
                [ input [ class "location-query-input", id "query", onInput updateQuery ] []
                , Html.text "City, country, etc"
                ]
            ]
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
    div [ class "location-results" ]
        [ ul [] <| filterMap (narrowSearch fetch query) locations
        ]
