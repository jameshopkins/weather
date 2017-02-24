module RemoteDataTest exposing (all)

import Test exposing (..)
import TestHelpers exposing (equalityTests)
import Fixtures.RemoteData exposing (formattedExpect, parsedExpect, responseJson)
import RemoteData exposing (decodeResponse, forecast, formatResponse)
import Expect


all : Test
all =
    describe "Remote Data"
        [ describe "Formatting A Response"
            (equalityTests
                [ { description = "groups the time segments into days"
                  , output = (Ok (formatResponse parsedExpect))
                  , expected = Ok formattedExpect
                  }
                ]
            )
        , describe "Parsing A Response"
            (equalityTests
                [ { description = "decodes a response"
                  , output = (decodeResponse forecast responseJson)
                  , expected = Ok parsedExpect
                  }
                ]
            )
        ]
