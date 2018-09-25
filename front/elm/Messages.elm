module Messages exposing (..)

import Models exposing (CatGif)
import Projects.Models exposing (Project)
import Navigation exposing (Location)
import RemoteData exposing (WebData)


type Msg
    = OnFetchProjects (WebData (List Project))
    | OnFetchCatGif (WebData CatGif)
    | OnLocationChange Location
    | NavigateTo String
    | RedirectTo String
    | CloseProjectDescription Project
    | ShowDescriptionOf Project
