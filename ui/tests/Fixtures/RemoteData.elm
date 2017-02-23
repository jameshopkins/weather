module Fixtures.RemoteData exposing (..)

import Types exposing (Day, Forecast, Location)
import Date exposing (fromTime)


expect :
    { location : Location
    , forecast : List Day
    }
expect =
    { location =
        { name = "London", country = "GB" }
    , forecast =
        [ [ { date = fromTime 1485755750000
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
          , { date = fromTime 1485773750000
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
        , [ { date = fromTime 1485849350000
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
          , { date = fromTime 1485867350000
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
        , [ { date = fromTime 1485960950000
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
    }
