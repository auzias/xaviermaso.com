module Main exposing (..)

import Commands exposing (fetchProjects)
import Messages exposing (Msg)
import Models exposing (Model, initialModel)
import Update exposing (update)
import View exposing (view)

import Html exposing (Html)


initialState : ( Model, Cmd Msg )
initialState =
    ( initialModel, fetchProjects )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


-- MAIN
main : Program Never Model Msg
main =
    Html.program
        { init = initialState
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
