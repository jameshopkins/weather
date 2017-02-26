module Fixtures.Flags exposing (..)

import Flags exposing (Locations)


expected : Locations
expected =
    [ { city = "Moscow, Russia", ll = "55.75,37.6166667" }
    , { city = "London, UK", ll = "51.5081289,-0.128005" }
    , { city = "St Petersburg, Russia", ll = "60.07623830000001,30.1213829" }
    ]


json : String
json =
    """
[
  { "city": "Moscow, Russia", "ll": "55.75,37.6166667" },
  { "city": "London, UK", "ll": "51.5081289,-0.128005" },
  { "city": "St Petersburg, Russia", "ll": "60.07623830000001,30.1213829"}
]
  """
