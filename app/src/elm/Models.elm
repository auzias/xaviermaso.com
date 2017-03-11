module Models exposing (..)

type alias Model =
    { projects : List Project
    }


initialModel : Model
initialModel =
    { projects = [
        { id = "0"
          , tileContent = "redshield"
          , title = "RedShield (pro)"
          , dates = "january 2015 - april 2016"
          , tags = "ruby-on-rails, front-end development, devops, R&D"
          , link = Just "https://www.redshield.co/"
          }
      , { id = "1"
          , tileContent = "personnal stack"
          , title = "Personnal Stack"
          , dates = "2014 - today"
          , tags = "devops, docker, ansible"
          , link = Nothing
          }
    ]
    }


type alias ProjectId =
    String


type alias Project =
    { id : ProjectId
    , tileContent : String
    , title : String
    , dates : String
    , tags : String
    , link : Maybe String
    }
