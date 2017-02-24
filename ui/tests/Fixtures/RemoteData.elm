module Fixtures.RemoteData exposing (..)

import Types exposing (Day, WeatherForecastUnformatted, Location, TimeSegment)
import Date exposing (fromTime)


formattedExpect :
    { location : Location
    , forecast : List Day
    }
formattedExpect =
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


parsedExpect : WeatherForecastUnformatted
parsedExpect =
    { location =
        { name = "London"
        , country = "GB"
        }
    , forecast =
        [ { date = fromTime 1485755750000
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
        , { date = fromTime 1485849350000
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
        , { date = fromTime 1485960950000
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
    }


responseJson : String
responseJson =
    """
{
  "cod": 200,
  "message": "0.0036",
  "cnt": "40",
  "city": {
    "name": "London",
    "country": "GB"
  },
  "list": [{
     "dt": 1485755750,
     "main": {
       "temp": 261.45,
       "temp_min": 259.086,
       "temp_max": 261.45,
       "pressure": 1023.48,
       "sea_level": 1045.39,
       "grnd_level": 1023.48,
       "humidity": 79,
       "temp_kf": 2.37
     },
     "weather": [
       {
         "id": 800,
         "main": "Clear",
         "description": "clear sky",
         "icon": "02n"
       }
     ],
      "clouds": {
        "all": 8
      },
      "wind": {
        "speed": 4.77,
        "deg": 232.505
      },
      "snow": { "3h": 12.9 },
      "sys": {
        "pod": "n"
      },
     "dt_txt": "2017-01-30 18:00:00"
  }, {
     "dt": 1485773750,
     "main": {
       "temp": 200.45,
       "temp_min": 259.086,
       "temp_max": 261.45,
       "pressure": 113.48,
       "sea_level": 1045.39,
       "grnd_level": 1023.48,
       "humidity": 80,
       "temp_kf": 2.37
     },
     "weather": [
       {
         "id": 8009,
         "main": "Misty",
         "description": "It's going to be a misty one!",
         "icon": "02n"
       }
     ],
      "clouds": {
        "all": 100000
      },
      "wind": {
        "speed": 6.77,
        "deg": 290.505
      },
      "snow": { },
      "rain": { "3h": 9.12 },
      "sys": {
        "pod": "z"
      },
     "dt_txt": "2017-01-30 20:00:00"
  }, {
     "dt": 1485849350,
     "main": {
       "temp": 200.45,
       "temp_min": 259.086,
       "temp_max": 261.45,
       "pressure": 113.48,
       "sea_level": 1045.39,
       "grnd_level": 1023.48,
       "humidity": 80,
       "temp_kf": 2.37
     },
     "weather": [
       {
         "id": 8009,
         "main": "Misty",
         "description": "It's going to be a misty one!",
         "icon": "02n"
       }
     ],
      "clouds": {
        "all": 100000
      },
      "wind": {
        "speed": 6.77,
        "deg": 290.505
      },
      "snow": { },
      "rain": { "3h": 9.12 },
      "sys": {
        "pod": "z"
      },
     "dt_txt": "2017-01-30 20:00:00"
  }, {
     "dt": 1485867350,
     "main": {
       "temp": 200.45,
       "temp_min": 259.086,
       "temp_max": 261.45,
       "pressure": 113.48,
       "sea_level": 1045.39,
       "grnd_level": 1023.48,
       "humidity": 80,
       "temp_kf": 2.37
     },
     "weather": [
       {
         "id": 8009,
         "main": "Misty",
         "description": "It's going to be a misty one!",
         "icon": "02n"
       }
     ],
      "clouds": {
        "all": 100000
      },
      "wind": {
        "speed": 6.77,
        "deg": 290.505
      },
      "snow": { },
      "rain": { "3h": 9.12 },
      "sys": {
        "pod": "z"
      },
     "dt_txt": "2017-01-30 20:00:00"
  }, {
     "dt": 1485960950,
     "main": {
       "temp": 200.45,
       "temp_min": 259.086,
       "temp_max": 261.45,
       "pressure": 113.48,
       "sea_level": 1045.39,
       "grnd_level": 1023.48,
       "humidity": 80,
       "temp_kf": 2.37
     },
     "weather": [
       {
         "id": 8009,
         "main": "Misty",
         "description": "It's going to be a misty one!",
         "icon": "02n"
       }
     ],
      "clouds": {
        "all": 100000
      },
      "wind": {
        "speed": 6.77,
        "deg": 290.505
      },
      "snow": { },
      "rain": { "3h": 9.12 },
      "sys": {
        "pod": "z"
      },
     "dt_txt": "2017-01-30 20:00:00"
  }]
}
  """
