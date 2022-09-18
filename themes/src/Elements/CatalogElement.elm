module Elements.CatalogElement exposing (..)

import Elements.ProductElement exposing (cardProduct)
import Html exposing (Html, div)
import Html.Attributes exposing (class)

catalogView : Html msg
catalogView =
    div
        [ class "d-flex m-2 justify-content-center" ]
        [ cardProduct
        , cardProduct
        , cardProduct
        ]