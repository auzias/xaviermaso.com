module Projects.Show exposing (formatLink, view)

import Html exposing (..)
import Html.Attributes exposing (class, href, id, property, style, target)
import Html.Events exposing (onClick)
import Json.Encode exposing (string)
import Messages exposing (..)
import Projects.Models exposing (Link, Project)


view : Project -> Html Msg
view project =
    let
        descriptionValue =
            case project.description of
                Nothing ->
                    ""

                Just description ->
                    description
    in
    div [ class "row" ]
        [ div [ class "col-md-12" ]
            [ div [ class "project-description lightGreen" ]
                [ h1 [] [ text project.title ]
                , h3
                    [ style
                        [ ( "position", "absolute" )
                        , ( "top", "18px" )
                        , ( "right", "55px" )
                        ]
                    ]
                    [ text project.dates ]
                , h4 [] [ text project.tags ]
                , div [ class "row" ]
                    [ div
                        [ class "col-md-12 textDesc"
                        , property "innerHTML" <| string descriptionValue
                        ]
                        []
                    ]
                , div [] (List.map formatLink project.links)
                , i
                    [ class "fa fa-close fa-2x"
                    , style
                        [ ( "position", "absolute" )
                        , ( "top", "10px" )
                        , ( "right", "23px" )
                        ]
                    , onClick (CloseProjectDescription project)
                    ]
                    []
                ]
            ]
        ]


formatLink : Link -> Html Msg
formatLink link =
    let
        value =
            case link.value of
                Nothing ->
                    link.target

                Just value ->
                    value
    in
    h3 []
        [ a [ href link.target, target "_blank" ] [ text value ]
        ]
