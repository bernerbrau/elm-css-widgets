module Widgets.Page exposing (..)

{-| Main vertical layout, providing scroll functionality and appropriate padding.

@docs page

-}

import Css exposing (..)
import Html.Styled as HS exposing (..)
import Html.Styled.Attributes as SA exposing (..)
import Widgets.VerticalFlow exposing (verticalFlow)


{-| -}
page : List (Html msg) -> Html msg
page children =
    HS.div
        [ css
            [ flex (px 1)
            , padding2 (px 16) (px 64)
            , overflowY auto
            ]
        ]
        [ verticalFlow children ]
