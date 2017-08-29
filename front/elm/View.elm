module View exposing (..)

import Messages exposing (..)
import Models exposing (Model)
import Projects.View exposing (..)
import Routing exposing (projectsPath, cvPath)
import Html exposing (Html, a, br, button, div, object, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)


view : Model -> Html Msg
view model =
    case model.route of
        Models.MainRoute ->
            mainView

        Models.CVRoute ->
            cvView

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
    div []
        [ Projects.View.view model
        ]


cvView : Html Msg
cvView =
    div [ class "row" ]
        [ object
            [ class "col-md-12"
            , attribute "type" "application/pdf"
            , attribute "data" "xaviermaso.pdf"
            , style [ ( "height", "80em" ) ]
            ]
            [ div [ class "message lightOrange" ]
                [ br [] []
                , div [] [ text "Oops !" ]
                , br [] []
                , br [] []
                , div [] [ text "The necessary plug-in seems to be missing." ]
                , br [] []
                , br [] []
                , a [ href "xaviermaso.pdf" ] [ text "Download the CV in PDF format." ]
                ]
            ]
        ]


mainView : Html Msg
mainView =
    div [ class "row" ]
        [ div [ class "col-md-6" ]
            [ button [ class "tile green", onClick (NavigateTo projectsPath) ] [ text "Projects" ]
            ]
        , div [ class "col-md-6" ]
            [ button [ class "tile orange", onClick (NavigateTo cvPath) ] [ text "CV" ]
            ]
        ]
