module Tests exposing (..)

import Test exposing (..)
import TypesTest


all : Test
all =
    describe "Weather"
        [ TypesTest.all
        ]
