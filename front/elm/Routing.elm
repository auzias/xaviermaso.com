module Routing exposing (Route(..), blogPath, cvPath, facebookPath, projectsPath, rootPath, routeParser)

import Browser.Navigation exposing (Key)
import Url.Parser exposing (..)


type Route
    = MainRoute
    | CVRoute
    | ProjectsRoute
    | FacebookRoute


routeParser : Parser (Route -> a) a
routeParser =
    oneOf
        [ map MainRoute top
        , map CVRoute (s cvPath)
        , map ProjectsRoute (s projectsPath)
        , map FacebookRoute (s facebookPath)
        ]


blogPath : String
blogPath =
    "https://blog.xaviermaso.com"


cvPath : String
cvPath =
    "cv"


facebookPath : String
facebookPath =
    "facebook"


projectsPath : String
projectsPath =
    "projects"


rootPath : String
rootPath =
    "/"
