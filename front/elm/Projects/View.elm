module Projects.View exposing (..)

import Messages exposing (..)
import Models exposing (Model)
import Projects.List exposing (view)
import Projects.Show exposing (view)

import Html exposing (Html, div, text)
import RemoteData exposing (WebData)


view : Model -> Html Msg
view model =
    case model.projects of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading..."

        RemoteData.Success projects ->
            case model.currentProject of
                Just projectId ->
                    div []
                    [ Projects.Show.view projectId projects
                    , Projects.List.view projects
                    ]
                Nothing ->
                    div []
                    [ Projects.List.view projects
                    ]

        RemoteData.Failure error ->
            text (toString error)
