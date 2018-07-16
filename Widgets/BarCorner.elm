module Widgets.BarCorner exposing (..)

import Css exposing (..)
import Css.Transitions as TRNS exposing (easeOut, transition)
import FontAwesome
import Html.Styled as HS exposing (..)
import Html.Styled.Attributes as SA exposing (..)
import Html.Styled.Events as SE exposing (..)
import Widgets.Private.Buttons exposing (clearCircleButton)


type BarCornerSide
    = LeftSide
    | RightSide


barCorner : BarCornerSide -> List ( FontAwesome.Icon, msg ) -> Html msg
barCorner side children =
    HS.div
        [ css
            [ flex (num 0)
            , backgroundColor Css.transparent
            , displayFlex
            , flexDirection row
            , justifyContent flexStart
            , alignItems center
            , (case side of
                LeftSide ->
                    marginLeft (px 10)

                RightSide ->
                    marginRight (px 10)
              )
            ]
        ]
    <|
        List.map
            (\( icon, msg ) ->
                clearCircleButton 30
                    msg
                    [ FontAwesome.icon icon |> HS.fromUnstyled ]
            )
            children
