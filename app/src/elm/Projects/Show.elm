module Projects.Show exposing (..)

import Messages exposing (..)
import Models exposing (Model)
import Projects.Models exposing (ProjectId, Project)

import Html exposing (..)
import Html.Attributes exposing (class, href, id, style, src, target)
import Html.Events exposing (onClick)
import List exposing (head)
import List.Extra exposing (find)
import RemoteData exposing (WebData)


view : Model -> Html Msg
view model =
    case (model.projects, model.currentProject) of
        (RemoteData.Success projects, Just projectId) ->
            let
                maybeProject =
                    find (\project -> project.id == projectId) projects
            in
                case maybeProject of
                    Nothing -> text ""
                    Just project ->
                        projectView project
        _ ->
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
