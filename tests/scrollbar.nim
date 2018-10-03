import ../core/core
import ../gui/gui

var
  vInt: int32     =    50000
  minInt: int32   =  -100000
  maxInt: int32   =   100000
  visInt: int32   =        0
  vUint: uint32   =        0
  minUint: uint32 =        5
  maxUint: uint32 =       15
  visUint: uint32 =        0
  v16: int16        =      1
  min16: int16      =    -10
  max16: int16      =     10
  vis16: int16      =     -3
  v32: uint32     =     1234
  min32: uint32   =        1
  max32: uint32   =  1000000
  vis32: uint32   =        0
  vFlt: float32   =      1.0
  minFlt: float32 =      0.0
  maxFlt: float32 =     10.0
  visFlt: float32 =      0.0
  vDbl: float64   =      14.32
  minDbl: float64 =     -1e6
  maxDbl: float64 =      1e6
  visDbl: float64 =      0.0

proc quit() =
  AG_QuitGUI()

proc createWindow() =
  var
    win: ptr AG_Window
    lbl: ptr AG_Label
    sb: ptr AG_Scrollbar

  win = AG_WindowNew(0)
  AG_WindowSetCaption(win, "Agar scrollbar demo")

  lbl = AG_LabelNewPolled(win, AG_LABEL_HFILL, "Int binding: %d", addr(vInt))
  sb = AG_ScrollbarNew(win, AG_SCROLLBAR_HORIZ, AG_SCROLLBAR_HFILL)
  discard AG_BindInt(sb, "value", addr(vInt))
  discard AG_BindInt(sb, "min", addr(minInt))
  discard AG_BindInt(sb, "max", addr(maxInt))
  discard AG_BindInt(sb, "visible", addr(visInt))
  discard AG_SetInt(sb, "inc", 10)

  lbl = AG_LabelNewPolled(win, AG_LABEL_HFILL, "Uint binding: %d", addr(vUint))
  sb = AG_ScrollbarNew(win, AG_SCROLLBAR_HORIZ, AG_SCROLLBAR_HFILL)
  discard AG_BindUint(sb, "value", addr(vUint))
  discard AG_BindUint(sb, "min", addr(minUint))
  discard AG_BindUint(sb, "max", addr(maxUint))
  discard AG_BindUint(sb, "visible", addr(visUint))
  discard AG_SetUint(sb, "inc", 1)

  lbl = AG_LabelNewPolled(win, AG_LABEL_HFILL, "16-bit binding: %[s16]", addr(v16))
  sb = AG_ScrollbarNew(win, AG_SCROLLBAR_HORIZ, AG_SCROLLBAR_HFILL)
  discard AG_BindSint16(sb, "value", addr(v16))
  discard AG_BindSint16(sb, "min", addr(min16))
  discard AG_BindSint16(sb, "max", addr(max16))
  discard AG_BindSint16(sb, "visible", addr(vis16))
  discard AG_SetSint16(sb, "inc", 1)

  lbl = AG_LabelNewPolled(win, AG_LABEL_HFILL, "32-bit binding: %[s32]", addr(v32))
  sb = AG_ScrollbarNew(win, AG_SCROLLBAR_HORIZ, AG_SCROLLBAR_HFILL)
  discard AG_BindUint32(sb, "value", addr(v32))
  discard AG_BindUint32(sb, "min", addr(min32))
  discard AG_BindUint32(sb, "max", addr(max32))
  discard AG_BindUint32(sb, "visible", addr(vis32))
  discard AG_SetUint32(sb, "inc", 1)  

  lbl = AG_LabelNewPolled(win, AG_LABEL_HFILL, "Float binding: %f", addr(vFlt))
  sb = AG_ScrollbarNew(win, AG_SCROLLBAR_HORIZ, AG_SCROLLBAR_HFILL)
  discard AG_BindFloat(sb, "value", addr(vFlt))
  discard AG_BindFloat(sb, "min", addr(minFlt))
  discard AG_BindFloat(sb, "max", addr(maxFlt))
  discard AG_BindFloat(sb, "visible", addr(visFlt))
  discard AG_SetFloat(sb, "inc", 0.5)

  lbl = AG_LabelNewPolled(win, AG_LABEL_HFILL, "Double binding: %lf", addr(vDbl))
  sb = AG_ScrollbarNew(win, AG_SCROLLBAR_HORIZ, AG_SCROLLBAR_HFILL)
  discard AG_BindDouble(sb, "value", addr(vDbl))
  discard AG_BindDouble(sb, "min", addr(minDbl))
  discard AG_BindDouble(sb, "max", addr(maxDbl))
  discard AG_BindDouble(sb, "visible", addr(visDbl))
  discard AG_SetDouble(sb, "inc", 1)

  
  discard AG_WindowSetGeometryAligned(win, AG_WINDOW_MC, 320, -1)
  AG_WindowShow(win)

proc main() =
  if AG_InitCore("agar-scrollbar-demo", 0) == -1 or AG_InitGraphics("") == -1:
    echo AG_GetError()
    return

  AG_BindGlobalKey(AG_KEY_ESCAPE, AG_KEYMOD_ANY, quit)
  createWindow()
  discard AG_EventLoop()
  AG_Destroy()

main()