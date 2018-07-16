module Widgets.Paper exposing (..)

{-| Simple paper widget with no layout constraints internally. Padding is provided.

@docs paper

-}

import Css exposing (..)
import Html.Styled as HS exposing (..)
import Html.Styled.Attributes as SA exposing (..)
import Widgets.Private.Colors exposing (nearOpaqueBlack, white)
import Widgets.VerticalFlow exposing (verticalFlow)


{-| -}
paper : List (Html msg) -> Html msg
paper children =
    HS.div
        [ css
            [ backgroundColor white
            , padding2 (px 8) (px 16)
            , borderRadius (px 4)
            , boxShadow5 (px 0) (px 1) (px 1) (px 1) nearOpaqueBlack
            ]
        ]
        children
