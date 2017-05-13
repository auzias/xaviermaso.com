module Update exposing (..)

import Messages exposing (..)
import Models exposing (..)
import Routing exposing (parseLocation)

import Navigation exposing (newUrl)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
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

        ShowDescriptionOf projectId ->
            ( { model | currentProject = (Just projectId) }, Cmd.none )

        CloseProjectDescription ->
            ( { model | currentProject = Nothing }, Cmd.none )
