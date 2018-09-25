type Msg = MorePlease

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
      MorePlease ->
            (model, Cmd.none)

      NewGif (Ok newUrl) ->
            ( { model | catGifUrl = newUrl }, Cmd.none)

      NewGif (Err _) ->
            (model, Cmd.none)
