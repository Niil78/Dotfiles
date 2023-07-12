import XMonad
import XMonad.Util.EZConfig
import XMonad.Util.SpawnOnce
import qualified XMonad.StackSet as W
import XMonad.Hooks.DynamicLog
import XMonad.Util.Run (spawnPipe)
import System.IO
import Graphics.X11.ExtraTypes.XF86 (xF86XK_AudioLowerVolume, xF86XK_AudioRaiseVolume, xF86XK_AudioMute, xF86XK_AudioPlay, xF86XK_AudioPrev, xF86XK_AudioNext, xF86XK_MonBrightnessUp, xF86XK_MonBrightnessDown)
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Spiral
import XMonad.Util.Types (Direction2D(..))
import XMonad.Layout.LayoutModifier
import XMonad.Hooks.ManageHelpers
import Data.List (isInfixOf)
-- import Lib.FloatingWindows  -- Agrega la gestión de ventanas flotantes

myWorkspaces :: [String]
--myWorkspaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      --          1           2          3         4           5          6          7           8            9
      --                                                                                             󰙯
myWorkspaces = ["\xf269 ", "\xfa29 ", "\xe795 ", "\xf121 ", "\xf419 ", "\xf308 ", "\xf74a ", "\xf1bc ", "\xf066f "]

main = do
  -- KDECONNECT
  kdeconnect <- spawnPipe "kdeconnect-indicator &"
   -- Trayer
  trayer <- spawnPipe "trayer --edge bottom --widthtype pixel --width 120 --heighttype pixel --height 14 --align right --transparent true --alpha 0 --tint 0x000000 --iconspacing 5 --distance 1 &"
  -- Xmobar
  --Picom
  picom <- spawnPipe "picom --config ~/.config/picom/picom.conf -b"
  --Nitrogen (Wallpapers)
  nitrogen <- spawnPipe "nitrogen --restore &"
  --xmobar
  xmproc <- spawnPipe "xmobar"
  xmonad $ docks $ def
    { modMask = mod4Mask
    , startupHook = spawnOnce "xmobar"
    , layoutHook = avoidStrutsOn [D] $ layoutHook def
    , logHook = dynamicLogWithPP xmobarPP
                    { ppOutput = hPutStrLn xmproc
                    , ppTitle = xmobarColor "green" "" . shorten 50
                    }
    , workspaces = myWorkspaces
    , borderWidth = 0
--   , manageHook = myManageHook -- Agrega la gestión de ventanas flotantes
    } `additionalKeysP`
    -- Resto del código del archivo xmonad.hs
    [ -- Atajos del sistema (Matar ventanas y wlogout)
      ("M-q", kill)
      , ("M-S-q", spawn "wlogout")
      -- Atajos del sistema (Cambiar de foco)
      , ("M-<Up>", windows W.focusUp)
      , ("M-<Down>", windows W.focusDown)
      -- Atajos del sistema (Capturas de pantalla)
      , ("M-S-s", spawn "flameshot gui")

      -- Atajos del Sistema (Movimiento de ventanas)
      , ("M-S-<Up>", windows W.swapUp)
      , ("M-S-<Down>", windows W.swapDown)

      -- Atajos del Sistema (Redimensionar ventanas)
      , ("M-S-<Left>", sendMessage Shrink)
      , ("M-S-<Right>", sendMessage Expand)
      -- , ("M-M1-<Up>", sendMessage MirrorShrink) -- Esto no funciona
      -- , ("M-M1-<Down>", sendMessage MirrorExpand) -- Esto no funciona

      -- Lanzamiento de aplicaciones
      , ("M-<Return>", spawn "alacritty") -- Personaliza el comando según tu emulador de terminal preferido
      , ("M-n", spawn "brave-nightly")
      , ("M-d", spawn "~/.config/rofi/launchers/type-2/launcher.sh")
      , ("M-y", spawn "dolphin --platformtheme qt5ct")
    ]
    -- Desabilitar MOD + CLICKS.
    `additionalMouseBindings`
    [ ((mod4Mask, button1), \_ -> return ())
    , ((mod4Mask, button3), \_ -> return ())
    ]

    `additionalKeysP`
    myKeys

myKeys =
    [ -- Teclas de audio
      ("<XF86AudioPlay>", spawn "playerctl play-pause")
    , ("<XF86AudioPrev>", spawn "playerctl previous")
    , ("<XF86AudioNext>", spawn "playerctl next")
    , ("<XF86AudioRaiseVolume>", spawn "pactl set-sink-volume @DEFAULT_SINK@ +5%")
    , ("<XF86AudioLowerVolume>", spawn "pactl set-sink-volume @DEFAULT_SINK@ -5%")
    , ("<XF86AudioMute>", spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle")
    -- Brillo de pantalla (portail)
    , ("<XF86MonBrightnessUp>", spawn "brightnessctl s +10%")
    , ("<XF86MonBrightnessDown>", spawn "brightnessctl s 10%-")
    ]
