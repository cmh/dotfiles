import XMonad
import XMonad.Hooks.DynamicLog

myManageHook = composeAll (
    [ manageHook defaultConfig
    , className =? "Unity-2d-panel" --> doIgnore
    , className =? "Unity-2d-launcher" --> doIgnore
    , className =? "Google-chrome" --> doShift "8:chrome"
    , className =? "Skype" --> doShift "9:skype"
    , className =? "Pgadmin3" --> doShift "5:pgadmin"
    , className =? "Eclipse" --> doShift "6:eclipse"
    , className =? "X-terminal-emulator" --> doShift "1:terminals"
    ])

myWorkspaces = ["1:terminals", "2", "3", "4", "5:pgadmin", "6:eclipse", "7", "8:chrome", "9:skype"]

main = xmonad =<< xmobar defaultConfig 
    { manageHook = myManageHook 
    , workspaces = myWorkspaces
    , modMask = mod4Mask
    }
