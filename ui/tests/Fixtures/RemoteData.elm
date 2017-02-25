module Fixtures.RemoteData exposing (..)

import Types exposing (Day, Location, TimeSegment)
import Date exposing (fromTime)


expected :
    { location : Location
    , forecast :
        List Day
    }
expected =
    { location =
        { name = "Paris"
        , country = "FR"
        }
    , forecast =
        [ { day = fromTime 1487203200000
          , segments =
                [ { time = fromTime 1487246400000
                  , temp = 286.67
                  , pressure = 972.73
                  , humidity = 75
                  , overall = "Clear"
                  , description = "clear sky"
                  , icon = "01d"
                  }
                , { time = fromTime 1487257200000
                  , temp = 285.66
                  , pressure = 970.91
                  , humidity = 70
                  , overall = "Clear"
                  , description = "clear sky"
                  , icon = "01d"
                  }
                , { time = fromTime 1487268000000
                  , temp = 277.05
                  , pressure = 970.44
                  , humidity = 90
                  , overall = "Clear"
                  , description = "clear sky"
                  , icon = "01n"
                  }
                , { time = fromTime 1487278800000
                  , temp = 272.78
                  , pressure = 969.32
                  , humidity = 80
                  , overall = "Clear"
                  , description = "clear sky"
                  , icon = "01n"
                  }
                ]
          }
        , { day = fromTime 1487289600000
          , segments =
                [ { time = fromTime 1487289600000
                  , temp = 273.341
                  , pressure = 968.14
                  , humidity = 85
                  , overall = "Clouds"
                  , description = "broken clouds"
                  , icon = "04n"
                  }
                , { time = fromTime 1487300400000
                  , temp = 275.568
                  , pressure = 966.6
                  , humidity = 89
                  , overall = "Rain"
                  , description = "light rain"
                  , icon = "10n"
                  }
                ]
          }
        ]
    }


responseJson : String
responseJson =
    """
{
  "location": {
    "name": "Paris",
    "country": "FR"
  },
  "forecast": [
    {
      "day": "2017-02-16",
      "segments": [
        {
          "time": "2017-02-16T12:00:00.000+00:00",
          "temp": 286.67,
          "pressure": 972.73,
          "humidity": 75,
          "overall": "Clear",
          "description": "clear sky",
          "icon": "01d"
        },
        {
          "time": "2017-02-16T15:00:00.000+00:00",
          "temp": 285.66,
          "pressure": 970.91,
          "humidity": 70,
          "overall": "Clear",
          "description": "clear sky",
          "icon": "01d"
        },
        {
          "time": "2017-02-16T18:00:00.000+00:00",
          "temp": 277.05,
          "pressure": 970.44,
          "humidity": 90,
          "overall": "Clear",
          "description": "clear sky",
          "icon": "01n"
        },
        {
          "time": "2017-02-16T21:00:00.000+00:00",
          "temp": 272.78,
          "pressure": 969.32,
          "humidity": 80,
          "overall": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ]
    },
    {
      "day": "2017-02-17",
      "segments": [
        {
          "time": "2017-02-17T00:00:00.000+00:00",
          "temp": 273.341,
          "pressure": 968.14,
          "humidity": 85,
          "overall": "Clouds",
          "description":"broken clouds",
          "icon": "04n"
        },
        {
          "time": "2017-02-17T03:00:00.000+00:00",
          "temp": 275.568,
          "pressure": 966.6,
          "humidity": 89,
          "overall": "Rain",
          "description": "light rain",
          "icon": "10n"
        }
      ]
    }
  ]
}
  """
