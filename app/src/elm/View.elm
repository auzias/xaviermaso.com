module View exposing(..)

import Messages exposing (..)
import Models exposing (..)

import Html exposing (Html, button, div, text, program)
import Html.Attributes exposing (..)


view : Model -> Html Msg
view model =
    div [ class "row" ] [
        div [] [ text model ]
        , div [ class "col-md-6" ][
            button [ class "tile green" ][ text "Projects" ]
        ]
        , div [ class "col-md-6" ][
            button [ class "tile orange" ][ text "cv" ]
        ]
    ]
