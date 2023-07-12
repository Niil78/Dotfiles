module FloatingWindows where

import XMonad
import XMonad.ManageHook

myFloatHook :: ManageHook
myFloatHook = composeAll
    [ className =? "qBittorrent" --> doFloat
    , title =? "Picture in picture" --> doFloat
    , className =? "wlogout" --> doFloat
    ]

myManageHook :: ManageHook
myManageHook = myFloatHook
