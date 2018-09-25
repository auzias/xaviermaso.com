module Projects.Update exposing (..)

import Models exposing (..)
import Projects.Messages exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    let
        ( currentSeriousProject, currentHack ) =
            model.currentProjects
    in
        case msg of
            OnFetchProjects response ->
                ( { model | projects = response }, Cmd.none )
