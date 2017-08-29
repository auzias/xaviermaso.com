module Messages exposing (..)

import Projects.Models exposing (Project)

import Navigation exposing (Location)
import RemoteData exposing (WebData)


type Msg
    = OnFetchProjects (WebData (List Project))
    | OnLocationChange Location
    | NavigateTo String
    | CloseProjectDescription
    | ShowDescriptionOf Project
