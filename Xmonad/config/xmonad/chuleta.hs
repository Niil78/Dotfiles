    , ((modm,               xK_Tab   ), windows W.focusDown)
    , ((modm,               xK_j     ), windows W.focusDown)
    , ((modm,               xK_k     ), windows W.focusUp  )
    , ((modm,               xK_m     ), windows W.focusMaster  )


    Cambiar Focus
    ((windows + tab), windows W.focusDown)


    aplicaciones de inicio de sesion:
    kdeconnect-indicator
    picom --config /home/niil/.config/picom/picom.conf
    dropbox
    nitrogen --restore &

    -- Atajos de teclado Aplicaciones:
    Windows + N = brave-nigthly
    Windows + Y = dolphin --platformtheme qt5ct
    Windows + D = ~/.config/rofi/launchers/type-2/launcher.sh
    Windows + Shift + D = CerrarSesion/Apagar/Reiniciar/Bloquear0

    -- Atajos mover ventanas:
    Windows + derecha = moverDerecha
    Windows + izquierda= moverIzquierda
    Windows + abajo = moverAbajo
    Windows + arriba = moverArriba

    -- Otros Sistema
    Windows + f = Pantalla completa
    Windows + Alt + Space = hacer ventana flotante
    Windows + Alt + retroceso = hacer ventana no flotante

    -- Cambiar de escritorio
    Windows + Control + Derecha = Cambiar a escritorio +1  >
    Windows + Control + Izquierda= Cambiar a escritorio -1 <



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



    ---
    --xmobar
    <action>%UnsafeStdinReader%</action> -- << Muestra los escritorios.
