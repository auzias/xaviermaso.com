module Routing exposing (..)

import Models exposing (Route(..))
import Navigation exposing (Location)
import UrlParser exposing (..)


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map MainRoute top
        , map CVRoute (s "cv")
        , map ProjectsRoute (s "projects")
        , map SocialMediaRoute (s "social-media")
        ]


parseLocation : Location -> Route
parseLocation location =
    case (parseHash matchers location) of
        Just route ->
            route

        Nothing ->
            NotFoundRoute


projectsPath : String
projectsPath =
    "#projects"


cvPath : String
cvPath =
    "#cv"


blogPath : String
blogPath =
    "http://blog.xaviermaso.com"
