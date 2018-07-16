module Widgets.Private.Colors exposing (..)

import Css
import Color


black =
    Css.rgb 0 0 0


white =
    Css.rgb 255 255 255


nearOpaqueWhite =
    Css.rgba 255 255 255 0.8


nearOpaqueBlack =
    Css.rgba 0 0 0 0.8


nearTransparentWhite =
    Css.rgba 255 255 255 0.2


nearTransparentBlack =
    Css.rgba 0 0 0 0.2


halfTransparentWhite =
    Css.rgba 255 255 255 0.5


halfTransparentBlack =
    Css.rgba 0 0 0 0.5


type Opacity
    = Opaque
    | NearOpaque
    | Half
    | NearTransparent


contrast : Opacity -> Css.Color -> Css.Color
contrast opacity { red, green, blue, alpha } =
    let
        { lightness } =
            Color.toHsl <| Color.rgba red green blue alpha
    in
        if lightness <= 0.6 then
            case opacity of
                Opaque ->
                    white

                NearOpaque ->
                    nearOpaqueWhite

                Half ->
                    halfTransparentWhite

                NearTransparent ->
                    nearTransparentWhite
        else
            case opacity of
                Opaque ->
                    black

                NearOpaque ->
                    nearOpaqueBlack

                Half ->
                    halfTransparentBlack

                NearTransparent ->
                    nearTransparentBlack
