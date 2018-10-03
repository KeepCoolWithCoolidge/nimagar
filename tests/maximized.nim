import ../gui/gui
import ../core/core

proc quit() =
  AG_QuitGUI()

proc viewCapture() =
  AG_ViewCapture()

proc createWindow() =
  var 
    win: ptr AG_Window
    lbl: ptr AG_Label
    table: ptr AG_Table

  # Create a window without titlebar or decorations
  win = AG_WindowNew(AG_WINDOW_PLAIN)
  AG_WindowSetCaption(win, "Agar maximized window demo")

  # Disable the default spacing at the window's edges.
  AG_WindowSetPadding(win, 0, 0, 0, 0)

  lbl = AG_LabelNew(win, AG_LABEL_HFILL, "Agar maximized window demo")
  AG_LabelJustify(lbl, AG_TEXT_CENTER)
  discard AG_SpacerNew(win, AG_SEPARATOR_HORIZ)

  # Create an example table
  table = AG_TableNew(win, AG_TABLE_EXPAND)
  discard AG_TableAddCol(table, "Foo", "<8888>", nil)
  discard AG_TableAddCol(table, "Bar", nil, nil)
  for i in 0..<100:
    discard AG_TableAddRow(table, "%d:%s", i, "Foo")

  # Resize the window to cover the whole view
  AG_WindowMaximize(win)

  # The window is ready to be displayed
  AG_WindowShow(win)

proc main() =
  if (AG_InitCore("agar-maximized-demo", 0) == -1) or (AG_InitGraphics("") == -1):
    echo AG_GetError()
    return

  AG_BindGlobalKey(AG_KEY_ESCAPE, AG_KEYMOD_ANY, quit)
  AG_BindGlobalKey(AG_KEY_F8, AG_KEYMOD_ANY, viewCapture)
  createWindow()
  discard AG_EventLoop()
  AG_Destroy()
  return

main()
  