module Models exposing (..)

import Projects.Models exposing (..)
import RemoteData exposing (WebData)


type alias CatGifUrl =
    String


type alias CatGif =
    { gifUrl : String
    }


type alias Model =
    { projects : WebData (List Project)
    , catGif : WebData CatGif
    , currentProjects : ( Maybe Project, Maybe Project )
    , route : Route
    }


type alias Flags =
    { projectsUrl : ProjectsUrl
    , catGifUrl : CatGifUrl
    }


type Route
    = MainRoute
    | CVRoute
    | ProjectsRoute
    | MeowRoute
    | SocialMediaRoute
    | NotFoundRoute


initialModel : Route -> Model
initialModel route =
    { projects = RemoteData.Loading
    , catGif = RemoteData.Loading
    , currentProjects = ( Nothing, Nothing )
    , route = route
    }
