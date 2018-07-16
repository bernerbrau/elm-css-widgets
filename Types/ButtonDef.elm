module Types.ButtonDef exposing (..)

import FontAwesome


type ButtonDef
    = IconOnly FontAwesome.Icon
    | TextOnly String
    | IconLeft FontAwesome.Icon String
    | IconRight String FontAwesome.Icon
