module Projects.Show exposing (..)

import Messages exposing (..)
import Projects.Models exposing (Project)
import Html exposing (..)
import Html.Attributes exposing (class, href, id, property, style, target)
import Html.Events exposing (onClick)
import Json.Encode exposing (string)


view : Project -> Html Msg
view project =
    let
        descriptionValue =
            case project.description of
                Nothing ->
                    ""
                Just description ->
                    description

        linkValue =
            case project.link of
                Nothing ->
                    ""
                Just link ->
                    link
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
                        [ div [ class "col-md-12 textDesc"
                              , property "innerHTML" <| string descriptionValue ] []
                        ]
                    , h3 []
                        [ a [ href linkValue, target "_blank" ] [ text linkValue ]
                        ]
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
