module Widgets.Bar exposing (..)

{-| Top or bottom app bar widget

@docs bar, BarType

-}

import Css exposing (..)
import Html.Styled as HS exposing (..)
import Html.Styled.Attributes as SA exposing (..)
import Widgets.Private.Colors exposing (..)


{-| -}
type BarType
    = Top
    | Bottom


{-| -}
bar : Color -> BarType -> List (Html msg) -> Html msg
bar color_ type_ children =
    HS.div []
        [ HS.div
            [ css
                [ position fixed
                , (case type_ of
                    Top ->
                        top <| px 0

                    Bottom ->
                        bottom <| px 0
                  )
                , left <| px 0
                , right <| px 0
                , backgroundColor color_
                , color <| contrast Opaque color_
                , Css.height <| px 72
                , fontSize <| Css.rem 1.425
                , displayFlex
                , flexDirection row
                , justifyContent stretch
                , padding2 (px 0) (px 10)
                , alignItems center
                , boxShadow4 (px 0) (px 1) (px 4) nearOpaqueBlack
                , border (px 0)
                ]
            ]
            children
        , HS.div
            [ css
                [ display block
                , Css.width <| vw 100
                , Css.height <| px 72
                , flex <| num 0
                ]
            ]
            []
        ]
