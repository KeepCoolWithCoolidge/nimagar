import ../core/core
import ../gui/gui

proc quit() =
  AG_QuitGUI()

proc main() =
  var
    win: ptr AG_Window
    sv: ptr AG_Scrollview
    hBox: ptr AG_Box

  if AG_InitCore("agar-scrollview-demo", 0) == -1 or AG_InitGraphics("") == -1:
    echo AG_GetError()
    return

  AG_BindGlobalKey(AG_KEY_ESCAPE, AG_KEYMOD_ANY, quit)

  win = AG_WindowNew(0)
  AG_WindowSetCaption(win, "Agar scrollview demo")

  discard AG_ButtonNew(win, 0, "Foo")
  sv = AG_ScrollviewNew(win, AG_SCROLLVIEW_EXPAND)

  # Create a bunch of buttons under the scrollview
  for y in 0..<20:
    hBox = AG_BoxNew(sv, AG_BOX_HORIZ, AG_BOX_HFILL)
    AG_BoxSetSpacing(hBox, 1)
    AG_BoxSetPadding(hBox, 0)
    for x in 0..<20:
      discard AG_ButtonNew(hBox, 0, "Foo\n%c\n%d", cast[char](0x41+x), y)
  discard AG_ButtonNew(win, 0, "Bar")

  discard AG_WindowSetGeometryAlignedPct(win, AG_WINDOW_MC, 50, 50)
  AG_WindowShow(win)

  discard AG_EventLoop()
  AG_Destroy()

main()
  