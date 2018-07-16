module Widgets.Screen exposing (..)

{-| Main application screen. Contains all other widgets; sets font stack and default background color (customizable; usually gray)

@docs screen

-}

import Css exposing (..)
import Html.Styled as HS exposing (..)
import Html.Styled.Attributes as SA exposing (..)
import Widgets.Private.Colors exposing (..)


{-| -}
screen : Color -> List (Html msg) -> Html msg
screen voidColor children =
    HS.div
        [ css
            [ position absolute
            , top <| px 0
            , bottom <| px 0
            , left <| px 0
            , right <| px 0
            , backgroundColor voidColor
            , fontFamilies
                [ "-apple-system"
                , "BlinkMacSystemFont"
                , "\"Segoe UI\""
                , "\"Roboto\""
                , "\"Helvetica Neue\""
                , "Arial"
                , "sans-serif"
                , "\"Apple Color Emoji\""
                , "\"Segoe UI Emoji\""
                , "\"Segoe UI Symbol\""
                ]
            , displayFlex
            , flexDirection column
            , justifyContent stretch
            , alignItems stretch
            , overflow Css.hidden
            ]
        ]
        children
