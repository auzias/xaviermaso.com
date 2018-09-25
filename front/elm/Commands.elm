module Commands exposing (..)

import Messages exposing (Msg)
import Models exposing (CatGifUrl, CatGif)
import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import RemoteData


fetchCatGif : CatGifUrl -> Cmd Msg
fetchCatGif url =
    Http.get url catGifDecoder
        |> RemoteData.sendRequest
        |> Cmd.map Messages.OnFetchCatGif


catGifDecoder : Decode.Decoder CatGif
catGifDecoder =
    -- Decode.at [ "data", "image_url" ] Decode.string
    object1 CatGif (Decode.at [ "data", "image_url" ] Decode.string)
