module Models exposing (..)

import RemoteData exposing (WebData)


type alias Model =
    { projects : WebData (List Project)
    }


initialModel : Model
initialModel =
    { projects = RemoteData.Loading
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
