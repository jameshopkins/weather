module Tests exposing (..)

import Test exposing (..)
import TypesTest
import RemoteDataTest


all : Test
all =
    describe "Weather"
        [ TypesTest.all
        , RemoteDataTest.all
        ]
