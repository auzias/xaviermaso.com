module Models exposing (..)

import Projects.Models exposing (..)

import RemoteData exposing (WebData)


type alias Model =
    { projects : WebData (List Project)
    , route : Route
    }


type Route
    = MainRoute
    | CVRoute
    | ProjectsRoute
    | NotFoundRoute


initialModel : Route -> Model
initialModel route =
    { projects = RemoteData.Loading
    , route = route
    }
