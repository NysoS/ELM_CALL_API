module Main exposing (..)

import Bootstrap.CDN as CDN
import Bootstrap.Grid as Grid
import Elements.CatalogElement exposing (catalogView)
import Html exposing (Html, div, text)


view : Html msg
view =
    div
        []
        [ catalogView ]



main =
    Grid.container []         -- Responsive fixed width container
            [ CDN.stylesheet      -- Inlined Bootstrap CSS for use with reactor
            ,   view
            ]