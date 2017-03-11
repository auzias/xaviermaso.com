module Models exposing (..)

import RemoteData exposing (WebData)


type alias Model =
    { projects : WebData (List Project)
    , route : Route
    }


type Route
    = MainRoute
    | ProjectsRoute
    | NotFoundRoute


initialModel : Route -> Model
initialModel route =
    { projects = RemoteData.Loading
    , route = route
    }


type alias ProjectId =
    String


type alias Project =
    { id : ProjectId
    , tileContent : String
    , title : String
    , dates : String
    , tags : String
    , link : Maybe String
    }
