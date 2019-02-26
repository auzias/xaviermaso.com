module Main exposing (initialState, main, subscriptions)

import Messages exposing (Msg)
import Models exposing (Flags, Model, initialModel)
import Navigation exposing (Location)
import Projects.Commands exposing (fetchProjects)
import Routing
import Update exposing (update)
import View exposing (view)


initialState : Flags -> Location -> ( Model, Cmd Msg )
initialState flags location =
    let
        currentRoute =
            Routing.parseLocation location
    in
    ( initialModel currentRoute, fetchProjects flags.projectsUrl )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- MAIN


main : Program Flags Model Msg
main =
    Navigation.programWithFlags Messages.OnLocationChange
        { init = initialState
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
