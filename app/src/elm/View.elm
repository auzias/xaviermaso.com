module View exposing(..)

import Messages exposing (..)
import Models exposing (..)
import Projects.List exposing (..)

import Html exposing (Html, button, div, text)
import Html.Attributes exposing (..)


view : Model -> Html Msg
view model =
    div [ class "row" ] [
        div [] [ page model ]
        , div [ class "col-md-6" ][
            button [ class "tile green" ][ text "Projects" ]
        ]
        , div [ class "col-md-6" ][
            button [ class "tile orange" ][ text "cv" ]
        ]
    ]


page : Model -> Html Msg
page model =
    Projects.List.view model.projects
