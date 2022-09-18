module Elements.CatalogElement exposing (..)

import Elements.CategoryElement exposing (cardCategory, Category)
import Html exposing (Html, div)
import Html.Attributes exposing (class)

catalogView : List Category -> Html msg
catalogView categories =
    div
        [ class "d-flex m-2 justify-content-center" ]
        <| List.map cardCategory categories
