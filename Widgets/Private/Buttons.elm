module Widgets.Private.Buttons exposing (..)

import Widgets.Private.Colors exposing (..)
import Css exposing (..)
import Css.Transitions as TRNS exposing (easeOut, transition)
import FontAwesome exposing (icon, trash)
import Html.Styled as HS exposing (..)
import Html.Styled.Attributes as SA exposing (..)
import Html.Styled.Events as SE exposing (..)
import Types.ButtonDef exposing (ButtonDef(..))


circleButton : Float -> Color -> msg -> List (Html msg) -> Html msg
circleButton size color_ msg children =
    HS.button
        [ onClick msg
        , css
            [ backgroundColor color_
            , color <| contrast Opaque color_
            , Css.width <| px size
            , Css.height <| px size
            , borderRadius <| px <| size * 0.5
            , fontSize <| px <| size * 7 / 12
            , textAlign <| center
            , lineHeight <| px size
            , boxShadow5 (px 0) (px 2) (px 2) (px -1) nearOpaqueBlack
            , margin <| px 5
            , cursor pointer
            , border (px 0)
            , padding (px 0)
            , transition
                [ TRNS.opacity3 195 0 easeOut
                , TRNS.transform3 195 0 easeOut
                ]
            , active [ opacity <| num 0.5, transform <| translateY <| px 1 ]
            , focus [ outline none ]
            ]
        ]
        children


rectangleButton : Float -> Color -> msg -> List (Html msg) -> Html msg
rectangleButton size color_ msg children =
    HS.button
        [ onClick msg
        , css
            [ backgroundColor color_
            , color <| contrast Opaque color_
            , Css.height <| px size
            , borderRadius <| px 2
            , fontSize <| px <| size * 7 / 12
            , textAlign <| center
            , lineHeight <| px size
            , boxShadow5 (px 0) (px 2) (px 2) (px -1) nearOpaqueBlack
            , margin <| px 5
            , cursor pointer
            , border (px 0)
            , padding2 (px 0) (px 15)
            , transition
                [ TRNS.opacity3 195 0 easeOut
                , TRNS.transform3 80 0 easeOut
                , TRNS.boxShadow3 80 0 easeOut
                ]
            , whiteSpace noWrap
            , active
                [ opacity <| num 0.7
                , transform <| translateY <| px 1
                , boxShadow4 (px 0) (px 1) (px 0) nearTransparentBlack
                ]
            , focus [ outline none ]
            ]
        ]
        children


clearCircleButton : Float -> msg -> List (Html msg) -> Html msg
clearCircleButton size msg children =
    HS.button
        [ onClick msg
        , css
            [ backgroundColor Css.transparent
            , Css.width <| px size
            , Css.height <| px size
            , borderRadius <| px <| size * 0.5
            , fontSize <| px <| size * 7 / 12
            , textAlign <| center
            , lineHeight <| px size
            , marginLeft <| px 5
            , color inherit
            , cursor pointer
            , border (px 0)
            , padding (px 0)
            , transition
                [ TRNS.background3 195 0 easeOut
                ]
            , hover [ backgroundColor <| rgba 255 255 255 0.1 ]
            , active [ backgroundColor <| rgba 255 255 255 0.5 ]
            , focus [ outline none ]
            ]
        ]
        children


clearRectangleButton : Float -> Bool -> msg -> List (Html msg) -> Html msg
clearRectangleButton size active_ msg children =
    HS.button
        [ onClick msg
        , css <|
            [ backgroundColor Css.transparent
            , fontSize <| px <| size * 7 / 12
            , textAlign <| center
            , lineHeight <| px size
            , margin <| px 5
            , color inherit
            , cursor pointer
            , border3 (px 2) solid Css.transparent
            , whiteSpace noWrap
            , opacity <|
                if active_ then
                    num 1
                else
                    num 0.5
            , transition
                [ TRNS.background3 195 0 easeOut
                , TRNS.border3 195 0 easeOut
                , TRNS.opacity3 195 0 easeOut
                ]
            , hover [ backgroundColor <| rgba 255 255 255 0.3 ]
            , active [ backgroundColor <| rgba 255 255 255 0.5 ]
            , focus [ outline none ]
            ]
                ++ if active_ then
                    [ borderBottom2 (px 2) solid ]
                   else
                    [ borderBottom3 (px 2) solid Css.transparent ]
        ]
        children


renderContents : ButtonDef -> List (Html msg)
renderContents def =
    (case def of
        IconOnly icon_ ->
            [ icon icon_ |> HS.fromUnstyled ]

        IconLeft icon_ text_ ->
            [ icon icon_ |> HS.fromUnstyled, span [ css [ marginLeft (px 5) ] ] [ text text_ ] ]

        IconRight text_ icon_ ->
            [ span [ css [ marginRight (px 5) ] ] [ text text_ ], icon icon_ |> HS.fromUnstyled ]

        TextOnly text_ ->
            [ text text_ ]
    )
