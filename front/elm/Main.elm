module Main exposing (..)

import Messages exposing (Msg)
import Models exposing (Model, Flags, initialModel)
import Projects.Commands exposing (fetchProjects)
import Commands exposing (fetchCatGif)
import Routing
import Update exposing (update)
import View exposing (view)
import Navigation exposing (Location)


initialState : Flags -> Location -> ( Model, Cmd Msg )
initialState flags location =
    let
        currentRoute =
            Routing.parseLocation location
    in
        ( initialModel currentRoute, fetchProjects flags.projectsUrl, fetchCatGif flags.catGifUrl )


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
