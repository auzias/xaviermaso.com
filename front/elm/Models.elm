module Models exposing (Flags, Model, initialModel)

import Browser.Navigation exposing (Key)
import Projects.Models exposing (..)
import RemoteData exposing (WebData)
import Routing exposing (Route)
import SocialMedia.Models exposing (SocialMedium, initialSocialMedia)
import Url exposing (Url)
import Url.Parser exposing (parse)


type alias Model =
    { projects : WebData (List Project)
    , socialMedia : List SocialMedium
    , currentProjects : ( Maybe Project, Maybe Project )
    , key : Browser.Navigation.Key
    , route : Maybe Route
    }


type alias Flags =
    { projectsUrl : ProjectsUrl }


initialModel : Browser.Navigation.Key -> Url -> Model
initialModel key url =
    { projects = RemoteData.Loading
    , socialMedia = SocialMedia.Models.initialSocialMedia
    , currentProjects = ( Nothing, Nothing )
    , key = key
    , route = Url.Parser.parse Routing.routeParser url
    }
