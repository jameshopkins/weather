module Main exposing (..)

import Html exposing (..)
import Http exposing (..)
import Components exposing (layout)
import Message exposing (Message(..))
import Model exposing (Model, Broadcast(..))
import Views exposing (locationSearch, manageForecast)
import RemoteData exposing (forecast)
import Flags exposing (Flags, locations)
import Json.Decode exposing (decodeString)


main : Program Flags Model Message
main =
    Html.programWithFlags
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


init : Flags -> ( Model, Cmd Message )
init flags =
    ( Model "" NotAsked flags.locations, Cmd.none )


update : Message -> Model -> ( Model, Cmd Message )
update msg model =
    case msg of
        UpdateQuery str ->
            ( { model | query = str }, Cmd.none )

        Fetch ->
            ( { model | forecast = Loading, query = "" }, getWeather model.query )

        Receive (Ok forecast) ->
            ( { model | forecast = HttpSuccess forecast }, Cmd.none )

        Receive (Err _) ->
            ( { model | forecast = HttpFailure }, Cmd.none )


view : Model -> Html Message
view model =
    layout
        [ case decodeString locations model.locations of
            Err str ->
                Html.text "Whoops! Something has gone wrong"

            Ok ls ->
                locationSearch UpdateQuery Fetch model.query ls
        , manageForecast model.forecast
        ]
