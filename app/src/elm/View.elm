module View exposing(..)

import Messages exposing (..)
import Models exposing (Model, ProjectId)
import Projects.List exposing (..)

import Html exposing (Html, button, div, text)
import Html.Attributes exposing (..)


view : Model -> Html Msg
view model =
    case model.route of
        Models.MainRoute ->
            mainView
        Models.ProjectsRoute ->
            projectsView model
        Models.NotFoundRoute ->
            notFoundView


notFoundView : Html Msg
notFoundView =
    div []
        [ text "Not found"
        ]


projectsView : Model -> Html Msg
projectsView model =
    Projects.List.view model.projects


mainView : Html Msg
mainView =
    div [ class "row" ]
    [ div [ class "col-md-6" ][
        button [ class "tile green" ][ text "Projects" ] ]
    , div [ class "col-md-6" ][
        button [ class "tile orange" ][ text "cv" ] ]
    ]
