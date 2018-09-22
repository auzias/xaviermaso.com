module Projects.Models exposing (..)


type alias ProjectId =
    String


type alias ProjectsUrl =
    String


type alias Link =
    { target : String
    , value : Maybe String
    }


type alias Project =
    { id : ProjectId
    , tileContent : String
    , title : String
    , seriousness : Maybe String
    , dates : String
    , tags : String
    , links : List Link
    , description : Maybe String
    }
