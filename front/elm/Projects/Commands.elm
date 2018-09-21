module Projects.Commands exposing (..)

import Messages exposing (Msg)
import Projects.Models exposing (Link, ProjectId, ProjectsUrl, Project)
import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, optional, required)
import RemoteData


fetchProjects : ProjectsUrl -> Cmd Msg
fetchProjects url =
    Http.get url projectsDecoder
        |> RemoteData.sendRequest
        |> Cmd.map Messages.OnFetchProjects


projectsDecoder : Decode.Decoder (List Project)
projectsDecoder =
    Decode.list projectDecoder


projectDecoder : Decode.Decoder Project
projectDecoder =
    decode Project
        |> required "id" Decode.string
        |> required "tileContent" Decode.string
        |> required "title" Decode.string
        |> optional "seriousness" (Decode.map Just Decode.string) Nothing
        |> required "dates" Decode.string
        |> required "tags" Decode.string
        |> optional "links" (Decode.list linkDecoder) []
        |> optional "description" (Decode.map Just Decode.string) Nothing


linkDecoder : Decode.Decoder Link
linkDecoder =
    decode Link
        |> required "target" Decode.string
        |> optional "value" (Decode.map Just Decode.string) Nothing
