module Main exposing (..)

import Html exposing (..)
import Http exposing (..)
import Components exposing (layout, query)
import Message exposing (Message(..))
import Model exposing (Model, Broadcast(..))
import Types exposing (Weather, Location)
import Views exposing (manageForecast)
import RemoteData exposing (forecast, formatResponse)


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
            ( { model | forecast = Success (formatResponse forecast) }, Cmd.none )

        Receive (Err _) ->
            ( { model | forecast = Failure }, Cmd.none )


view : Model -> Html Message
view model =
    layout
        [ query UpdateQuery Fetch model.query
        , manageForecast model.forecast
        ]
