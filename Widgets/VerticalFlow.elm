module Widgets.VerticalFlow exposing (..)

import Css exposing (..)
import Html.Styled as HS exposing (..)
import Html.Styled.Attributes as SA exposing (..)
import Widgets.Private.Colors exposing (..)


verticalFlow : List (Html msg) -> Html msg
verticalFlow children =
    HS.div
        [ css
            [ position relative
            , flex (num 1)
            , displayFlex
            , flexDirection column
            , justifyContent flexStart
            , alignItems stretch
            ]
        ]
        children
