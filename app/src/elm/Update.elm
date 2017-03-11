module Update exposing (..)

import Messages exposing (..)
import Models exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Messages.OnFetchProjects response ->
            ( { model | projects = response }, Cmd.none )
