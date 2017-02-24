module Tests exposing (..)

import Test exposing (..)
import RemoteDataTest


all : Test
all =
    describe "Weather"
        [ RemoteDataTest.all
        ]
