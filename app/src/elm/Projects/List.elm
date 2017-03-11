module Projects.List exposing (..)

import Messages exposing (Msg)
import Models exposing (Project)

import Html exposing (..)
import Html.Attributes exposing (class, href)
import RemoteData exposing (WebData)


view : WebData (List Project) -> Html Msg
view response =
    div []
        [ nav
        , maybeList response
        ]


maybeList : WebData (List Project) -> Html Msg
maybeList response =
    case response of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading..."

        RemoteData.Success projects ->
            list projects

        RemoteData.Failure error ->
            text (toString error)

nav : Html Msg
nav =
    div [ class "clearfix mb2 white bg-black" ]
        [ div [ class "left p2" ] [ text "Projects" ] ]


list : List Project -> Html Msg
list projects =
    div [ class "row" ] (List.indexedMap projectTile projects)



projectTile : Int -> Project -> Html Msg
projectTile index project =
    let
        color =
            if (index % 2 == 0) then "green" else "lightGreen"
    in
        div [ class "col-md-4" ] [
            button [ class ("tile-project " ++ color) ] [ text project.tileContent ]
            ]
