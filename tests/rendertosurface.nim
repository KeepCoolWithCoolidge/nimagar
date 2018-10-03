import ../core/core
import ../gui/gui

proc quit() =
  AG_QuitGUI()

proc viewCapture() =
  AG_ViewCapture()

proc main() =
  var 
    win: ptr AG_Window
    px: ptr AG_Pixmap
    btn: ptr AG_Button
    s: ptr AG_Surface

  if AG_InitCore("agar-rendertosurface-demo", 0) == -1 or AG_InitGraphics("") == -1:
    echo AG_GetError()
    return

  AG_BindGlobalKey(AG_KEY_ESCAPE, AG_KEYMOD_ANY, quit)
  AG_BindGlobalKey(AG_KEY_F8, AG_KEYMOD_ANY, viewCapture)

  win = AG_WindowNew(0)
  AG_WindowSetCaption(win, "Agar render-to-surface demo")
  btn = AG_ButtonNew(win, 0, "Some widget")
  AG_WindowShow(win)

  discard AG_EventLoop()
  AG_Destroy()

main()