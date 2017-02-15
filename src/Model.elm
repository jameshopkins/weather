module Model exposing (..)


type alias Model =
    { query : String
    }


emptyModel : Model
emptyModel =
    { query = ""
    }
