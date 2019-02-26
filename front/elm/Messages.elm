module Messages exposing (Msg(..))

import Navigation exposing (Location)
import Projects.Models exposing (Project)
import RemoteData exposing (WebData)


type Msg
    = OnFetchProjects (WebData (List Project))
    | OnLocationChange Location
    | NavigateTo String
    | RedirectTo String
    | CloseProjectDescription Project
    | ShowDescriptionOf Project
