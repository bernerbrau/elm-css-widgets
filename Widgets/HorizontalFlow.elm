module Widgets.HorizontalFlow exposing (..)

{-| flexbox that fills the container vertically and horizontally, stretching its children where possible to do this.

@docs horizontalFlow

-}

import Css exposing (..)
import Html.Styled as HS exposing (..)
import Html.Styled.Attributes as SA exposing (..)
import Widgets.Private.Colors exposing (..)


{-| -}
horizontalFlow : List (Html msg) -> Html msg
horizontalFlow children =
    HS.div
        [ css
            [ position relative
            , flex (num 1)
            , displayFlex
            , flexDirection row
            , justifyContent stretch
            , alignItems stretch
            ]
        ]
        children
