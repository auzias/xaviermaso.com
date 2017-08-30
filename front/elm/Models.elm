module Models exposing (..)

import Projects.Models exposing (..)
import RemoteData exposing (WebData)


type alias Model =
    { projects : WebData (List Project)
    , currentProjects : ( Maybe Project, Maybe Project )
    , route : Route
    }


type alias Flags =
    { projectsUrl : ProjectsUrl }


type Route
    = MainRoute
    | CVRoute
    | ProjectsRoute
    | SocialMediaRoute
    | NotFoundRoute


initialModel : Route -> Model
initialModel route =
    { projects = RemoteData.Loading
    , currentProjects = ( Nothing, Nothing )
    , route = route
    }
