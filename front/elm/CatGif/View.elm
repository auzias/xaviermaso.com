module CatGif.View exposing (..)

import Models exposing (Model)
import CatGif.Messages exposing (..)
import Html exposing (Html, button, div, img, text)
import Html.Attributes exposing (src)
import Html.Events exposing (onClick)
import RemoteData exposing (WebData)


view : Model -> Html CatGif.Messages.Msg
view model =
    case model.catGif of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading..."

        RemoteData.Success catGif ->
            div []
                [ img [ src catGif.gifUrl ] []
                , button [ onClick MorePlease ] [ text "More Please!" ]
                ]

        RemoteData.Failure error ->
            text (toString error)
