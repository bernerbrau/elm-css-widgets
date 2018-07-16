module Widgets.IconButton exposing (..)

import Css exposing (..)
import Css.Transitions as TRNS exposing (easeOut, transition)
import FontAwesome exposing (icon, trash)
import Html.Styled as HS exposing (..)
import Html.Styled.Attributes as SA exposing (..)
import Html.Styled.Events as SE exposing (..)
import Widgets.Private.Buttons exposing (circleButton)


iconButton : Float -> Color -> FontAwesome.Icon -> msg -> Html msg
iconButton size color_ icon_ msg =
    circleButton size
        color_
        msg
        [ icon icon_ |> HS.fromUnstyled ]
