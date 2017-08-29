module Projects.List exposing (..)

import Messages exposing (..)
import Projects.Models exposing (Project)

import Html exposing (..)
import Html.Attributes exposing (class, href)
import Html.Events exposing (onClick)


view : List Project -> Html Msg
view projects =
    div [ class "row" ] (List.indexedMap projectTile projects)


projectTile : Int -> Project -> Html Msg
projectTile index project =
    let
        color =
            if (index % 2 == 0) then "green" else "lightGreen"
    in
        div [ class "col-md-4", onClick (ShowDescriptionOf project) ] [
            button [ class ("tile-project " ++ color) ] [ text project.tileContent ]
            ]
