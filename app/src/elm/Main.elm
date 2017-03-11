module Main exposing (..)

import Messages exposing (Msg)
import Models exposing (Model, initialModel)
import Projects.Commands exposing (fetchProjects)
import Routing
import Update exposing (update)
import View exposing (view)

import Navigation exposing (Location)


initialState : Location -> ( Model, Cmd Msg )
initialState location =
    let
        currentRoute =
            Routing.parseLocation location
    in
        ( initialModel currentRoute, fetchProjects )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


-- MAIN
main : Program Never Model Msg
main =
    Navigation.program Messages.OnLocationChange
        { init = initialState
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
