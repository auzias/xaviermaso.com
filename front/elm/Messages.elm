module Messages exposing (Msg(..))

import Browser exposing (UrlRequest)
import Projects.Models exposing (Project)
import RemoteData exposing (WebData)
import Url exposing (Url)


type Msg
    = OnFetchProjects (WebData (List Project))
    | LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url
    | NavigateTo String
    | RedirectTo String
    | CloseProjectDescription Project
    | ShowDescriptionOf Project
