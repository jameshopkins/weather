port module Rounds exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http exposing (..)
import Message exposing (Message(..))
import Model exposing (Model, emptyModel)
import Types exposing (forecast, Forecast)


main : Program (Maybe Model) Model Message
main =
    Html.programWithFlags
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }


getWeather : Cmd Message
getWeather =
    let
        url =
            "http://samples.openweathermap.org/data/2.5/forecast?q=London&appid=b1b15e88fa797225412429c1c50c122a1"
    in
        send WeatherForecast (get url forecast)


init : Maybe Model -> ( Model, Cmd Message )
init savedModel =
    Maybe.withDefault emptyModel savedModel ! []


update : Message -> Model -> ( Model, Cmd Message )
update msg model =
    case msg of
        UpdateQuery str ->
            ( { model | query = str }, Cmd.none )

        MorePlease ->
            ( { model | query = "naughty" }, getWeather )

        WeatherForecast (Ok fc) ->
            ( { model | forecast = Just fc }, Cmd.none )

        WeatherForecast (Err _) ->
            ( model, Cmd.none )


view : Model -> Html Message
view model =
    div [ class "name" ]
        [ button
            [ onClick MorePlease ]
            [ Html.text "Naughty" ]
        , input
            [ type_ "text"
            , onInput UpdateQuery
            ]
            []
        , p [] [ Html.text model.query ]
        ]
