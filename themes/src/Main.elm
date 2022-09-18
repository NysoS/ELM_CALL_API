module Main exposing (..)

import Bootstrap.CDN as CDN
import Bootstrap.Grid as Grid
import Browser
import Dict
import Elements.CatalogElement exposing (catalogView)
import Elements.CategoryElement exposing (Category, cardCategory)
import Html exposing (Html, div, text)
import Http exposing (header)
import Json.Decode exposing (Decoder, field, int, map2, map4, string)


type Model
    = Loading
    | Failure
    | Success (List Category)

type Msg
    = GetCatalog (Result Http.Error (List Category))


init : () -> (Model, Cmd Msg)
init _ =
  ( Loading
  , Http.request
      { method = "GET"
      , headers = [header "accept" "application/json"]
      , url = "http://localhost:5454/api/categories"
      , body = Http.emptyBody
      , expect = Http.expectJson GetCatalog listDecoder
      , timeout = Nothing
      , tracker = Nothing
      }
  )


view : Model -> Html msg
view model =
    Grid.container
        []         -- Responsive fixed width container
        [ CDN.stylesheet      -- Inlined Bootstrap CSS for use with reactor
        , div
              []
              [
                case model of
                    Failure ->
                      div []
                        [ text "I could not load a random quote for some reason. " ]

                    Loading ->
                      text "Loading..."

                    Success quote ->
                      div []
                          [ catalogView quote ]
              ]

        ]

listDecoder : Decoder (List Category)
listDecoder =
    Json.Decode.list categoryDecode

categoryDecode : Decoder Category
categoryDecode =
   map2 Category
    (field "id" int)
    (field "name" string)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
     case msg of
        GetCatalog result ->
          case result of
            Ok fullText ->
              (Success fullText, Cmd.none)

            Err _ ->
              (Failure, Cmd.none)

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none

main =
    Browser.element
    { init = init
    , subscriptions = subscriptions
    , update = update
    , view = view
    }
