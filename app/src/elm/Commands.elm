module Commands exposing (..)

import Messages exposing (Msg)
import Models exposing (ProjectId, Project)

import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, optional, required)
import RemoteData


fetchProjects : Cmd Msg
fetchProjects =
    Http.get fetchProjectsUrl projectsDecoder
        |> RemoteData.sendRequest
        |> Cmd.map Messages.OnFetchProjects


fetchProjectsUrl : String
fetchProjectsUrl =
    "http://localhost:8000/projects"


projectsDecoder : Decode.Decoder (List Project)
projectsDecoder =
    Decode.list projectDecoder


projectDecoder : Decode.Decoder Project
projectDecoder =
    decode Project
        |> required "id" Decode.string
        |> required "tileContent" Decode.string
        |> required "title" Decode.string
        |> required "dates" Decode.string
        |> required "tags" Decode.string
        |> optional "link" (Decode.map Just Decode.string) Nothing
        --|> required "link" (Decode.nullable Decode.string)
