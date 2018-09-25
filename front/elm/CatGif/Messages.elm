module CatGif.Messages exposing (..)

import Http


type Msg
  = MorePlease
  | NewGif (Result Http.Error String)

