module Fixtures.RemoteData exposing (..)

import Types exposing (Forecast, TimeSegment)


expect : List (List TimeSegment)
expect =
    [ [ { date = 1485802064
        , main =
            { temp = 261.45
            , tempMin = 259.086
            , tempMax = 261.45
            , pressure = 1023.48
            , seaLevel = 1045.39
            , grndLevel = 1023.48
            , humidity = 79
            , tempKf = 2.37
            }
        , weather =
            [ { id = 800
              , main = "Clear"
              , description = "clear sky"
              , icon = "02n"
              }
            ]
        , clouds =
            { all = 8
            }
        , wind =
            { speed = 4.77
            , deg = 232.505
            }
        }
      , { date = 1485812864
        , main =
            { temp = 200.45
            , tempMin = 259.086
            , tempMax = 261.45
            , pressure = 113.48
            , seaLevel = 1045.39
            , grndLevel = 1023.48
            , humidity = 80
            , tempKf = 2.37
            }
        , weather =
            [ { id = 8009
              , main = "Misty"
              , description = "It's going to be a misty one!"
              , icon = "02n"
              }
            ]
        , clouds =
            { all = 100000
            }
        , wind =
            { speed = 6.77
            , deg = 290.505
            }
        }
      ]
    , [ { date = 1485841664
        , main =
            { temp = 200.45
            , tempMin = 259.086
            , tempMax = 261.45
            , pressure = 113.48
            , seaLevel = 1045.39
            , grndLevel = 1023.48
            , humidity = 80
            , tempKf = 2.37
            }
        , weather =
            [ { id = 8009
              , main = "Misty"
              , description = "It's going to be a misty one!"
              , icon = "02n"
              }
            ]
        , clouds =
            { all = 100000
            }
        , wind =
            { speed = 6.77
            , deg = 290.505
            }
        }
      , { date = 1485859664
        , main =
            { temp = 200.45
            , tempMin = 259.086
            , tempMax = 261.45
            , pressure = 113.48
            , seaLevel = 1045.39
            , grndLevel = 1023.48
            , humidity = 80
            , tempKf = 2.37
            }
        , weather =
            [ { id = 8009
              , main = "Misty"
              , description = "It's going to be a misty one!"
              , icon = "02n"
              }
            ]
        , clouds =
            { all = 100000
            }
        , wind =
            { speed = 6.77
            , deg = 290.505
            }
        }
      ]
    , [ { date = 1485928064
        , main =
            { temp = 200.45
            , tempMin = 259.086
            , tempMax = 261.45
            , pressure = 113.48
            , seaLevel = 1045.39
            , grndLevel = 1023.48
            , humidity = 80
            , tempKf = 2.37
            }
        , weather =
            [ { id = 8009
              , main = "Misty"
              , description = "It's going to be a misty one!"
              , icon = "02n"
              }
            ]
        , clouds =
            { all = 100000
            }
        , wind =
            { speed = 6.77
            , deg = 290.505
            }
        }
      ]
    ]
