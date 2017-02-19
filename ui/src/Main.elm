module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http exposing (..)
import Message exposing (Message(..))
import Model exposing (Model, Broadcast(..))
import Types exposing (forecast, Forecast)


main : Program Never Model Message
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }


getWeather : String -> Cmd Message
getWeather query =
    let
        url =
            "http://localhost:3000/api?location=" ++ query
    in
        send Receive (get url forecast)


init : ( Model, Cmd Message )
init =
    ( Model "" NotAsked, Cmd.none )


update : Message -> Model -> ( Model, Cmd Message )
update msg model =
    case msg of
        UpdateQuery str ->
            ( { model | query = str }, Cmd.none )

        Fetch ->
            ( { model | forecast = Loading }, getWeather model.query )

        Receive (Ok forecast) ->
            ( { model | forecast = Success forecast }, Cmd.none )

        Receive (Err _) ->
            ( { model | forecast = Failure }, Cmd.none )


renderForecast : Broadcast -> Html msg
renderForecast status =
    case status of
        NotAsked ->
            p [] [ Html.text "Waiting for a submission!" ]

        Loading ->
            p [] [ Html.text "Loadng!" ]

        Failure ->
            p [] [ Html.text "Whoops! Something went wrong!" ]

        Success forecast ->
            p [] [ Html.text (toString forecast) ]


view : Model -> Html Message
view model =
    div [ class "name" ]
        [ button
            [ onClick Fetch ]
            [ Html.text "Naughty" ]
        , input
            [ type_ "text"
            , onInput UpdateQuery
            ]
            []
        , p [] [ Html.text model.query ]
        , renderForecast model.forecast
        ]
