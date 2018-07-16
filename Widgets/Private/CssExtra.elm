module Widgets.Private.CssExtra exposing (userSelect, text, none, auto, all)

import Css exposing (Style, property)


type Compatible
    = Compatible


type alias UserSelect a =
    { a | userSelect : Compatible, value : String }


text : UserSelect {}
text =
    { userSelect = Compatible, value = "text" }


none : UserSelect {}
none =
    { userSelect = Compatible, value = "none" }


auto : UserSelect {}
auto =
    { userSelect = Compatible, value = "auto" }


all : UserSelect {}
all =
    { userSelect = Compatible, value = "all" }


userSelect : UserSelect a -> Style
userSelect { value } =
    Css.batch
        [ property "-webkit-touch-callout" value
        , property "-webkit-user-select" value
        , property "-khtml-user-select" value
        , property "-moz-user-select" value
        , property "-ms-user-select" value
        , property "-o-user-select" value
        , property "user-select" value
        ]
