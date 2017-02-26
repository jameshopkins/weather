module FlagsTest exposing (all)

import Test exposing (..)
import TestHelpers exposing (equalityTests)
import Fixtures.Flags exposing (expected, json)
import Flags exposing (decodeResponse, locations)
import Expect


all : Test
all =
    describe "Flags"
        [ describe "Parsing Flags"
            (equalityTests
                [ { description = "decodes the location list"
                  , output = (decodeResponse locations json)
                  , expected = Ok expected
                  }
                ]
            )
        ]
