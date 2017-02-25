module RemoteDataTest exposing (all)

import Test exposing (..)
import TestHelpers exposing (equalityTests)
import Fixtures.RemoteData exposing (expected, responseJson)
import RemoteData exposing (decodeResponse, forecast)
import Expect


all : Test
all =
    describe "Remote Data"
        [ describe "Parsing A Response"
            (equalityTests
                [ { description = "decodes a response"
                  , output = (decodeResponse forecast responseJson)
                  , expected = Ok expected
                  }
                ]
            )
        ]
