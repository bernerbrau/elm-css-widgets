module Widgets.BarTabs exposing (..)

import Css exposing (..)
import FontAwesome
import Html.Styled as HS exposing (..)
import Html.Styled.Attributes as SA exposing (..)
import Types.ButtonDef exposing (ButtonDef)
import Widgets.Private.Buttons exposing (clearRectangleButton, renderContents)


barTabs : List ( ButtonDef, Bool, msg ) -> Html msg
barTabs tabs =
    HS.div
        [ css
            [ flex (num 3)
            , displayFlex
            , backgroundColor Css.transparent
            , flexDirection row
            , justifyContent flexEnd
            , flexWrap noWrap
            , alignItems flexEnd
            ]
        ]
        (let
            size =
                List.length tabs
         in
            List.foldl
                (\( def, active, msg ) tabsHtml ->
                    let
                        tabHtml =
                            clearRectangleButton 30 active msg <|
                                renderContents def

                        divider () =
                            div
                                [ css
                                    [ display inline
                                    , margin2 (px 0) (px 15)
                                    , Css.height (px 45)
                                    , Css.width (px 0)
                                    , borderLeft2 (px 1) solid
                                    , opacity (num 0.8)
                                    ]
                                ]
                                []
                    in
                        case tabsHtml of
                            [] ->
                                [ tabHtml ]

                            html ->
                                tabHtml :: divider () :: html
                )
                []
                tabs
        )
