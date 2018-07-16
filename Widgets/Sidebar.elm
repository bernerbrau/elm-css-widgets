module Widgets.Sidebar exposing (..)

import Css exposing (..)
import Css.Transitions as TRNS exposing (easeOut, transition)
import Html.Styled as HS exposing (..)
import Html.Styled.Attributes as SA exposing (..)
import Widgets.Private.Colors exposing (..)
import Widgets.Private.CssExtra exposing (none, userSelect)


sidebar : List (Html msg) -> Html msg
sidebar children =
    HS.div
        [ css
            [ Css.width (px 325)
            , backgroundColor white
            , boxShadow4 (px 1) (px 0) (px 4) nearOpaqueBlack
            , displayFlex
            , flexDirection column
            , justifyContent flexStart
            , alignItems stretch
            , overflowY auto
            ]
        ]
        children


sidebarItem : Bool -> List (Html msg) -> Html msg
sidebarItem active_ children =
    HS.div
        [ css
            [ position relative
            , borderBottom3 (px 1) solid nearTransparentBlack
            , padding (px 8)
            , fontSize (Css.rem 0.8)
            , cursor pointer
            , userSelect Widgets.Private.CssExtra.none
            , backgroundColor <|
                if active_ then
                    (rgba 0 0 0 0.1)
                else
                    white
            , hover [ backgroundColor nearTransparentBlack ]
            , active [ backgroundColor halfTransparentBlack ]
            , transition
                [ TRNS.background3 195 0 easeOut ]
            ]
        ]
        children


sidebarDivider : String -> Html msg
sidebarDivider text_ =
    HS.div
        [ css
            [ position relative
            , color halfTransparentBlack
            , borderBottom3 (px 1) solid nearTransparentBlack
            , backgroundColor nearTransparentBlack
            , padding4 (px 10) (px 5) (px 2) (px 5)
            , fontSize (Css.rem 0.667)
            , fontStyle Css.italic
            , textTransform Css.uppercase
            , userSelect Widgets.Private.CssExtra.none
            ]
        ]
        [ text text_ ]
