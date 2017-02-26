module Views exposing (manageForecast)

import Html exposing (..)
import Html.Attributes exposing (alt, colspan, src)
import Model exposing (Broadcast(..))
import Types exposing (Day, Location, TimeSegment, WeatherForecast)
import Date exposing (Date)
import Temperature.Convert exposing (kelvinToCelsius)
import Date.Extra.Format exposing (format)
import Date.Extra.Config.Config_en_gb exposing (config)


formatDate : String -> Date -> String
formatDate formatStr date =
    format config formatStr date


location : Location -> Html msg
location location =
    div []
        [ h1 [] [ Html.text location.name ]
        , p [] [ Html.text location.country ]
        ]


timeSegment : TimeSegment -> Html msg
timeSegment segment =
    tr []
        [ td [] [ formatDate "%-I:%M %p" segment.time |> Html.text ]
        , td []
            [ Html.text segment.description
            , img
                [ src ("http://openweathermap.org/img/w/" ++ segment.icon ++ ".png")
                , alt (segment.overall ++ " icon")
                ]
                []
            ]
        , td []
            [ kelvinToCelsius segment.temp
                |> round
                |> toString
                |> Html.text
            ]
        , td [] [ segment.humidity |> toString |> Html.text ]
        , td [] [ segment.pressure |> toString |> Html.text ]
        ]


day : Day -> Html msg
day day =
    div []
        [ h2 [] [ formatDate "%-d/%m/%Y" day.day |> Html.text ]
        , table []
            [ thead []
                [ tr []
                    [ th [] [ Html.text "Time" ]
                    , th [ colspan 4 ] [ Html.text "Weather" ]
                    ]
                , tr []
                    [ th [] []
                    , th [] [ Html.text "Overall" ]
                    , th [] [ Html.text "Temperature" ]
                    , th [] [ Html.text "Humidity" ]
                    , th [] [ Html.text "Pressure" ]
                    ]
                ]
            , tbody [] <| List.map timeSegment day.segments
            ]
        ]


forecast : WeatherForecast -> Html msg
forecast forecast =
    div []
        [ location forecast.location
        , div [] <| List.map day forecast.forecast
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
