module Projects.Show exposing (..)

import Projects.Models exposing (..)
import Projects.Messages exposing (..)

import Html exposing (..)
import Html.Attributes exposing (id, style, src)


view : Language -> Html Msg
view language =
    div []
        [ h2 [ id "titleLanguage" ] [ text language.name ]
        , img [ src ("/images/" ++ language.image ++ ".png") ] []
        , tags language
        ]
