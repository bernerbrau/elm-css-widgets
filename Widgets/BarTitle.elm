module Widgets.BarTitle exposing (..)

{-| App bar title

@docs barTitle

-}

import Css exposing (..)
import Html.Styled as HS exposing (..)
import Html.Styled.Attributes as SA exposing (..)
import Widgets.Private.Colors exposing (contrast)


{-| -}
barTitle : String -> Html msg
barTitle title =
    HS.div
        [ css
            [ flex (num 2)
            , backgroundColor Css.transparent
            , justifyContent flexStart
            , alignItems center
            , margin2 (px 0) (px 5)
            ]
        ]
        [ text title ]
