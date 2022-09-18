module Elements.CategoryElement exposing (..)
import Html exposing (Html, div, h5, img, p, text)
import Html.Attributes exposing (class, src, style)

type alias Category =
    { id : Int
    , name : String }

cardCategory : Category -> Html msg
cardCategory category =
    div
        []
        [ div
            [ class "card m-2"
            , style "width" "18rem"]
            [ img
                [ class "card-img-top"
                , src "img/cat.jpg"
                ]
                []
            ,
            div
                [ class "card-body d-flex justify-content-center" ]
                [ h5
                    [ class "card-title"]
                    [ text category.name ]
                ]
            ]
        ]