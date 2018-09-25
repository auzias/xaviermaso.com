module CatGif.Commands exposing (..)

import Messages exposing (Msg)
import CatGif.Models exposing (CatGifUrl)
import Http
import RemoteData


fetchCatGif : CatGifUrl -> Cmd Msg
fetchCatGif =
    Http.get CatGifUrl decodeCatGifUrl
        |> RemoteData.sendRequest
        |> Cmd.map Messages.OnFetchCatGif


decodeCatGifUrl : Decode.Decoder String
decodeCatGifUrl =
  Decode.at ["data", "image_url"] Decode.string
