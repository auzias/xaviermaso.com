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


projectsPath : String
projectsPath =
    "projects"


cvPath : String
cvPath =
    "cv"


blogPath : String
blogPath =
    "https://blog.xaviermaso.com"


rootPath : String
rootPath =
    "/"


facebookPath : String
facebookPath =
    "facebook"
