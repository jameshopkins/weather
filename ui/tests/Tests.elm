module Tests exposing (..)

import Test exposing (..)
import RemoteDataTest
import FlagsTest


all : Test
all =
    describe "Weather"
        [ RemoteDataTest.all
        , FlagsTest.all
        ]
