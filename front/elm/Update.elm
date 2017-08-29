module Update exposing (..)

import Messages exposing (..)
import Models exposing (..)
import Routing exposing (parseLocation)

import Navigation exposing (newUrl)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    let
        (currentSeriousProject, currentHack) = model.currentProjects
    in
        case msg of
            Messages.OnFetchProjects response ->
                ( { model | projects = response }, Cmd.none )

            Messages.OnLocationChange location ->
                let
                    newRoute =
                        parseLocation location
                in
                    ( { model | route = newRoute }, Cmd.none )

            NavigateTo path ->
                let
                    command =
                        Navigation.newUrl path
                in
                    ( model, command )

            ShowDescriptionOf project ->
                case project.seriousness of
                    (Just "hack") ->
                        ( { model | currentProjects = (currentSeriousProject, Just project) }, Cmd.none )
                    _ ->
                        ( { model | currentProjects = (Just project, currentHack) }, Cmd.none )

            CloseProjectDescription project ->
                case project.seriousness of
                    (Just "hack") ->
                        ( { model | currentProjects = (currentSeriousProject, Nothing) }, Cmd.none )
                    _ ->
                        ( { model | currentProjects = (Nothing, currentHack) }, Cmd.none )
