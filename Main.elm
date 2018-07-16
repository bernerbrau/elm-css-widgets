module Main exposing (main)

import Crayola exposing (..)
import Css exposing (..)
import FontAwesome exposing (..)
import Html.Styled exposing (div, fromUnstyled, li, program, text, ul)
import Html.Styled.Attributes exposing (css)
import Types.ButtonDef exposing (ButtonDef(..))
import Widgets.Bar exposing (..)
import Widgets.BarCorner exposing (..)
import Widgets.BarTabs exposing (..)
import Widgets.BarTitle exposing (..)
import Widgets.Button exposing (..)
import Widgets.HorizontalFlow exposing (horizontalFlow)
import Widgets.IconButton exposing (iconButton)
import Widgets.Page exposing (page)
import Widgets.Paper exposing (paper)
import Widgets.Screen exposing (screen)
import Widgets.Sidebar exposing (sidebar, sidebarDivider, sidebarItem)
import Widgets.VerticalFlow exposing (verticalFlow)


summary active title subtitle aside =
    sidebarItem active
        [ horizontalFlow
            [ verticalFlow
                [ div [ css [ fontWeight Css.bold, fontSize (em 1.3) ] ] [ text title ]
                , div [ css [ fontStyle Css.italic, color (rgba 0 0 0 0.8) ] ] [ text subtitle ]
                ]
            , div [ css [ color (rgba 0 0 0 0.8) ] ]
                [ text aside ]
            ]
        ]


main : Program Never () ()
main =
    program
        { init = ( (), Cmd.none )
        , view =
            \() ->
                screen periwinkle
                    [ FontAwesome.useCss |> fromUnstyled
                    , bar indigo
                        Top
                        [ barCorner LeftSide [ ( bars, () ) ]
                        , barTitle "Application Title"
                        , barTabs
                            [ ( IconLeft home "Home", False, () )
                            , ( IconRight "Profile" user, True, () )
                            , ( IconOnly questionCircle, False, () )
                            , ( TextOnly "Settings", False, () )
                            ]
                        , barCorner RightSide [ ( ellipsisVertical, () ) ]
                        ]
                    , horizontalFlow
                        [ sidebar
                            [ sidebarDivider "Unscheduled"
                            , summary False "Item 1" "Author" "Note"
                            , sidebarDivider "Sun 15 Jul 2018"
                            , summary True "Item 2" "Author" "9:00 AM"
                            , summary False "Item 3" "Author" "12:00 PM"
                            ]
                        , page
                            [ paper
                                [ iconButton 15 red trash ()
                                , iconButton 20 screaminGreen pencilAlt ()
                                , iconButton 25 purple flag ()
                                , iconButton 30 yellowOrange home ()
                                , iconButton 35 pacificBlue eyeSlash ()
                                , button 20 screaminGreen (IconLeft paperPlane "Send") ()
                                , button 25 purple (TextOnly "Edit") ()
                                , button 30 brickRed (IconRight "Home" home) ()
                                , ul []
                                    [ li [] [ text "Chips" ]
                                    , li [] [ text "Floating Autocomplete" ]
                                    , li [] [ text "Date/Time Picker" ]
                                    , li [] [ text "Text Input" ]
                                    , li [] [ text "Modal Dialogs" ]
                                    , li [] [ text "Modal Loaders" ]
                                    , li [] [ text "Menus" ]
                                    , li [] [ text "Responsive Media Queries" ]
                                    ]
                                ]
                            ]
                        ]
                    , bar almond Bottom [ barTitle "Bottom Bar" ]
                    ]
        , update = \() -> \() -> ( (), Cmd.none )
        , subscriptions = \model -> Sub.none
        }
