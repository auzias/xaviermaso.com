module View exposing (..)

import Messages exposing (..)
import Models exposing (Model)
import Projects.View exposing (..)
import Routing exposing (blogPath, cvPath, projectsPath)
import Html exposing (Html, a, br, button, div, i, object, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)


view : Model -> Html Msg
view model =
    case model.route of
        Models.MainRoute ->
            mainView

        Models.CVRoute ->
            cvView

        Models.ProjectsRoute ->
            projectsView model

        Models.SocialMediaRoute ->
            socialMediaView

        Models.NotFoundRoute ->
            notFoundView


notFoundView : Html Msg
notFoundView =
    div []
        [ text "Not found"
        ]


projectsView : Model -> Html Msg
projectsView model =
    div []
        [ Projects.View.view model
        ]


cvView : Html Msg
cvView =
    div [ class "row" ]
        [ object
            [ class "col-md-12"
            , attribute "type" "application/pdf"
            , attribute "data" "xaviermaso.pdf"
            , style [ ( "height", "80em" ) ]
            ]
            [ div [ class "message lightOrange" ]
                [ br [] []
                , div [] [ text "Oops !" ]
                , br [] []
                , br [] []
                , div [] [ text "The necessary plug-in seems to be missing." ]
                , br [] []
                , br [] []
                , a [ href "xaviermaso.pdf" ] [ text "Download the CV in PDF format." ]
                ]
            ]
        ]


socialMediaView : Html Msg
socialMediaView =
    let
        links =
            [ ( "https://www.youtube.com/watch?v=5MC2X-LRbkE", "Millenials in the Workplace (Simon Sinek)" )
            , ( "https://www.youtube.com/watch?v=3E7hkPZ-HTk", "Quit Social Media (Dr. Cal Newport, TEDxTysons)" )
            , ( "https://www.theguardian.com/commentisfree/2013/sep/25/facebook-vain-tools-ideology-sharing-users", "Is Facebook sharing making us more vain? (Joe Turnbull)" )
            , ( "https://www.nytimes.com/2018/03/17/us/politics/cambridge-analytica-trump-campaign.html", "How Trump Consultants Exploited the Facebook Data of Millions (NY Times)" )
            , ( "https://www.bloomberg.com/news/features/2018-03-27/ad-scammers-need-suckers-and-facebook-helps-find-them", "How Facebook Helps Shady Advertisers Pollute the Internet (Bloomberg)" )
            ]

        textlines =
            [ "Sorry, I left Facebook in 2013."
            , "I find social media to be too time consuming, invasive, not so useful, sometimes harmful and really addictive."
            , "Human relations are rich and complex therefore should not be reduced to interactions through social media."
            , "Privately held companies' business is to make money out of you, not to solve your social problems."
            , "Therefore, if you want to connect to me (Thank you!), you can flick me an email, write me a post-card or come to say 'Hi' in person ; deep and meaningful relationships all start with a bit of effort and a leap of faith."
            ]
    in
        div [ class "jumbotron" ]
            [ div [] (List.map formatTextLine textlines)
            , div [ class "resource-links-box" ] (List.map formatLink links)
            ]


formatLink : ( String, String ) -> Html Msg
formatLink ( destination, title ) =
    div [ class "row" ]
        [ a
            [ href destination
            , target "_blank"
            , class "resource-link"
            ]
            [ text title ]
        , text " "
        , i [ class "fa fa-link" ]
            []
        ]


formatTextLine : String -> Html Msg
formatTextLine textline =
    div [ class "row textline" ]
        [ text textline ]


mainView : Html Msg
mainView =
    div [ class "row" ]
        [ div [ class "col-md-4" ]
            [ button [ class "tile blue", onClick (RedirectTo blogPath) ] [ text "Blog" ]
            ]
        , div [ class "col-md-4" ]
            [ button [ class "tile green", onClick (NavigateTo projectsPath) ] [ text "Projects" ]
            ]
        , div [ class "col-md-4" ]
            [ button [ class "tile orange", onClick (NavigateTo cvPath) ] [ text "CV" ]
            ]
        ]
