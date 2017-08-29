module Projects.Show exposing (..)

import Messages exposing (..)
import Projects.Models exposing (ProjectId, Project)

import Html exposing (..)
import Html.Attributes exposing (class, href, id, style, target)
import Html.Events exposing (onClick)
import List.Extra exposing (find)


view : ProjectId -> (List Project) -> Html Msg
view projectId projects =
     let
         maybeProject =
             find (\project -> project.id == projectId) projects
     in
         case maybeProject of
             Just project ->
                 projectView project
             Nothing ->
                 text ""


projectView : Project -> Html Msg
projectView project =
    let
        linkValue =
            case project.link of
                Nothing -> ""
                Just link -> link
    in
        div [ class "row" ]
            [ div [ class "col-md-12" ]
                [ div [ class "project-description lightGreen" ]
                    [ h1 [] [ text project.title ]
                    , h3 [ style [ ("position", "absolute")
                                 , ("top", "18px")
                                 , ("right", "55px") ] ] [ text project.dates ]
                    , h4 [] [ text project.tags ]
                    , h3 [] [
                        a [ href linkValue, target "_blank" ] [ text linkValue ] ]
                    , i [ class "fa fa-close fa-2x"
                        , style [ ("position", "absolute")
                                , ("top", "10px")
                                , ("right", "23px") ]
                        , onClick CloseProjectDescription ] []
                    ]
                ]
            ]
