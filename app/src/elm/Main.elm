module Main exposing (..)

import Messages exposing (..)
import Models exposing (..)
import Update exposing (..)
import View exposing (..)

import Html exposing (Html)


initialState : ( Model, Cmd Msg )
initialState =
    ( "Hello", Cmd.none )


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
