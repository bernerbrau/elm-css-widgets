module Widgets.Button exposing (..)

import Css exposing (..)
import Css.Transitions as TRNS exposing (easeOut, transition)
import FontAwesome exposing (icon, trash)
import Html.Styled as HS exposing (..)
import Html.Styled.Attributes as SA exposing (..)
import Html.Styled.Events as SE exposing (..)
import Types.ButtonDef exposing (ButtonDef)
import Widgets.Private.Buttons exposing (rectangleButton, renderContents)


button : Float -> Color -> ButtonDef -> msg -> Html msg
button size color_ def msg =
    rectangleButton size color_ msg <|
        renderContents def
