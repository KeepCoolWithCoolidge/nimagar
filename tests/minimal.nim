import ../core/core
import ../gui/gui

proc quit() =
  AG_QuitGUI()

proc main() =
  if (AG_InitCore("agar-minimal-demo", 0) == -1 or 
    AG_InitGraphics("") == -1):
    echo AG_GetError()
    return

  AG_BindGlobalKey(AG_KEY_ESCAPE, AG_KEYMOD_ANY, quit)

  var win = AG_WindowNew(AG_WINDOW_PLAIN)
  discard AG_LabelNew(win, 0 , "Minimal!")
  AG_WindowShow(win)

  discard AG_EventLoop()
  AG_Destroy()
  return

main()