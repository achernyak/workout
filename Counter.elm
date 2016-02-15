module Counter (Model, init, Action, update, view) where

import Html exposing (..)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)

-- MODEL

type alias Model = Int

init : Int -> Model
init count = count

-- UPDATE

type Action = Increment | Decrement

update : Action -> Model -> Model
update action model =
  case action of
    Increment ->
      model + 1

    Decrement ->
      model - 1


-- VIEW

view : Signal.Address Action -> Model -> Html
view address model =
  div [containerStyle]
    [ button [ onClick address Decrement, buttonStyle] [ text "-" ]
    , div [ countStyle ] [ text (toString model) ]
    , button [ onClick address Increment, buttonStyle] [ text "+" ]
    ]


containerStyle : Attribute
containerStyle =
  style
    [ ("margin", "1em")]

countStyle : Attribute
countStyle =
  style
    [ ("font-size", "1.5em")
    , ("font-family", "monospace")
    , ("display", "inline-block")
    , ("width", "2em")
    , ("text-align", "center")
    ]

buttonStyle : Attribute
buttonStyle =
  style
    [ ("font-size", "2em")
    , ("width", "2em")
    , ("background", "white")
    , ("border", "2px solid #DDD")
    ]
