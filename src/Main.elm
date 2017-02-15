port module Rounds exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Message exposing (Message(..))
import Model exposing (Model, emptyModel)


main : Program (Maybe Model) Model Message
main =
    Html.programWithFlags
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }


init : Maybe Model -> ( Model, Cmd Message )
init savedModel =
    Maybe.withDefault emptyModel savedModel ! []


update : Message -> Model -> ( Model, Cmd Message )
update msg model =
    case msg of
        UpdateQuery str ->
            ( { model | query = str }, Cmd.none )


view : Model -> Html Message
view model =
    div [ class "name" ]
        [ input
            [ type_ "text"
            , onInput UpdateQuery
            ]
            []
        , p [] [ Html.text model.query ]
        ]
