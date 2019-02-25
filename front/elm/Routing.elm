module Routing exposing (Route(..), blogPath, cvPath, projectsPath, rootPath, routeParser, socialMediaPath)

import Browser.Navigation exposing (Key)
import Url.Parser exposing (..)


type Route
    = MainRoute
    | CVRoute
    | ProjectsRoute
    | SocialMediaRoute


routeParser : Parser (Route -> a) a
routeParser =
    oneOf
        [ map MainRoute top
        , map CVRoute (s cvPath)
        , map ProjectsRoute (s projectsPath)
        , map SocialMediaRoute (s socialMediaPath)
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


socialMediaPath : String
socialMediaPath =
    "socialMedia"
