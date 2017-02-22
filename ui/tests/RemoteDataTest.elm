module RemoteDataTest exposing (all)

import Test exposing (..)
import TestHelpers exposing (equalityTests)
import Fixtures.Types exposing (response)
import Fixtures.RemoteData exposing (expect)
import RemoteData exposing (formatResponse)
import Expect


all : Test
all =
    describe "Remote Data"
        [ describe "Response Formatting"
            (equalityTests
                [ { description = "groups the time segments into "
                  , output = (Ok (formatResponse response.forecast))
                  , expected = Ok expect
                  }
                ]
            )
        ]
