module TypesTest exposing (all)

import Test exposing (..)
import Fixtures.Types exposing (..)
import TestHelpers exposing (equalityTests)
import Types exposing (parse)
import Expect


all : Test
all =
    describe "Weather Types"
        [ describe "Parsing a Response"
            (equalityTests
                [ { description = "decodes a response"
                  , output = (parse Types.response responseJson)
                  , expected = Ok response
                  }
                ]
            )
        ]
