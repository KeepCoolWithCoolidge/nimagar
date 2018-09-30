import ../core/core
import posix

when defined(windows):
  const LIBAG_GUI = "libag_gui.dll"
elif defined(macosx):
  const LIBAG_GUI = "libag_gui.dylib"
else:
  const LIBAG_GUI = "libag_gui.so(|.0)"

{.pragma: libag_gui, cdecl, dynlib: LIBAG_GUI.}

const
  AG_WINDOW_CAPTION_MAX* = 96
  AG_LABEL_MAX* = 1024
  AG_STYLE_VALUE_MAX* = 128
  AG_TOOLBAR_MAX_ROWS* = 8
  AG_TLIST_LABEL_MAX* = AG_LABEL_MAX
  AG_TREETBL_LABEL_MAX* = AG_LABEL_MAX
  AG_GRAPH_LABEL_MAX* = AG_LABEL_MAX

const
  AG_FSPINBUTTON_NOHFILL* = 0x00000001
  AG_FSPINBUTTON_VFILL* = 0x00000002

const
  AG_TREETBL_ROW_EXPANDED* = 0x00000001
  AG_TREETBL_ROW_DYNAMIC* = 0x00000002
  AG_TREETBL_ROW_SELECTED* = 0x00000004

const
  AG_FONT_BOLD* = 0x00000001
  AG_FONT_ITALIC* = 0x00000002
  AG_FONT_UNDERLINE* = 0x00000004
  AG_FONT_UPPERCASE* = 0x00000008

const
  AG_TABLE_COL_FILL* = 0x00000001
  AG_TABLE_SORT_ASCENDING* = 0x00000002
  AG_TABLE_SORT_DESCENDING* = 0x00000004
  AG_TABLE_HFILL* = 0x00000008
  AG_TABLE_VFILL* = 0x00000010
  AG_TABLE_EXPAND* = (AG_TABLE_HFILL or AG_TABLE_VFILL)

const
  AG_FILEDLG_MULTI* = 0x00000001
  AG_FILEDLG_CLOSEWIN* = 0x00000002
  AG_FILEDLG_LOAD* = 0x00000004
  AG_FILEDLG_SAVE* = 0x00000008
  AG_FILEDLG_ASYNC* = 0x00000010
  AG_FILEDLG_RESET_ONSHOW* = 0x00000020
  AG_FILEDLG_HFILL* = 0x00000100
  AG_FILEDLG_VFILL* = 0x00000200
  AG_FILEDLG_EXPAND* = (AG_FILEDLG_HFILL or AG_FILEDLG_VFILL)
  AG_FILEDLG_NOBUTTONS* = 0x00000400
  AG_FILEDLG_MASK_EXT* = 0x00000800
  AG_FILEDLG_MASK_HIDDEN* = 0x00001000
  AG_FILEDLG_NOMASKOPTS* = 0x00002000
  AG_FILEDLG_NOTYPESELECT* = 0x00004000
  

const
  AG_FILE_SELECTOR_HFILL* = 0x00000001
  AG_FILE_SELECTOR_VFILL* = 0x00000002
  AG_FILE_SELECTOR_EXPAND* = (AG_FILE_SELECTOR_HFILL or AG_FILE_SELECTOR_VFILL)
  AG_FILE_SELECTOR_ANY_FILE* = 0x00000004

const
  AG_DRIVER_MW_OPEN* = 0x00000001

const
  AG_WIDGET_NSTATES* = 5
  AG_WIDGET_NCOLORS* = 5

const
  AG_SRCCOLORKEY* = 0x01
  AG_SRCALPHA* = 0x02
  AG_SAVED_ANIM_FLAGS* = (AG_SRCCOLORKEY or AG_SRCALPHA)

const
  AG_ANIM_LOOP* = 0x00000001
  AG_ANIM_PINGPONG* = 0x00000002
  AG_ANIM_REVERSE* = 0x00000004

const
  AG_BOX_HOMOGENOUS* = 0x00000001
  AG_BOX_HFILL* = 0x00000002
  AG_BOX_VFILL* = 0x00000004
  AG_BOX_FRAME* = 0x00000008
  AG_BOX_EXPAND* = (AG_BOX_HFILL or AG_BOX_VFILL)

const
  AG_VBOX_HOMOGENOUS* = AG_BOX_HOMOGENOUS
  AG_VBOX_HFILL* = AG_BOX_HFILL
  AG_VBOX_VFILL* = AG_BOX_VFILL
  AG_VBOX_EXPAND* = (AG_BOX_HFILL or AG_BOX_VFILL)
  
const
  AG_PROGRESS_BAR_HFILL* = 0x00000001
  AG_PROGRESS_BAR_VFILL* = 0x00000002
  AG_PROGRESS_BAR_SHOW_PCT* = 0x00000004
  AG_PROGRESS_BAR_EXCL* = 0x00000008
  AG_PROGRESS_BAR_EXPAND* = (AG_PROGRESS_BAR_HFILL or AG_PROGRESS_BAR_VFILL)

const
  AG_BUTTON_STICKY* = 0x00000002
  AG_BUTTON_REPEAT* = 0x00000008
  AG_BUTTON_HFILL* = 0x00000010
  AG_BUTTON_VFILL* = 0x00000020
  AG_BUTTON_INVSTATE* = 0x00000400
  AG_BUTTON_KEYDOWN* = 0x00000800
  AG_BUTTON_EXCL* = 0x00001000
  AG_BUTTON_NOEXCL* = 0x00002000
  AG_BUTTON_EXPAND* = (AG_BUTTON_HFILL or AG_BUTTON_VFILL)

const
  AG_CHECKBOX_HFILL* = 0x00000001
  AG_CHECKBOX_VFILL* = 0x00000002
  AG_CHECKBOX_EXPAND* = (AG_CHECKBOX_HFILL or AG_CHECKBOX_VFILL)
  AG_CHECKBOX_SET* = 0x00000004

const
  AG_COMBO_POLL* = 0x00000001
  AG_COMBO_TREE* = 0x00000002
  AG_COMBO_ANY_TEXT* = 0x00000004
  AG_COMBO_HFILL* = 0x00000008
  AG_COMBO_VFILL* = 0x00000010
  AG_COMBO_SCROLLTOSEL* = 0x00000040
  AG_COMBO_EXPAND* = (AG_COMBO_HFILL or AG_COMBO_VFILL)

const
  AG_NOTEBOOK_HFILL* = 0x00000001
  AG_NOTEBOOK_VFILL* = 0x00000002
  AG_NOTEBOOK_HIDE_TABS* = 0x00000004
  AG_NOTEBOOK_EXPAND* = (AG_NOTEBOOK_HFILL or AG_NOTEBOOK_VFILL)

const
  AG_CONSOLE_HFILL* = 0x00000001
  AG_CONSOLE_VFILL* = 0x00000002
  AG_CONSOLE_NOAUTOSCROLL* = 0x00000004
  AG_CONSOLE_NOPOPUP* = 0x00000008
  AG_CONSOLE_EXPAND* = (AG_CONSOLE_HFILL or AG_CONSOLE_VFILL)
  AG_CONSOLE_SELECTING* = 0x00000010

const
  AG_DEFAULT_CURSOR* = 0
  AG_FILL_CURSOR* = 1
  AG_ERASE_CURSOR* = 2
  AG_PICK_CURSOR* = 3
  AG_HRESIZE_CURSOR* = 4
  AG_VRESIZE_CURSOR* = 5
  AG_LRDIAG_CURSOR* = 6
  AG_LLDIAG_CURSOR* = 7
  AG_TEXT_CURSOR* = 8
  AG_LAST_CURSOR* = 9
  
const
  AG_FIXED_HFILL* = 0x00000001
  AG_FIXED_VFILL* = 0x00000002
  AG_FIXED_NO_UPDATE* = 0x00000004
  AG_FIXED_FILLBG* = 0x00000008
  AG_FIXED_BOX* = 0x00000010
  AG_FIXED_INVBOX* = 0x00000020
  AG_FIXED_FRAME* = 0x00000040
  AG_FIXED_EXPAND* = (AG_FIXED_HFILL or AG_FIXED_VFILL)

const
  AG_DIRDLG_MULTI* = 0x00000001
  AG_DIRDLG_CLOSEWIN* = 0x00000002
  AG_DIRDLG_LOAD* = 0x00000004
  AG_DIRDLG_SAVE* = 0x00000008
  AG_DIRDLG_ASYNC* = 0x00000010
  AG_DIRDLG_RESET_ONSHOW* = 0x00000020
  AG_DIRDLG_HFILL* = 0x00000100
  AG_DIRDLG_VFILL* = 0x00000200
  AG_DIRDLG_EXPAND* = (AG_DIRDLG_HFILL or AG_DIRDLG_VFILL)
  AG_DIRDLG_NOBUTTONS* = 0x00000400

const
  AG_DRIVER_OPENGL* = 0x00000001
  AG_DRIVER_SDL* = 0x00000002
  AG_DRIVER_TEXTURES* = 0x00000004

const
  AG_TTF_STYLE_NORMAL* = 0x00000000
  AG_TTF_STYLE_BOLD* = 0x00000001
  AG_TTF_STYLE_ITALIC* = 0x00000002
  AG_TTF_STYLE_UNDERLINE* = 0x00000004
  AG_UCOMBO_HFILL* = 0x00000001
  AG_UCOMBO_VFILL* = 0x00000002
  AG_UCOMBO_SCROLLTOSEL* = 0x00000040
  AG_UCOMBO_EXPAND* = (AG_UCOMBO_HFILL or AG_UCOMBO_VFILL)

const
  AG_DRIVER_SW_OVERLAY* = 0x00000001
  AG_DRIVER_SW_BGPOPUP* = 0x00000002
  AG_DRIVER_SW_FULLSCREEN* = 0x00000004
  AG_DRIVER_SW_REDRAW* = 0x00000008

const
  AG_EDITABLE_HFILL* = 0x00000001
  AG_EDITABLE_VFILL* = 0x00000002
  AG_EDITABLE_EXPAND* = (AG_EDITABLE_HFILL or AG_EDITABLE_VFILL)
  AG_EDITABLE_MULTILINE* = 0x00000004
  AG_EDITABLE_BLINK_ON* = 0x00000008
  AG_EDITABLE_PASSWORD* = 0x00000010
  AG_EDITABLE_ABANDON_FOCUS* = 0x00000020
  AG_EDITABLE_INT_ONLY* = 0x00000040
  AG_EDITABLE_FLT_ONLY* = 0x00000080
  AG_EDITABLE_CATCH_TAB* = 0x00000100
  AG_EDITABLE_CURSOR_MOVING* = 0x00000200
  AG_EDITABLE_KEEPVISCURSOR* = 0x00000800
  AG_EDITABLE_MARKPREF* = 0x00002000
  AG_EDITABLE_EXCL* = 0x00004000
  AG_EDITABLE_NOEMACS* = 0x00008000
  AG_EDITABLE_NOLATIN1* = 0x00020000
  AG_EDITABLE_WORDWRAP* = 0x00040000
  AG_EDITABLE_NOPOPUP* = 0x00080000
  AG_EDITABLE_WORDSELECT* = 0x00100000
  AG_EDITABLE_READONLY* = 0x00200000
  AG_EDITABLE_MULTILINGUAL* = 0x00400000

const
  AG_TABLE_CELL_NOCOMPARE* = 0x00000001

const
  AG_TEXTBOX_MULTILINE* = 0x00000001
  AG_TEXTBOX_PASSWORD* = 0x00000004
  AG_TEXTBOX_ABANDON_FOCUS* = 0x00000008
  AG_TEXTBOX_COMBO* = 0x00000010
  AG_TEXTBOX_HFILL* = 0x00000020
  AG_TEXTBOX_VFILL* = 0x00000040
  AG_TEXTBOX_EXPAND* = (AG_TEXTBOX_HFILL or AG_TEXTBOX_VFILL)
  AG_TEXTBOX_READONLY* = 0x00000100
  AG_TEXTBOX_INT_ONLY* = 0x00000200
  AG_TEXTBOX_FLT_ONLY* = 0x00000400
  AG_TEXTBOX_CATCH_TAB* = 0x00000800
  AG_TEXTBOX_CURSOR_MOVING* = 0x00001000
  AG_TEXTBOX_EXCL* = 0x00004000
  AG_TEXTBOX_NOEMACS* = 0x00008000
  AG_TEXTBOX_NOLATIN1* = 0x00020000
  AG_TEXTBOX_WORDWRAP* = 0x00040000
  AG_TEXTBOX_NOPOPUP* = 0x00080000
  AG_TEXTBOX_MULTILINGUAL* = 0x00100000


const
  TTF_CACHED_METRICS* = 0x00000010
  TTF_CACHED_BITMAP* = 0x00000001
  TTF_CACHED_PIXMAP* = 0x00000002

const
  AG_TITLEBAR_NO_CLOSE* = 0x00000001
  AG_TITLEBAR_NO_MINIMIZE* = 0x00000002
  AG_TITLEBAR_NO_MAXIMIZE* = 0x00000004

const
  AG_GRAPH_MOUSEOVER* = 0x00000001
  AG_GRAPH_SELECTED* = 0x00000002
  AG_GRAPH_HIDDEN* = 0x00000004
  AG_GRAPH_AUTOPLACED* = 0x00000008

const
  AG_TLIST_EXPANDED* = 0x00000001
  AG_TLIST_HAS_CHILDREN* = 0x00000002
  AG_TLIST_DYNICON* = 0x00000004
  AG_TLIST_NO_SELECT* = 0x00000008
  AG_TLIST_NO_POPUP* = 0x00000010
  AG_TLIST_VISIBLE_CHILDREN* = AG_TLIST_EXPANDED

const
  AG_TLIST_MULTI* = 0x00000001
  AG_TLIST_MULTITOGGLE* = 0x00000002
  AG_TLIST_POLL* = 0x00000004
  AG_TLIST_TREE* = 0x00000010
  AG_TLIST_HFILL* = 0x00000020
  AG_TLIST_VFILL* = 0x00000040
  AG_TLIST_NOSELSTATE* = 0x00000100
  AG_TLIST_SCROLLTOSEL* = 0x00000200
  AG_TLIST_REFRESH* = 0x00000400
  AG_TLIST_EXPAND* = (AG_TLIST_HFILL or AG_TLIST_VFILL)

const
  AG_TOOLBAR_HOMOGENOUS* = 0x00000001
  AG_TOOLBAR_STICKY* = 0x00000002
  AG_TOOLBAR_MULTI_STICKY* = 0x00000004
  AG_TOOLBAR_HFILL* = 0x00000008
  AG_TOOLBAR_VFILL* = 0x00000010
  AG_TOOLBAR_EXPAND* = (AG_TOOLBAR_HFILL or AG_TOOLBAR_VFILL)

const
  AG_TREETBL_COL_DYNAMIC* = 0x00000001
  AG_TREETBL_COL_EXPANDER* = 0x00000002
  AG_TREETBL_COL_RESIZABLE* = 0x00000004
  AG_TREETBL_COL_MOVING* = 0x00000008
  AG_TREETBL_COL_FILL* = 0x00000020
  AG_TREETBL_COL_SELECTED* = 0x00000040
  AG_TREETBL_COL_SORTING* = 0x00000080

const
  AG_TABLE_COL_SELECT* = 0x00000001
  AG_TABLE_COL_SORT* = 0x00000002
  AG_TABLE_MULTI* = 0x00000001
  AG_TABLE_MULTITOGGLE* = 0x00000002
  AG_TABLE_REDRAW_CELLS* = 0x00000004
  AG_TABLE_POLL* = 0x00000008
  AG_TABLE_HIGHLIGHT_COLS* = 0x00000040
  AG_TABLE_WIDGETS* = 0x00000080
  AG_TABLE_MULTIMODE* = (AG_TABLE_MULTI or AG_TABLE_MULTITOGGLE)
  AG_TABLE_NOAUTOSORT* = 0x00000100
  AG_TABLE_NEEDSORT* = 0x00000200

const
  AG_TREETBL_MULTI* = 0x00000001
  AG_TREETBL_MULTITOGGLE* = 0x00000002
  AG_TREETBL_REORDERCOLS* = 0x00000004
  AG_TREETBL_NODUPCHECKS* = 0x00000008
  AG_TREETBL_SORT* = 0x00000010
  AG_TREETBL_POLLED* = 0x00000020
  AG_TREETBL_HFILL* = 0x00000040
  AG_TREETBL_VFILL* = 0x00000080
  AG_TREETBL_EXPAND* = (AG_TREETBL_HFILL or AG_TREETBL_VFILL)

const
  AG_WIDGET_FOCUSABLE* = 0x00000001
  AG_WIDGET_FOCUSED* = 0x00000002
  AG_WIDGET_UNFOCUSED_MOTION* = 0x00000004
  AG_WIDGET_UNFOCUSED_BUTTONUP* = 0x00000008
  AG_WIDGET_UNFOCUSED_BUTTONDOWN* = 0x00000010
  AG_WIDGET_VISIBLE* = 0x00000020
  AG_WIDGET_HFILL* = 0x00000040
  AG_WIDGET_VFILL* = 0x00000080
  AG_WIDGET_USE_OPENGL* = 0x00000100
  AG_WIDGET_HIDE_C* = 0x00000200
  AG_WIDGET_DISABLED* = 0x00000400
  AG_WIDGET_MOUSEOVER* = 0x00000800
  AG_WIDGET_CATCH_TAB* = 0x00001000
  AG_WIDGET_GL_RESHAPE* = 0x00002000
  AG_WIDGET_UNDERSIZE* = 0x00004000
  AG_WIDGET_NOSPACING* = 0x00008000
  AG_WIDGET_UNFOCUSED_KEYDOWN* = 0x00010000
  AG_WIDGET_UNFOCUSED_KEYUP* = 0x00020000
  AG_WIDGET_TABLE_EMBEDDABLE* = 0x00080000
  AG_WIDGET_UPDATE_WINDOW* = 0x00100000
  AG_WIDGET_QUEUE_SURFACE_BACKUP* = 0x00200000
  AG_WIDGET_USE_TEXT* = 0x00400000
  AG_WIDGET_USE_MOUSEOVER* = 0x00800000
  AG_WIDGET_EXPAND* = (AG_WIDGET_HFILL or AG_WIDGET_VFILL)
  AG_WIDGET_SURFACE_NODUP* = 0x00000001
  AG_WIDGET_SURFACE_REGEN* = 0x00000002

const
  AG_WINDOW_MODAL* = 0x00000001
  AG_WINDOW_MAXIMIZED* = 0x00000002
  AG_WINDOW_MINIMIZED* = 0x00000004
  AG_WINDOW_KEEPABOVE* = 0x00000008
  AG_WINDOW_KEEPBELOW* = 0x00000010
  AG_WINDOW_DENYFOCUS* = 0x00000020
  AG_WINDOW_NOTITLE* = 0x00000040
  AG_WINDOW_NOBORDERS* = 0x00000080
  AG_WINDOW_NOHRESIZE* = 0x00000100
  AG_WINDOW_NOVRESIZE* = 0x00000200
  AG_WINDOW_NOCLOSE* = 0x00000400
  AG_WINDOW_NOMINIMIZE* = 0x00000800
  AG_WINDOW_NOMAXIMIZE* = 0x00001000
  AG_WINDOW_TILING* = 0x00002000
  AG_WINDOW_MINSIZEPCT* = 0x00004000
  AG_WINDOW_NOBACKGROUND* = 0x00008000
  AG_WINDOW_MAIN* = 0x00010000
  AG_WINDOW_FOCUSONATTACH* = 0x00020000
  AG_WINDOW_HMAXIMIZE* = 0x00040000
  AG_WINDOW_VMAXIMIZE* = 0x00080000
  AG_WINDOW_NOMOVE* = 0x00100000
  AG_WINDOW_NOCLIPPING* = 0x00200000
  AG_WINDOW_MODKEYEVENTS* = 0x00400000
  AG_WINDOW_DETACHING* = 0x00800000
  AG_WINDOW_NOCURSORCHG* = 0x04000000
  AG_WINDOW_FADEIN* = 0x08000000
  AG_WINDOW_FADEOUT* = 0x10000000
  AG_WINDOW_NORESIZE* = (AG_WINDOW_NOHRESIZE or AG_WINDOW_NOVRESIZE)
  AG_WINDOW_NOBUTTONS* = (
    AG_WINDOW_NOCLOSE or AG_WINDOW_NOMINIMIZE or AG_WINDOW_NOMAXIMIZE)
  AG_WINDOW_PLAIN* = (AG_WINDOW_NOTITLE or AG_WINDOW_NOBORDERS)

const
  AG_KEYMOD_NONE* = 0x00000000
  AG_KEYMOD_LSHIFT* = 0x00000001
  AG_KEYMOD_RSHIFT* = 0x00000002
  AG_KEYMOD_LCTRL* = 0x00000040
  AG_KEYMOD_RCTRL* = 0x00000080
  AG_KEYMOD_LALT* = 0x00000100
  AG_KEYMOD_RALT* = 0x00000200
  AG_KEYMOD_LMETA* = 0x00000400
  AG_KEYMOD_RMETA* = 0x00000800
  AG_KEYMOD_NUMLOCK* = 0x00001000
  AG_KEYMOD_CAPSLOCK* = 0x00002000
  AG_KEYMOD_MODE* = 0x00004000
  AG_KEYMOD_ANY* = 0x0000FFFF
  AG_KEYMOD_CTRL* = (AG_KEYMOD_LCTRL or AG_KEYMOD_RCTRL)
  AG_KEYMOD_SHIFT* = (AG_KEYMOD_LSHIFT or AG_KEYMOD_RSHIFT)
  AG_KEYMOD_ALT* = (AG_KEYMOD_LALT or AG_KEYMOD_RALT)
  AG_KEYMOD_META* = (AG_KEYMOD_LMETA or AG_KEYMOD_RMETA)

const
  AG_FIXED_PLOTTER_SCROLL* = 0x00000001
  AG_FIXED_PLOTTER_XAXIS* = 0x00000002
  AG_FIXED_PLOTTER_HFILL* = 0x00000004
  AG_FIXED_PLOTTER_VFILL* = 0x00000008
  AG_FIXED_PLOTTER_EXPAND* = (AG_FIXED_PLOTTER_HFILL or AG_FIXED_PLOTTER_VFILL)
  
const
  AG_FONTSELECTOR_UPDATE* = 0x00000001
  AG_FONTSELECTOR_HFILL* = 0x00000100
  AG_FONTSELECTOR_VFILL* = 0x00000200
  AG_FONTSELECTOR_EXPAND* = (AG_FONTSELECTOR_HFILL or AG_FONTSELECTOR_VFILL)

const
  AG_SURFACE_GLTEXTURE* = 0x00000004
  AG_SURFACE_MAPPED* = 0x00000008
  AG_SAVED_SURFACE_FLAGS* = (AG_SRCCOLORKEY or AG_SRCALPHA or AG_SURFACE_GLTEXTURE)

const
  AG_TABLE_TXT_MAX* = 128
  AG_TABLE_FMT_MAX* = 16
  AG_TABLE_COL_NAME_MAX* = 48
  AG_TABLE_HASHBUF_MAX* = 64

const
  AG_MENU_ITEM_ICONS* = 0x00000001
  AG_MENU_ITEM_NOSELECT* = 0x00000002
  AG_MENU_ITEM_SEPARATOR* = 0x00000004

const
  AG_MENU_HFILL* = 0x00000001
  AG_MENU_VFILL* = 0x00000002
  AG_MENU_EXPAND* = (AG_MENU_HFILL or AG_MENU_VFILL)

const
  AG_MFSPINBUTTON_NOHFILL* = 0x00000001
  AG_MFSPINBUTTON_VFILL* = 0x00000002
  AG_MFSPINBUTTON_EXCL* = 0x00000004

const
  AG_HBOX_HOMOGENOUS* = AG_BOX_HOMOGENOUS
  AG_HBOX_HFILL* = AG_BOX_HFILL
  AG_HBOX_VFILL* = AG_BOX_VFILL
  AG_HBOX_EXPAND* = (AG_BOX_HFILL or AG_BOX_VFILL)
  AG_HSVPAL_PIXEL* = 0x00000001
  AG_HSVPAL_DIRTY* = 0x00000002
  AG_HSVPAL_HFILL* = 0x00000004
  AG_HSVPAL_VFILL* = 0x00000008
  AG_HSVPAL_NOALPHA* = 0x00000010
  AG_HSVPAL_FORCE_NOALPHA* = 0x00000010
  AG_HSVPAL_NOPREVIEW* = 0x00000020
  AG_HSVPAL_SHOW_RGB* = 0x00000040
  AG_HSVPAL_SHOW_HSV* = 0x00000080
  AG_HSVPAL_EXPAND* = (AG_HSVPAL_HFILL or AG_HSVPAL_VFILL)

const
  AG_SCROLLBAR_HFILL* = 0x00000001
  AG_SCROLLBAR_VFILL* = 0x00000002
  AG_SCROLLBAR_TEXT* = 0x00000008
  AG_SCROLLBAR_AUTOHIDE* = 0x00000020
  AG_SCROLLBAR_EXCL* = 0x00000040
  AG_SCROLLBAR_NOAUTOHIDE* = 0x00000080
  AG_SCROLLBAR_EXPAND* = (AG_SCROLLBAR_HFILL or AG_SCROLLBAR_VFILL)  

const
  AG_SCROLLVIEW_HFILL* = 0x00000001
  AG_SCROLLVIEW_VFILL* = 0x00000002
  AG_SCROLLVIEW_NOPAN_X* = 0x00000004
  AG_SCROLLVIEW_NOPAN_Y* = 0x00000008
  AG_SCROLLVIEW_PANNING* = 0x00000010
  AG_SCROLLVIEW_BY_MOUSE* = 0x00000020
  AG_SCROLLVIEW_FRAME* = 0x00000080
  AG_SCROLLVIEW_EXPAND* = (AG_SCROLLVIEW_HFILL or AG_SCROLLVIEW_VFILL)
  AG_SCROLLVIEW_NOPAN_XY* = (AG_SCROLLVIEW_NOPAN_X or AG_SCROLLVIEW_NOPAN_Y)

const
  AG_SOCKET_HFILL* = 0x00000001
  AG_SOCKET_VFILL* = 0x00000002
  AG_SOCKET_EXPAND* = (AG_SOCKET_HFILL or AG_SOCKET_VFILL)
  AG_SOCKET_MOUSEOVER* = 0x00000004
  AG_SOCKET_STICKY_STATE* = 0x00000008

const
  AG_SPINBUTTON_NOHFILL* = 0x00000001
  AG_SPINBUTTON_VFILL* = 0x00000002

const
  AG_GLVIEW_HFILL* = 0x00000001
  AG_GLVIEW_VFILL* = 0x00000002
  AG_GLVIEW_NOMODELVIEW* = 0x00000004
  AG_GLVIEW_NOTEXTURE* = 0x00000008
  AG_GLVIEW_NOCOLOR* = 0x00000010
  AG_GLVIEW_INIT_MATRICES* = 0x00000020
  AG_GLVIEW_RESHAPE_C* = 0x00000040
  AG_GLVIEW_BGFILL* = 0x00000080
  AG_GLVIEW_EXPAND* = (AG_GLVIEW_HFILL or AG_GLVIEW_VFILL)

const
  AG_STATUSBAR_MAX_LABELS* = 8
  AG_STATUSBAR_HFILL* = 0x00000001
  AG_STATUSBAR_VFILL* = 0x00000002
  AG_STATUSBAR_EXPAND* = (AG_STATUSBAR_HFILL or AG_STATUSBAR_VFILL)

const
  AG_GRAPH_HFILL* = 0x00000001
  AG_GRAPH_VFILL* = 0x00000002
  AG_GRAPH_EXPAND* = (AG_GRAPH_HFILL or AG_GRAPH_VFILL)
  AG_GRAPH_SCROLL* = 0x00000004
  AG_GRAPH_DRAGGING* = 0x00000008
  AG_GRAPH_PANNING* = 0x00000010
  AG_GRAPH_NO_MOVE* = 0x00000020
  AG_GRAPH_NO_SELECT* = 0x00000040
  AG_GRAPH_NO_MENUS* = 0x00000080
  AG_GRAPH_READONLY* = (
    AG_GRAPH_NO_MOVE or AG_GRAPH_NO_SELECT or AG_GRAPH_NO_MENUS)
  
const
  AG_ZOOM_RANGE* = 14
  AG_ZOOM_DEFAULT* = 5

const
  AG_VIDEO_HWSURFACE* = 0x00000001
  AG_VIDEO_ASYNCBLIT* = 0x00000002
  AG_VIDEO_ANYFORMAT* = 0x00000004
  AG_VIDEO_HWPALETTE* = 0x00000008
  AG_VIDEO_DOUBLEBUF* = 0x00000010
  AG_VIDEO_FULLSCREEN* = 0x00000020
  AG_VIDEO_RESIZABLE* = 0x00000040
  AG_VIDEO_NOFRAME* = 0x00000080
  AG_VIDEO_BGPOPUPMENU* = 0x00000100
  AG_VIDEO_OPENGL* = 0x00000200
  AG_VIDEO_OPENGL_OR_SDL* = 0x00000400
  AG_VIDEO_NOBGCLEAR* = 0x00000800
  AG_VIDEO_OVERLAY* = 0x00001000
  AG_VIDEO_SDL* = 0x00002000

const
  AG_SLIDER_HFILL* = 0x00000001
  AG_SLIDER_VFILL* = 0x00000002
  AG_SLIDER_FOCUSABLE* = 0x00000004
  AG_SLIDER_EXCL* = 0x00000008
  AG_SLIDER_EXPAND* = (AG_SLIDER_HFILL or AG_SLIDER_VFILL)

const
  AG_ICON_REGEN_LABEL* = 0x00000001
  AG_ICON_DND* = 0x00000002
  AG_ICON_DBLCLICKED* = 0x00000004
  AG_ICON_BGFILL* = 0x00000008

const
  AG_RADIO_HFILL* = 0x00000001
  AG_RADIO_VFILL* = 0x00000002
  AG_RADIO_EXPAND* = (AG_RADIO_HFILL or AG_RADIO_VFILL)

const
  AG_PANE_HFILL* = 0x00000001
  AG_PANE_VFILL* = 0x00000002
  AG_PANE_DIV1FILL* = 0x00000004
  AG_PANE_FRAME* = 0x00000008
  AG_PANE_UNMOVABLE* = 0x00000100
  AG_PANE_EXPAND* = (AG_PANE_HFILL or AG_PANE_VFILL)

const
  AG_PIXMAP_HFILL* = 0x00000001
  AG_PIXMAP_VFILL* = 0x00000002
  AG_PIXMAP_FORCE_SIZE* = 0x00000004
  AG_PIXMAP_RESCALE* = 0x00000008
  AG_PIXMAP_UPDATE* = 0x00000010
  AG_PIXMAP_EXPAND* = (AG_PIXMAP_HFILL or AG_PIXMAP_VFILL)

const
  AG_OBJSEL_PAGE_DATA* = 0x00000001
  AG_OBJSEL_PAGE_GFX* = 0x00000002

const
  AG_MPANE_HFILL* = 0x00000001
  AG_MPANE_VFILL* = 0x00000002
  AG_MPANE_FRAMES* = 0x00000004
  AG_MPANE_FORCE_DIV* = 0x00000008
  AG_MPANE_EXPAND* = (AG_MPANE_HFILL or AG_MPANE_VFILL)

const
  AG_LABEL_HFILL* = 0x00000001
  AG_LABEL_VFILL* = 0x00000002
  AG_LABEL_NOMINSIZE* = 0x00000004
  AG_LABEL_PARTIAL* = 0x00000010
  AG_LABEL_REGEN* = 0x00000020
  AG_LABEL_FRAME* = 0x00000080
  AG_LABEL_EXPAND* = (AG_LABEL_HFILL or AG_LABEL_VFILL)

type
  AG_AnimType* {.pure.} = enum
    AG_ANIM_PACKED,           ##  Packed-pixel format
    AG_ANIM_INDEXED           ##  Indexed format
  AG_AnimFrame* {.bycopy.} = object
    pixels*: pointer           ##  Pixel data
    flags*: cuint
  AG_Rect* {.bycopy.} = object
    x*: cint
    y*: cint
    w*: cint
    h*: cint
  AG_Rect2* {.bycopy.} = object
    x1*: cint
    y1*: cint
    w*: cint
    h*: cint
    x2*: cint
    y2*: cint
  AG_TexCoord* {.bycopy.} = object
    x*: cfloat
    y*: cfloat
    w*: cfloat
    h*: cfloat
  AG_Color* {.bycopy.} = object
    r*: cuchar
    g*: cuchar
    b*: cuchar
    a*: cuchar
  AG_Palette* {.bycopy.} = object
    colors*: ptr AG_Color       ##  Color array
    nColors*: cuint             ##  Color count
  AG_PixelFormat* {.bycopy.} = object
    palette*: ptr AG_Palette    ##  For indexed formats
    bitsPerPixel*: cuchar       ##  Depth (bits/pixel)
    bytesPerPixel*: cuchar      ##  Depth (bytes/pixel)
    rloss*: cuchar
    gloss*: cuchar
    bloss*: cuchar
    aloss*: cuchar              ##  Component loss
    rshift*: cuchar
    gshift*: cuchar
    bshift*: cuchar
    ashift*: cuchar             ##  Component shift
    rmask*: cuint
    gmask*: cuint
    bmask*: cuint
    amask*: cuint             ##  Component masks
    colorkey*: cuint          ##  Color key pixel
    alpha*: cuchar              ##  Per-surface alpha value
  AG_Anim* {.bycopy.} = object
    lock*: AG_Mutex
    anim_type*: AG_AnimType      ##  Type of animation
    format*: ptr AG_PixelFormat ##  Pixel format
    flags*: cuint              
    w*: cuint
    h*: cuint                   ##  Size in pixels
    n*: cuint                   ##  Number of frames
    pitch*: cuint               ##  Scanline size in bytes
    f*: ptr AG_AnimFrame        ##  Frame data
    clipRect*: AG_Rect         ##  Clipping rect for blit as dst
    fpsOrig*: cdouble          ##  Original frames/second (hint)
  AG_AnimState* {.bycopy.} = object
    lock*: AG_Mutex
    an*: ptr AG_Anim            ##  Back pointer to anim
    flags*: cuint
    play*: cint                ##  Animation is playing
    f*: cint                   ##  Current frame#
    fps*: cdouble              ##  Effective frames/second
    th*: AG_Thread             ##  Animation thread
  AG_BoxType* {.pure.} = enum
    AG_BOX_HORIZ, AG_BOX_VERT
  AG_BoxAlign* {.pure.} = enum
    AG_BOX_LEFT = 0, AG_BOX_CENTER = 1, AG_BOX_RIGHT = 2
  AG_Cursor* {.bycopy.} = object
    w*: cuint
    h*: cuint                   ##  Cursor dimensions
    data*: ptr cuchar
    mask*: ptr cuchar            ##  Bitmap data
    xHot*: cint
    yHot*: cint                ##  Hotspot
    p*: pointer                ##  Driver data
    next*: ptr AG_Cursor ##  next element
    prev*: ptr ptr AG_Cursor ##  address of previous next element
  AG_CursorArea* {.bycopy.} = object
    r*: AG_Rect                ##  Area in window
    c*: ptr AG_Cursor           ##  Associated cursor
    wid*: ptr AG_Widget         ##  Associated widget
    stock*: cint               ##  Stock cursor?
    next*: ptr AG_CursorArea ##  next element
    prev*: ptr ptr AG_CursorArea ##  address of previous next element
  AG_CursorAreaQ* {.bycopy.} = object
    first*: ptr AG_CursorArea
    last*: ptr ptr AG_CursorArea
  AG_SurfaceType* {.pure.} = enum
    AG_SURFACE_PACKED,        ##  Packed-pixel format
    AG_SURFACE_INDEXED        ##  Indexed format
  AG_Surface* {.bycopy.} = object
    surface_type*: AG_SurfaceType   ##  Type of surface
    format*: ptr AG_PixelFormat ##  Pixel format
    flags*: cuint
    w*: cuint
    h*: cuint                   ##  Size in pixels
    pitch*: cuint               ##  Scanline size in bytes
    pixels*: pointer           ##  Raw pixel data
    clipRect*: AG_Rect         ##  Clipping rect for blit as dst
    padding*: cuint             ##  Scanline end padding in bytes
  GLMatrices* {.bycopy.} = object
    mProjection*: array[16, cfloat] ##  Projection matrix
    mModelview*: array[16, cfloat] ##  Modelview matrix
  AG_WidgetColorState* {.pure.} = enum
    AG_DEFAULT_STATE,         ##  Unfocused state
    AG_DISABLED_STATE,        ##  Inactive state (#disabled)
    AG_FOCUSED_STATE,         ##  Active / focused state (#focused)
    AG_HOVER_STATE,           ##  "Mouse over" state (#hover)
    AG_SELECTED_STATE         ##  "Selected" state (#selected)
  AG_WidgetColor* {.pure.} = enum
    AG_BGCOLOR = 0,           ##  Background ("color")
    AG_TEXT_COLOR,            ##  Rendered text ("text-color")
    AG_LINE_COLOR,            ##  Line drawing ("line-color")
    AG_SHAPE_COLOR,           ##  Filled shapes ("shape-color")
    AG_BORDER_COLOR           ##  Decorative borders ("border-color")
  AG_Titlebar* {.bycopy.} = object
    hb*: AG_Box
    flags*: cuint
    pressed*: cint
    win*: ptr AG_Window         ##  Back pointer to window
    label*: ptr AG_Label
    close_btn*: ptr AG_Button
    minimize_btn*: ptr AG_Button
    maximize_btn*: ptr AG_Button
  AG_WindowAlignment* {.pure.} = enum
    AG_WINDOW_ALIGNMENT_NONE, AG_WINDOW_TL, AG_WINDOW_TC, AG_WINDOW_TR,
    AG_WINDOW_ML, AG_WINDOW_MC, AG_WINDOW_MR, AG_WINDOW_BL, AG_WINDOW_BC,
    AG_WINDOW_BR, AG_WINDOW_ALIGNMENT_LAST
  AG_SocketBGType* {.pure.} = enum
    AG_SOCKET_PIXMAP,         ##  Pixmap background
    AG_SOCKET_RECT,           ##  Generic rectangular background
    AG_SOCKET_CIRCLE          ##  Generic circular background
  AG_TextJustify* {.pure.} = enum
    AG_TEXT_LEFT, AG_TEXT_CENTER, AG_TEXT_RIGHT
  PixmapHandle* {.bycopy.} = object
    s*: cint                   ##  Pixmap surface handle
  RectangleDims* {.bycopy.} = object
    w*: cint
    h*: cint                   ##  Dimensions
  CircleDims* {.bycopy.} = object
    r*: cint                   ##  Radius  
  BackgroundData* {.bycopy.} = object {.union.}
    pixmap*: PixmapHandle
    rect*: RectangleDims
    circle*: CircleDims
  AG_Socket* {.bycopy.} = object
    wid*: AG_Widget
    state*: cint               ##  Default boolean state binding
    count*: cint               ##  Default stack count binding
    flags*: cuint
    bgType*: AG_SocketBGType
    bgData*: BackgroundData
    lblJustify*: AG_TextJustify ##  Label justification
    lPad*: cint
    rPad*: cint
    tPad*: cint
    bPad*: cint                ##  Padding around contained Icon
    icon*: ptr AG_Icon          ##  Icon in socket or NULL Callbacks
    insertFn*: proc (a2: ptr AG_Socket; a3: ptr AG_Icon): cint
    removeFn*: proc (a2: ptr AG_Socket; a3: ptr AG_Icon)
    overlayFn*: ptr AG_Event
  AG_Icon* {.bycopy.} = object
    wid*: AG_Widget
    flags*: cuint
    surface*: cint             ##  Icon surface
    labelTxt*: array[AG_LABEL_MAX, char] ##  Optional text label
    labelSurface*: cint        ##  Optional label surface
    labelPad*: cint            ##  Icon-label spacing
    wDND*: ptr AG_Window        ##  For drag/drop
    sock*: ptr AG_Socket        ##  Back pointer to socket
    xSaved*: cint
    ySaved*: cint              ##  Saved coordinates
    wSaved*: cint
    hSaved*: cint              ##  Saved geometry
    cBackground*: AG_Color     ##  Background fill color
    toDblClick*: AG_Timer      ##  Timer for double click
  AG_WindowWMType* {.pure.} = enum
    AG_WINDOW_WM_NORMAL,      ##  Normal, top-level window
    AG_WINDOW_WM_DESKTOP,     ##  Desktop feature (e.g., fullscreen)
    AG_WINDOW_WM_DOCK,        ##  Dock or panel feature
    AG_WINDOW_WM_TOOLBAR,     ##  Toolbar "torn off" from main window
    AG_WINDOW_WM_MENU,        ##  Pinnable menu window
    AG_WINDOW_WM_UTILITY,     ##  Persistent utility window (e.g., a palette or a toolbox).
    AG_WINDOW_WM_SPLASH,      ##  Introductory splash screen
    AG_WINDOW_WM_DIALOG,      ##  Dialog window
    AG_WINDOW_WM_DROPDOWN_MENU, ##  Menubar-triggered drop-down menu
    AG_WINDOW_WM_POPUP_MENU,  ##  Contextual popup menu
    AG_WINDOW_WM_TOOLTIP,     ##  Mouse hover triggered tooltip
    AG_WINDOW_WM_NOTIFICATION, ##  Notification bubble
    AG_WINDOW_WM_COMBO,       ##  Combo-box triggered window
    AG_WINDOW_WM_DND          ##  Draggable object
  AG_Window* {.bycopy.} = object
    wid*: AG_Widget
    flags*: cuint
    caption*: array[AG_WINDOW_CAPTION_MAX, char] ##  Window caption
    visible*: cint             ##  Window is visible
    dirty*: cint               ##  Window needs redraw
    tbar*: ptr AG_Titlebar      ##  Titlebar (if any)
    alignment*: AG_WindowAlignment ##  Initial position
    spacing*: cint             ##  Default spacing (px)
    tPad*: cint
    bPad*: cint
    lPad*: cint
    rPad*: cint                ##  Window padding (px)
    wReq*: cint
    hReq*: cint                ##  Requested geometry (px)
    wMin*: cint
    hMin*: cint                ##  Minimum geometry (px)
    wBorderBot*: cint          ##  Bottom border size (px)
    wBorderSide*: cint         ##  Side border size (px)
    wResizeCtrl*: cint         ##  Resize controls size (px)
    rSaved*: AG_Rect           ##  Saved geometry
    minPct*: cint              ##  For MINSIZEPCT
    parent*: ptr AG_Window      ##  Logical parent window
    transientFor*: ptr AG_Window ##  Transient parent window
    pinnedTo*: ptr AG_Window    ##  Pinned to parent window
    subwinsqh_first*: ptr AG_Window
    subwinsqh_last*: ptr ptr AG_Window
    swins_next*: ptr AG_Window ##  next element
    swins_prev*: ptr ptr AG_Window ##  address of previous next element
    detach_next*: ptr AG_Window ##  next element
    detach_prev*: ptr ptr AG_Window ##  address of previous next element
    icon*: ptr AG_Icon          ##  Window icon (for internal WM)
    r*: AG_Rect                ##  View area
    nFocused*: cint            ##  Widgets in focus chain
    widExclMotion*: ptr AG_Widget ##  Widget exclusively receiving mousemotion
    cursorAreas*: AG_CursorAreaQ ##  Cursor-change areas
    caResize*: array[5, ptr AG_CursorArea] ##  Window-resize areas
    fadeTo*: AG_Timer          ##  Fade timer
    fadeInTime*: cfloat
    fadeOutTime*: cfloat       ##  Fade time (s)
    fadeInIncr*: cfloat
    fadeOutIncr*: cfloat       ##  Fade increment
    fadeOpacity*: cfloat       ##  Fade opacity
    wmType*: AG_WindowWMType ##  Window function
    zoom*: cint                ##  Effective zoom level
    visibility_next*: ptr AG_Window ##  next element
    visibility_prev*: ptr ptr AG_Window ##  address of previous next element
    user_next*: ptr AG_Window ##  next element
    user_prev*: ptr ptr AG_Window ##  address of previous next element
  AG_WindowQ* {.bycopy.} = object
    first*: ptr AG_Window
    last*: ptr ptr AG_Window
  AG_FontType* {.pure.} = enum
    AG_FONT_VECTOR,           ##  Vectorial font
    AG_FONT_BITMAP            ##  Raw glyph pixmaps
  AG_FontSpecSource* {.pure.} = enum
    AG_FONT_SOURCE_FILE,      ##  Load from file
    AG_FONT_SOURCE_MEMORY     ##  Read from memory
  INNER_C_STRUCT_1514945751* {.bycopy.} = object
    data*: ptr cuchar            ##  Memory region
    size*: csize
  INNER_C_UNION_1498422739* {.bycopy.} = object {.union.}
    file*: array[AG_PATHNAME_MAX, char] ##  Font file
    mem*: INNER_C_STRUCT_1514945751
  TransformMatrix* {.bycopy.} = object
    xx*: cdouble               ##  Transform matrix
    xy*: cdouble
    yx*: cdouble
    yy*: cdouble
  AG_FontSpec* {.bycopy.} = object
    font_type*: AG_FontType
    sourceType*: AG_FontSpecSource
    source*: INNER_C_UNION_1498422739
    index*: cint               ##  Font index
    size*: cdouble             ##  Font size
    matrix*: TransformMatrix
  AG_Font* {.bycopy.} = object
    obj*: AG_Object
    spec*: AG_FontSpec         ##  Input font specification
    flags*: cuint
    height*: cint              ##  Body size in pixels
    ascent*: cint              ##  Ascent (relative to baseline)
    descent*: cint             ##  Descent (relative to baseline)
    lineskip*: cint            ##  Multiline y-increment
    ttf*: pointer              ##  TTF object
    bspec*: array[32, char]     ##  Bitmap font specification
    bglyphs*: ptr ptr AG_Surface ##  Bitmap glyphs
    nglyphs*: cuint             ##  Bitmap glyph count
    c0*: cuint
    c1*: cuint                ##  Bitmap glyph range
    nRefs*: cuint               ##  Reference count
    next*: ptr AG_Font  ##  next element
    prev*: ptr ptr AG_Font ##  address of previous next element
  AG_Glyph* {.bycopy.} = object
    font*: ptr AG_Font          ##  Font face
    color*: AG_Color           ##  Glyph color
    ch*: cuint                ##  Unicode character
    su*: ptr AG_Surface         ##  Rendered surface
    advance*: cint             ##  Pixel advance
    texture*: cuint             ##  Cached texture (driver-specific)
    texcoords*: AG_TexCoord    ##  Texture coordinates
    sle_next*: ptr AG_Glyph
  AG_GlyphCache* {.bycopy.} = object
    slh_first*: ptr AG_Glyph
  AG_DriverType* {.pure.} = enum
    AG_FRAMEBUFFER,           ##  Direct rendering to frame buffer
    AG_VECTOR                 ##  Vector drawing
  AG_DriverWMType* {.pure.} = enum
    AG_WM_SINGLE,             ##  Single display
    AG_WM_MULTIPLE            ##  Multiple windows
  AG_DriverEvent* {.pure.} = enum
    AG_DRIVER_UNKNOWN  ## Unknown event */
    AG_DRIVER_MOUSE_MOTION  ## Cursor moved */
    AG_DRIVER_MOUSE_BUTTON_DOWN  ## Mouse button pressed */
    AG_DRIVER_MOUSE_BUTTON_UP  ## Mouse button released */
    AG_DRIVER_MOUSE_ENTER  ## Mouse entering window (MW) */
    AG_DRIVER_MOUSE_LEAVE  ## Mouse leaving window (MW) */
    AG_DRIVER_FOCUS_IN  ## Focus on window (MW) */
    AG_DRIVER_FOCUS_OUT  ## Focus out of window (MW) */
    AG_DRIVER_KEY_DOWN  ## Key pressed */
    AG_DRIVER_KEY_UP  ## Key released */
    AG_DRIVER_EXPOSE  ## Video update needed */
    AG_DRIVER_VIDEORESIZE  ## Video resize request */
    AG_DRIVER_CLOSE  ## Window close request */
  AG_BlendFn* {.pure.} = enum
    AG_ALPHA_ZERO, AG_ALPHA_ONE, AG_ALPHA_SRC, AG_ALPHA_DST, AG_ALPHA_ONE_MINUS_DST,
    AG_ALPHA_ONE_MINUS_SRC, AG_ALPHA_OVERLAY, AG_ALPHA_LAST
  AG_DriverClass* {.bycopy.} = object
    inherit*: AG_ObjectClass
    name*: cstring             ##  Short name
    driver_type*: AG_DriverType    ##  Driver type
    wm*: AG_DriverWMType     ##  Window manager type
    flags*: cuint               ##  Initialization
    open*: proc (drv: pointer; spec: cstring): cint
    close*: proc (drv: pointer)
    getDisplaySize*: proc (w: ptr cuint; h: ptr cuint): cint ##  Event processing
    beginEventProcessing*: proc (drv: pointer)
    pendingEvents*: proc (drv: pointer): cint
    getNextEvent*: proc (drv: pointer; dev: ptr AG_DriverEvent): cint
    processEvent*: proc (drv: pointer; dev: ptr AG_DriverEvent): cint
    genericEventLoop*: proc (drv: pointer)
    endEventProcessing*: proc (drv: pointer)
    terminate*: proc ()         ##  GUI rendering
    beginRendering*: proc (drv: pointer)
    renderWindow*: proc (a2: ptr AG_Window)
    endRendering*: proc (drv: pointer) ##  Primitives
    fillRect*: proc (drv: pointer; r: AG_Rect; c: AG_Color) ##  Update video region (rendering context; FB driver specific)
    updateRegion*: proc (drv: pointer; r: AG_Rect) ##  Texture operations (GL driver specific)
    uploadTexture*: proc (drv: pointer; a3: ptr cuint; a4: ptr AG_Surface;
                        a5: ptr AG_TexCoord)
    updateTexture*: proc (drv: pointer; a3: cuint; a4: ptr AG_Surface; a5: ptr AG_TexCoord): cint
    deleteTexture*: proc (drv: pointer; a3: cuint) ##  Request a specific refresh rate (driver specific)
    setRefreshRate*: proc (drv: pointer; fps: cint): cint ##  Clipping and blending control (rendering context)
    pushClipRect*: proc (drv: pointer; r: AG_Rect)
    popClipRect*: proc (drv: pointer)
    pushBlendingMode*: proc (drv: pointer; srcFn: AG_BlendFn; dstFn: AG_BlendFn)
    popBlendingMode*: proc (drv: pointer) ##  Hardware cursor operations
    createCursor*: proc (drv: pointer; w: cuint; h: cuint; data: ptr cuchar; mask: ptr cuchar;
                       xHot: cint; yHot: cint): ptr AG_Cursor
    freeCursor*: proc (drv: pointer; curs: ptr AG_Cursor)
    setCursor*: proc (drv: pointer; curs: ptr AG_Cursor): cint
    unsetCursor*: proc (drv: pointer)
    getCursorVisibility*: proc (drv: pointer): cint
    setCursorVisibility*: proc (drv: pointer; flag: cint) ##  Widget surface operations (rendering context)
    blitSurface*: proc (drv: pointer; wid: ptr AG_Widget; s: ptr AG_Surface; x: cint;
                      y: cint)
    blitSurfaceFrom*: proc (drv: pointer; wid: ptr AG_Widget; widSrc: ptr AG_Widget;
                          s: cint; r: ptr AG_Rect; x: cint; y: cint)
    blitSurfaceGL*: proc (drv: pointer; wid: ptr AG_Widget; s: ptr AG_Surface; w: cfloat;
                        h: cfloat)
    blitSurfaceFromGL*: proc (drv: pointer; wid: ptr AG_Widget; s: cint; w: cfloat;
                            h: cfloat)
    blitSurfaceFlippedGL*: proc (drv: pointer; wid: ptr AG_Widget; s: cint; w: cfloat;
                               h: cfloat)
    backupSurfaces*: proc (drv: pointer; wid: ptr AG_Widget)
    restoreSurfaces*: proc (drv: pointer; wid: ptr AG_Widget)
    renderToSurface*: proc (drv: pointer; wid: ptr AG_Widget; su: ptr ptr AG_Surface): cint ##  Rendering operations (rendering context)
    putPixel*: proc (drv: pointer; x: cint; y: cint; c: AG_Color)
    putPixel32*: proc (drv: pointer; x: cint; y: cint; c: cuint)
    putPixelRGB*: proc (drv: pointer; x: cint; y: cint; r: cuchar; g: cuchar; b: cuchar)
    blendPixel*: proc (drv: pointer; x: cint; y: cint; c: AG_Color; fnSrc: AG_BlendFn;
                     fnDst: AG_BlendFn)
    drawLine*: proc (drv: pointer; x1: cint; y1: cint; x2: cint; y2: cint; C: AG_Color)
    drawLineH*: proc (drv: pointer; x1: cint; x2: cint; y: cint; C: AG_Color)
    drawLineV*: proc (drv: pointer; x: cint; y1: cint; y2: cint; C: AG_Color)
    drawLineBlended*: proc (drv: pointer; x1: cint; y1: cint; x2: cint; y2: cint;
                          C: AG_Color; fnSrc: AG_BlendFn; fnDst: AG_BlendFn)
    drawArrow*: proc (drv: pointer; angle: cfloat; x: cint; y: cint; h: cint; c1: AG_Color;
                    c2: AG_Color)
    drawBoxRounded*: proc (drv: pointer; r: AG_Rect; z: cint; rad: cint; c1: AG_Color;
                         c2: AG_Color; c3: AG_Color)
    drawBoxRoundedTop*: proc (drv: pointer; r: AG_Rect; z: cint; rad: cint; c1: AG_Color;
                            c2: AG_Color; c3: AG_Color)
    drawCircle*: proc (drv: pointer; x: cint; y: cint; r: cint; C: AG_Color)
    drawCircleFilled*: proc (drv: pointer; x: cint; y: cint; r: cint; C: AG_Color)
    drawRectFilled*: proc (drv: pointer; r: AG_Rect; C: AG_Color)
    drawRectBlended*: proc (drv: pointer; r: AG_Rect; C: AG_Color; fnSrc: AG_BlendFn;
                          fnDst: AG_BlendFn)
    drawRectDithered*: proc (drv: pointer; r: AG_Rect; C: AG_Color)
    updateGlyph*: proc (drv: pointer; a3: ptr AG_Glyph)
    drawGlyph*: proc (drv: pointer; a3: ptr AG_Glyph; x: cint; y: cint) ##  Display list management (GL driver specific)
    deleteList*: proc (drv: pointer; a3: cuint)
  AG_KeySym* {.pure.} = enum
    AG_KEY_NONE = 0x00000000,   ##  Start of ASCII range
    AG_KEY_BACKSPACE = 0x00000008, AG_KEY_TAB = 0x00000009, ## 	AG_KEY_ASCII_NEWLINE	= 0x000a,
                                                      ## 	AG_KEY_ASCII_VT		= 0x000b,
    AG_KEY_CLEAR = 0x0000000C, AG_KEY_RETURN = 0x0000000D, ## 	AG_KEY_ASCII_SO		= 0x000e,
                                                     ## 	AG_KEY_ASCII_SI		= 0x000f,
                                                     ## 	AG_KEY_ASCII_DLE	= 0x0010,
                                                     ## 	AG_KEY_ASCII_DC1	= 0x0011,
                                                     ## 	AG_KEY_ASCII_DC2	= 0x0012,
    AG_KEY_PAUSE = 0x00000013,  ## 	AG_KEY_ASCII_DC4	= 0x0014,
                            ## 	AG_KEY_ASCII_NAK	= 0x0015,
                            ## 	AG_KEY_ASCII_SYN	= 0x0016,
                            ## 	AG_KEY_ASCII_ETB	= 0x0017,
                            ## 	AG_KEY_ASCII_CAN	= 0x0018,
                            ## 	AG_KEY_ASCII_EM		= 0x0019,
                            ## 	AG_KEY_ASCII_SUB	= 0x001a,
    AG_KEY_ESCAPE = 0x0000001B, ## 	AG_KEY_ASCII_FS		= 0x001c,
                             ## 	AG_KEY_ASCII_GS		= 0x001d,
                             ## 	AG_KEY_ASCII_RS		= 0x001e,
                             ## 	AG_KEY_ASCII_US		= 0x001f,
    AG_KEY_SPACE = 0x00000020, AG_KEY_EXCLAIM = 0x00000021, ##  !
    AG_KEY_QUOTEDBL = 0x00000022, ##  "
    AG_KEY_HASH = 0x00000023,   ##  #
    AG_KEY_DOLLAR = 0x00000024, ##  $
    AG_KEY_PERCENT = 0x00000025, ##  %
    AG_KEY_AMPERSAND = 0x00000026, ##  &
    AG_KEY_QUOTE = 0x00000027,  ##  '
    AG_KEY_LEFTPAREN = 0x00000028, ##  (
    AG_KEY_RIGHTPAREN = 0x00000029, ##  )
    AG_KEY_ASTERISK = 0x0000002A, ##  *
    AG_KEY_PLUS = 0x0000002B,   ##  +
    AG_KEY_COMMA = 0x0000002C,  ##  ,
    AG_KEY_MINUS = 0x0000002D,  ##  -
    AG_KEY_PERIOD = 0x0000002E, ##  .
    AG_KEY_SLASH = 0x0000002F,  ##  /
    AG_KEY_0 = 0x00000030,      ##  0
    AG_KEY_1 = 0x00000031,      ##  1
    AG_KEY_2 = 0x00000032,      ##  2
    AG_KEY_3 = 0x00000033,      ##  3
    AG_KEY_4 = 0x00000034,      ##  4
    AG_KEY_5 = 0x00000035,      ##  5
    AG_KEY_6 = 0x00000036,      ##  6
    AG_KEY_7 = 0x00000037,      ##  7
    AG_KEY_8 = 0x00000038,      ##  8
    AG_KEY_9 = 0x00000039,      ##  9
    AG_KEY_COLON = 0x0000003A,  ##  :
    AG_KEY_SEMICOLON = 0x0000003B, ##  ;
    AG_KEY_LESS = 0x0000003C,   ##  <
    AG_KEY_EQUALS = 0x0000003D, ##  =
    AG_KEY_GREATER = 0x0000003E, ##  >
    AG_KEY_QUESTION = 0x0000003F, ##  ?
    AG_KEY_AT = 0x00000040,     ##  @
    AG_KEY_LEFTBRACKET = 0x0000005B, ##  [
    AG_KEY_BACKSLASH = 0x0000005C, ##  \
    AG_KEY_RIGHTBRACKET = 0x0000005D, ##  ]
    AG_KEY_CARET = 0x0000005E,  ##  ^
    AG_KEY_UNDERSCORE = 0x0000005F, ##  _
    AG_KEY_BACKQUOTE = 0x00000060, ##  `
    AG_KEY_A = 0x00000061,      ##  a
    AG_KEY_B = 0x00000062,      ##  b
    AG_KEY_C = 0x00000063,      ##  c
    AG_KEY_D = 0x00000064,      ##  d
    AG_KEY_E = 0x00000065,      ##  e
    AG_KEY_F = 0x00000066,      ##  f
    AG_KEY_G = 0x00000067,      ##  g
    AG_KEY_H = 0x00000068,      ##  h
    AG_KEY_I = 0x00000069,      ##  i
    AG_KEY_J = 0x0000006A,      ##  j
    AG_KEY_K = 0x0000006B,      ##  k
    AG_KEY_L = 0x0000006C,      ##  l
    AG_KEY_M = 0x0000006D,      ##  m
    AG_KEY_N = 0x0000006E,      ##  n
    AG_KEY_O = 0x0000006F,      ##  o
    AG_KEY_P = 0x00000070,      ##  p
    AG_KEY_Q = 0x00000071,      ##  q
    AG_KEY_R = 0x00000072,      ##  r
    AG_KEY_S = 0x00000073,      ##  s
    AG_KEY_T = 0x00000074,      ##  t
    AG_KEY_U = 0x00000075,      ##  u
    AG_KEY_V = 0x00000076,      ##  v
    AG_KEY_W = 0x00000077,      ##  w
    AG_KEY_X = 0x00000078,      ##  x
    AG_KEY_Y = 0x00000079,      ##  y
    AG_KEY_Z = 0x0000007A,      ##  z
    AG_KEY_DELETE = 0x0000007F, AG_KEY_KP0 = 0x00000100, AG_KEY_KP1 = 0x00000101,
    AG_KEY_KP2 = 0x00000102, AG_KEY_KP3 = 0x00000103, AG_KEY_KP4 = 0x00000104,
    AG_KEY_KP5 = 0x00000105, AG_KEY_KP6 = 0x00000106, AG_KEY_KP7 = 0x00000107,
    AG_KEY_KP8 = 0x00000108, AG_KEY_KP9 = 0x00000109, AG_KEY_KP_PERIOD = 0x0000010A,
    AG_KEY_KP_DIVIDE = 0x0000010B, AG_KEY_KP_MULTIPLY = 0x0000010C,
    AG_KEY_KP_MINUS = 0x0000010D, AG_KEY_KP_PLUS = 0x0000010E,
    AG_KEY_KP_ENTER = 0x0000010F, AG_KEY_KP_EQUALS = 0x00000110,
    AG_KEY_UP = 0x00000111, AG_KEY_DOWN = 0x00000112, AG_KEY_RIGHT = 0x00000113,
    AG_KEY_LEFT = 0x00000114, AG_KEY_INSERT = 0x00000115, AG_KEY_HOME = 0x00000116,
    AG_KEY_END = 0x00000117, AG_KEY_PAGEUP = 0x00000118, AG_KEY_PAGEDOWN = 0x00000119,
    AG_KEY_F1 = 0x0000011A, AG_KEY_F2 = 0x0000011B, AG_KEY_F3 = 0x0000011C,
    AG_KEY_F4 = 0x0000011D, AG_KEY_F5 = 0x0000011E, AG_KEY_F6 = 0x0000011F,
    AG_KEY_F7 = 0x00000120, AG_KEY_F8 = 0x00000121, AG_KEY_F9 = 0x00000122,
    AG_KEY_F10 = 0x00000123, AG_KEY_F11 = 0x00000124, AG_KEY_F12 = 0x00000125,
    AG_KEY_F13 = 0x00000126, AG_KEY_F14 = 0x00000127, AG_KEY_F15 = 0x00000128,
    AG_KEY_NUMLOCK = 0x0000012C, AG_KEY_CAPSLOCK = 0x0000012D,
    AG_KEY_SCROLLOCK = 0x0000012E, AG_KEY_RSHIFT = 0x0000012F,
    AG_KEY_LSHIFT = 0x00000130, AG_KEY_RCTRL = 0x00000131, AG_KEY_LCTRL = 0x00000132,
    AG_KEY_RALT = 0x00000133, AG_KEY_LALT = 0x00000134, AG_KEY_RMETA = 0x00000135,
    AG_KEY_LMETA = 0x00000136, AG_KEY_LSUPER = 0x00000137, AG_KEY_RSUPER = 0x00000138,
    AG_KEY_MODE = 0x00000139, AG_KEY_COMPOSE = 0x0000013A, AG_KEY_HELP = 0x0000013B,
    AG_KEY_PRINT = 0x0000013C, AG_KEY_SYSREQ = 0x0000013D, AG_KEY_BREAK = 0x0000013E,
    AG_KEY_MENU = 0x0000013F, AG_KEY_POWER = 0x00000140, AG_KEY_EURO = 0x00000141,
    AG_KEY_UNDO = 0x00000142, AG_KEY_GRAVE = 0x00000143, AG_KEY_KP_CLEAR = 0x00000144,
    AG_KEY_COMMAND = 0x00000145, AG_KEY_FUNCTION = 0x00000146,
    AG_KEY_VOLUME_UP = 0x00000147, AG_KEY_VOLUME_DOWN = 0x00000148,
    AG_KEY_VOLUME_MUTE = 0x00000149, AG_KEY_F16 = 0x0000014A, AG_KEY_F17 = 0x0000014B,
    AG_KEY_F18 = 0x0000014C, AG_KEY_F19 = 0x0000014D, AG_KEY_F20 = 0x0000014E,
    AG_KEY_F21 = 0x0000014F, AG_KEY_F22 = 0x00000150, AG_KEY_F23 = 0x00000151,
    AG_KEY_F24 = 0x00000152, AG_KEY_F25 = 0x00000153, AG_KEY_F26 = 0x00000154,
    AG_KEY_F27 = 0x00000155, AG_KEY_F28 = 0x00000156, AG_KEY_F29 = 0x00000157,
    AG_KEY_F30 = 0x00000158, AG_KEY_F31 = 0x00000159, AG_KEY_F32 = 0x0000015A,
    AG_KEY_F33 = 0x0000015B, AG_KEY_F34 = 0x0000015C, AG_KEY_F35 = 0x0000015D,
    AG_KEY_BEGIN = 0x0000015E, AG_KEY_RESET = 0x0000015F, AG_KEY_STOP = 0x00000160,
    AG_KEY_USER = 0x00000161, AG_KEY_SYSTEM = 0x00000162,
    AG_KEY_PRINT_SCREEN = 0x00000163, AG_KEY_CLEAR_LINE = 0x00000164,
    AG_KEY_CLEAR_DISPLAY = 0x00000165, AG_KEY_INSERT_LINE = 0x00000166,
    AG_KEY_DELETE_LINE = 0x00000167, AG_KEY_INSERT_CHAR = 0x00000168,
    AG_KEY_DELETE_CHAR = 0x00000169, AG_KEY_PREV = 0x0000016A,
    AG_KEY_NEXT = 0x0000016B, AG_KEY_SELECT = 0x0000016C, AG_KEY_EXECUTE = 0x0000016D,
    AG_KEY_REDO = 0x0000016E, AG_KEY_FIND = 0x0000016F,
    AG_KEY_MODE_SWITCH = 0x00000170, AG_KEY_LAST = 0x00000171, AG_KEY_ANY = 0x0000FFFF
  AG_KeyMod* = cuint
  AG_Key* {.bycopy.} = object
    sym*: AG_KeySym
    key_mod*: cint
    uch*: uint32
  AG_InputDevice* {.bycopy.} = object
    inherit*: AG_Object
    flags*: cuint
    drv*: pointer
    desc*: cstring
    events*: AG_EventQ
  AG_Keyboard* {.bycopy.} = object
    inherit*: AG_InputDevice
    flags*: cuint
    keyState*: ptr cint
    keyCount*: cuint
    modState*: cuint
  AG_Mouse* {.bycopy.} = object
    inherit*: AG_InputDevice
    nButtons*: cuint            ##  Button count (0 = unknown)
    btnState*: cuint            ##  Last button state (AG_MouseButton)
    x*: cint
    y*: cint                   ##  Last cursor position
    xRel*: cint
    yRel*: cint                ##  Last relative motion
  AG_Driver* {.bycopy.} = object
    inherit*: AG_Object
    id*: cuint
    flags*: cuint
    sRef*: AG_Surface
    videoFmt*: AG_PixelFormat
    kbd*: AG_Keyboard
    mouse*: AG_Mouse
    activeCursor*: AG_Cursor
    cursorsqh_first*: ptr AG_Cursor
    cursorsqh_last*: ptr ptr AG_Cursor
    nCursors*: cuint
    glyphCache*: ptr AG_GlyphCache
    gl*: pointer
  AG_MouseButton* {.pure.} = enum
    AG_MOUSE_NONE = 0x00000000, AG_MOUSE_LEFT = 0x00000001,
    AG_MOUSE_MIDDLE = 0x00000002, AG_MOUSE_RIGHT = 0x00000003,
    AG_MOUSE_WHEELUP = 0x00000004, AG_MOUSE_WHEELDOWN = 0x00000005,
    AG_MOUSE_X1 = 0x00000006, AG_MOUSE_X2 = 0x00000007, AG_MOUSE_ANY = 0x000000FF
  AG_MouseButtonAction* {.pure.} = enum
    AG_BUTTON_PRESSED, AG_BUTTON_RELEASED
  AG_ActionEventType* {.pure.} = enum
    AG_ACTION_ON_BUTTONDOWN,  ##  On mouse-button-down
    AG_ACTION_ON_BUTTONUP,    ##  On mouse-button-up
    AG_ACTION_ON_KEYDOWN,     ##  On key-down
    AG_ACTION_ON_KEYUP,       ##  On key-up
    AG_ACTION_ON_KEYREPEAT    ##  On key-down, with key repeat
  INNER_C_STRUCT_318221916* {.bycopy.} = object
    sym*: AG_KeySym            ##  Matching symbol
    key_mod*: AG_KeyMod          ##  Matching modifier
    toRepeat*: AG_Timer        ##  Key repeat timer
  INNER_C_UNION_3052014818* {.bycopy.} = object {.union.}
    button*: AG_MouseButton    ##  Button index
    key*: INNER_C_STRUCT_318221916
  AG_ActionTie* {.bycopy.} = object
    action_event_type*: AG_ActionEventType ##  Trigger event type
    data*: INNER_C_UNION_3052014818
    action*: array[64, char]    ##  Action name
    next*: ptr AG_ActionTie ##  next element
    prev*: ptr ptr AG_ActionTie ##  address of previous next element
  AG_RedrawTieType* {.pure.} = enum
    AG_REDRAW_ON_CHANGE, AG_REDRAW_ON_TICK
  AG_RedrawTie* {.bycopy.} = object
    redraw_tie_type*: AG_RedrawTieType
    name*: array[AG_VARIABLE_NAME_MAX, char] ##  Polled variable
    vlast*: AG_Variable        ##  Last accessed data
    vlastInited*: cint
    to*: AG_Timer              ##  Polling timer
    ival*: cuint                ##  Polling interval
    next*: ptr AG_RedrawTie ##  next element
    prev*: ptr ptr AG_RedrawTie ##  address of previous next element
  AG_StyleEntry* {.bycopy.} = object
    key*: array[AG_VARIABLE_NAME_MAX, char] ##  Target parameter
    value*: array[AG_STYLE_VALUE_MAX, char] ##  Set value
    next*: ptr AG_StyleEntry ##  next element
    prev*: ptr ptr AG_StyleEntry ##  address of previous next element
  AG_StyleBlock* {.bycopy.} = object
    match*: array[64, char]     ##  Pattern
    ent_first*: ptr AG_StyleEntry
    ent_last*: ptr ptr AG_StyleEntry
    blk_next*: ptr AG_StyleBlock ##  next element
    blk_prev*: ptr ptr AG_StyleBlock ##  address of previous next element
  AG_StyleSheet* {.bycopy.} = object
    blk_first*: ptr AG_StyleBlock
    blk_last*: ptr ptr AG_StyleBlock
  AG_WidgetPalette* {.bycopy.} = object
    c*: array[AG_WIDGET_NSTATES, array[AG_WIDGET_NCOLORS, AG_Color]]
  AG_Widget* {.bycopy.} = object
    obj*: AG_Object
    flags*: cuint
    x*: cint
    y*: cint                   ##  Coordinates in container
    w*: cint
    h*: cint                   ##  Allocated geometry
    rView*: AG_Rect2           ##  Effective view coordinates
    rSens*: AG_Rect2           ##  Effective sensitivity rectangle
    surfaces*: ptr ptr AG_Surface ##  Registered surfaces
    surfaceFlags*: ptr cuint     ##  Surface flags
    nsurfaces*: cuint
    textures*: ptr cuint         ##  Cached textures (driver-specific)
    texcoords*: ptr AG_TexCoord ##  Cached texture coordinates
    focusFwd*: ptr AG_Widget    ##  For ForwardFocus()
    window*: ptr AG_Window      ##  Parent window (if any)
    drv*: ptr AG_Driver         ##  Parent driver instance
    drvOps*: ptr AG_DriverClass ##  Parent driver class
    actions*: AG_Tbl           ##  Registered actions
    mouseAction_first*: ptr AG_ActionTie
    mouseAction_last*: ptr ptr AG_ActionTie
    keyAction_first*: ptr AG_ActionTie
    keyAction_last*: ptr ptr AG_ActionTie
    redrawTie_first*: ptr AG_RedrawTie
    redrawTie_last*: ptr ptr AG_RedrawTie
    cursorArea_first*: ptr AG_CursorArea
    cursorArea_last*: ptr ptr AG_CursorArea
    css*: ptr AG_StyleSheet     ##  Alternate style sheet
    cState*: AG_WidgetColorState ##  Current CSS color state
    font*: ptr AG_Font          ##  Computed font reference
    pal*: AG_WidgetPalette     ##  Computed color palette
    gl*: GLMatrices
  AG_TextVAlign* {.pure.} = enum
    AG_TEXT_TOP, AG_TEXT_MIDDLE, AG_TEXT_BOTTOM
  AG_TextState* {.bycopy.} = object
    font*: ptr AG_Font          ##  Font face
    color*: AG_Color           ##  Foreground text color
    colorBG*: AG_Color         ##  Background color
    justify*: AG_TextJustify  ##  Justification mode
    valign*: AG_TextVAlign    ##  Vertical alignment mode
    tabWd*: cint  
  AG_CachedText* {.bycopy.} = object
    text*: cstring             ##  Text string
    surface*: cint             ##  Surface mapping
    state*: AG_TextState       ##  Text rendering state
    next*: ptr AG_CachedText ##  next element
    prev*: ptr ptr AG_CachedText ##  address of previous next element
  AG_TextCacheBucket* {.bycopy.} = object
    first*: ptr AG_CachedText
    last*: ptr ptr AG_CachedText
    nEnts*: cuint
  AG_TextCache* {.bycopy.} = object
    widget*: ptr AG_Widget      ##  Widget managing surfaces
    buckets*: ptr AG_TextCacheBucket ##  Hash table
    nBuckets*: cuint
    curEnts*: cuint             ##  Current entries
    nBucketEnts*: cuint         ##  Target bucket utilization
  AG_LabelType* {.pure.} = enum
    AG_LABEL_STATIC,          ##  Display static text
    AG_LABEL_POLLED           ##  Display an AG_FmtString(3)
  AG_Label* {.bycopy.} = object
    wid*: AG_Widget
    `type`*: AG_LabelType
    flags*: cuint
    text*: cstring             ##  Text buffer (for static labels)
    surface*: cint             ##  Label surface
    surfaceCont*: cint         ##  [...] surface
    wPre*: cint
    hPre*: cint                ##  SizeHint dimensions
    lPad*: cint
    rPad*: cint
    tPad*: cint
    bPad*: cint                ##  Label padding
    justify*: AG_TextJustify  ##  Justification mode
    valign*: AG_TextVAlign    ##  Vertical alignment
    tCache*: ptr AG_TextCache  ##  Cache for polled labels
    rClip*: AG_Rect            ##  Clipping rectangle
    fmt*: ptr AG_FmtString      ##  Polled label data
    pollBuf*: cstring          ##  Buffer for polled labels
    pollBufSize*: csize
  AG_Box* {.bycopy.} = object
    wid*: AG_Widget
    `type`*: AG_BoxType
    flags*: cuint
    padding*: cint             ##  Padding around widgets
    spacing*: cint             ##  Spacing between widgets
    depth*: cint               ##  Depth of frame (for AG_BOX_FRAME)
    lbl*: ptr AG_Label          ##  Optional text label
    hAlign*: AG_BoxAlign
    vAlign*: AG_BoxAlign      ##  Widget alignment
  AG_Button* {.bycopy.} = object
    wid*: AG_Widget
    state*: cint               ##  Default state binding
    lbl*: ptr AG_Label          ##  Text label
    surface*: cint             ##  Icon surface handle
    justify*: AG_TextJustify  ##  Label justification
    valign*: AG_TextVAlign    ##  Vertical alignment
    flags*: cuint
    lPad*: cint
    rPad*: cint
    tPad*: cint
    bPad*: cint                ##  Padding in pixels
    delayTo*: AG_Timer
    repeatTo*: AG_Timer        ##  For AG_BUTTON_REPEAT
  AG_Checkbox* {.bycopy.} = object
    wid*: AG_Widget
    flags*: cuint
    state*: cint               ##  Default "state" binding
    spacing*: cint             ##  Spacing in pixels
    lbl*: ptr AG_Label          ##  Text label
  AG_MenuBinding* {.pure.} = enum       ##  Boolean binding
    AG_MENU_NO_BINDING, AG_MENU_INT_BOOL, AG_MENU_INT8_BOOL, AG_MENU_INT_FLAGS,
    AG_MENU_INT8_FLAGS, AG_MENU_INT16_FLAGS, AG_MENU_INT32_FLAGS
  AG_MenuItem* {.bycopy.} = object
    text*: cstring             ##  Label text
    lblMenu*: array[2, cint]    ##  Cached surfaces (for AG_Menu)
    lblView*: array[2, cint]    ##  Cached surfaces (for AG_MenuView)
    icon*: cint                ##  Icon surface mapping
    iconSrc*: ptr AG_Surface    ##  Icon surface source
    value*: cint               ##  Default bool value binding
    state*: cint               ##  State flag
    stateFn*: ptr AG_Function   ##  State function (overrides flag)
    key_equiv*: AG_KeySym      ##  Key shortcut
    key_mod*: AG_KeyMod
    x*: cint
    y*: cint                   ##  Position in parent view
    clickFn*: ptr AG_Event      ##  Raised on click
    poll*: ptr AG_Event         ##  Raised before the item is drawn
    flags*: cuint
    bind_type*: AG_MenuBinding
    bind_p*: pointer           ##  Pointer to bound variable
    bind_flags*: cuint        ##  Bitmask to control (for FLAGS)
    bind_invert*: cint         ##  Invert the value
    bind_lock*: ptr AG_Mutex    ##  Lock when accessing binding
    view*: ptr AG_MenuView     ##  Back pointer to view (subitems)
    pmenu*: ptr AG_Menu         ##  Parent menu
    sel_subitem*: ptr AG_MenuItem ##  Selected subitem
    tbButton*: ptr AG_Button    ##  Associated toolbar button
    parent*: ptr AG_MenuItem   ##  Parent MenuItem or NULL
    item_next*: ptr AG_MenuItem ##  next element
    item_prev*: ptr ptr AG_MenuItem ##  address of previous next element
    subItem_first*: ptr AG_MenuItem
    subItem_last*: ptr ptr AG_MenuItem
    nSubItems*: cuint
  AG_MenuItemQ* {.bycopy.} = object
    first*: ptr AG_MenuItem
    last*: ptr ptr AG_MenuItem
  AG_MenuStyle* {.pure.} = enum
    AG_MENU_DROPDOWN,         ##  Drop-down menu
    AG_MENU_POPUP,            ##  Contextual popup
    AG_MENU_GLOBAL            ##  Global application menu
  AG_ToolbarType* {.pure.} = enum
    AG_TOOLBAR_HORIZ, AG_TOOLBAR_VERT
  AG_Toolbar* {.bycopy.} = object
    box*: AG_Box
    rows*: array[AG_TOOLBAR_MAX_ROWS, ptr AG_Box]
    toolbar_type*: AG_ToolbarType
    nRows*: cint               ##  Number of rows
    nButtons*: cint            ##  Total number of buttons
    curRow*: cint              ##  Current row index
    flags*: cuint
  AG_Menu* {.bycopy.} = object
    wid*: AG_Widget
    flags*: cuint
    style*: AG_MenuStyle      ##  Menu style
    root*: ptr AG_MenuItem      ##  Root menu item
    selecting*: cint           ##  Selection in progress
    itemSel*: ptr AG_MenuItem   ##  Selected top-level item
    spHoriz*: cint             ##  Horiz spacing between items
    spVert*: cint              ##  Vertical spacing between items
    lPad*: cint
    rPad*: cint
    tPad*: cint
    bPad*: cint                ##  Global padding in pixels
    lPadLbl*: cint
    rPadLbl*: cint             ##  Item label padding in pixels
    tPadLbl*: cint
    bPadLbl*: cint
    itemh*: cint               ##  Item height (optimization)
    curState*: cint            ##  For MenuState()
    curToolbar*: ptr AG_Toolbar ##  For MenuToolbar()
    r*: AG_Rect                ##  View area
  AG_MenuView* {.bycopy.} = object
    wid*: AG_Widget
    pmenu*: ptr AG_Menu
    pitem*: ptr AG_MenuItem
    spIconLbl*: cint           ##  Icon and label spacing
    spLblArrow*: cint          ##  Label and submenu arrow spacing
    lPad*: cint
    rPad*: cint
    tPad*: cint
    bPad*: cint                ##  Padding in pixels
    submenuTo*: AG_Timer       ##  For sub-menu popup delay
    arrowRight*: cint          ##  Right arrow surface handle
  AG_PopupMenu* {.bycopy.} = object
    widget*: ptr AG_Widget      ##  Parent widget
    menu*: ptr AG_Menu          ##  Menu (allocated)
    root*: ptr AG_MenuItem      ##  Alias for menu->root
    win*: ptr AG_Window         ##  Expanded window
  AG_EditableBuffer* {.bycopy.} = object
    var_bind*: ptr AG_Variable     ##  Variable binding (if any)
    s*: ptr cuint              ##  String buffer (UCS-4 encoding)
    len*: csize                ##  String length (chars)
    maxLen*: csize             ##  Available buffer size (bytes)
    reallocable*: cint         ##  Buffer can be realloc'd
  AG_Editable* {.bycopy.} = object
    wid*: AG_Widget
    flags*: cuint
    encoding*: cstring         ##  Character set (default "UTF-8")
    text*: ptr AG_Text          ##  Default binding
    wPre*: cint
    hPre*: cint                ##  Size hint
    pos*: cint                 ##  Cursor position
    sel*: cint                 ##  Selection offset / range
    selDblClick*: cint         ##  Double click position
    compose*: cuint           ##  For input composition
    xCurs*: cint
    yCurs*: cint               ##  Last cursor position
    xSelStart*: cint
    ySelStart*: cint           ##  Last selection start position
    xSelEnd*: cint
    ySelEnd*: cint             ##  Last selection end position
    xCursPref*: cint           ##  Requested cursor position
    x*: cint                   ##  Horizontal offset (px)
    xMax*: cint                ##  Rightmost x of largest line (px)
    y*: cint                   ##  Vertical offset (lines)
    yMax*: cint                ##  Lowest y (lines)
    yVis*: cint                ##  Maximum visible area (lines)
    wheelTicks*: cuint        ##  For wheel acceleration
    sBuf*: AG_EditableBuffer   ##  Working buffer (for STATIC)
    r*: AG_Rect                ##  View area
    ca*: ptr AG_CursorArea      ##  Text cursor-change area
    fontMaxHeight*: cint       ##  Maximum character height
    lineSkip*: cint            ##  Y-increment in multiline mode
    pm*: ptr AG_PopupMenu      ##  Right-click popup menu
    lang*: AG_Language         ##  Selected language (for AG_Text)
    xScrollPx*: cint           ##  Explicit scroll request in pixels
    xScrollTo*: ptr cint
    yScrollTo*: ptr cint        ##  Scroll to specified position
    toRepeat*: AG_Timer        ##  Key repeat timer
    toCursorBlink*: AG_Timer   ##  Cursor blink timer
    toDblClick*: AG_Timer      ##  Double click timer
  AG_ScrollbarType* {.pure.} = enum
    AG_SCROLLBAR_HORIZ, AG_SCROLLBAR_VERT
  AG_ScrollbarButton* {.pure.} = enum
    AG_SCROLLBAR_BUTTON_NONE, AG_SCROLLBAR_BUTTON_DEC, AG_SCROLLBAR_BUTTON_INC,
    AG_SCROLLBAR_BUTTON_SCROLL
  AG_Scrollbar* {.bycopy.} = object
    wid*: AG_Widget
    flags*: cuint
    `type`*: AG_ScrollbarType ##  Style of scrollbar
    curBtn*: AG_ScrollbarButton ##  Active button
    mouseOverBtn*: AG_ScrollbarButton ##  Mouseover button
    width*: cint               ##  Scrollbar width
    length*: cint              ##  Length of scrolling control area
    wBar*: cint                ##  Preferred control length
    wBarMin*: cint             ##  Minimum control length
    hArrow*: cint              ##  Arrow height
    buttonIncFn*: ptr AG_Event  ##  Alt. handler for increment btns
    buttonDecFn*: ptr AG_Event  ##  Alt. handler for decrement btns
    moveTo*: AG_Timer          ##  Timer for scrolling control
    autoHideTo*: AG_Timer      ##  Timer for autohide check
    xOffs*: cint
    xSeek*: cint               ##  Cursor offset for scrolling
    lenPre*: cuint              ##  Preferred length size hint
    minOffs*: cint
    maxOffs*: cint
    visOffs*: cint             ##  Constants to add to binding values
  AG_Textbox* {.bycopy.} = object
    inherit*: AG_Widget
    ed*: ptr AG_Editable
    lbl*: ptr AG_Label          ##  Textbox label
    flags*: cuint
    boxPadX*: cint
    boxPadY*: cint             ##  Padding around textbox
    hBar*: ptr AG_Scrollbar
    vBar*: ptr AG_Scrollbar     ##  Scrollbars for MULTILINE
    r*: AG_Rect                ##  View area
    text*: ptr AG_Text          ##  Pointer to default binding
  AG_TlistItem* {.bycopy.} = object
    selected*: cint            ##  Effective selection
    iconsrc*: ptr AG_Surface    ##  Source icon (or NULL)
    icon*: cint                ##  Cached icon surface
    p1*: pointer               ##  User-supplied pointer
    cat*: cstring              ##  User-supplied category
    text*: array[AG_TLIST_LABEL_MAX, char] ##  Label text
    label*: cint               ##  Cached label surface
    depth*: cuint               ##  Indent in tree display
    flags*: cuint
    item_next*: ptr AG_TListItem ##  next element
    item_prev*: ptr ptr AG_TListItem ##  address of previous next element
    selitem_next*: ptr AG_TListItem ##  next element
    selitem_prev*: ptr ptr AG_TListItem ##  address of previous next element
  AG_TlistItemQ* {.bycopy.} = object
    first*: ptr AG_TListItem
    last*: ptr ptr AG_TListItem
  AG_TlistPopup* {.bycopy.} = object
    iclass*: cstring           ##  Apply to items of this class
    menu*: ptr AG_Menu
    item*: ptr AG_MenuItem
    panel*: ptr AG_Window
    next*: ptr AG_TlistPopup ##  next element
    prev*: ptr ptr AG_TlistPopup ##  address of previous next element
  AG_Tlist* {.bycopy.} = object
    wid*: AG_Widget
    flags*: cuint
    selected*: pointer         ##  Default `selected' binding
    wHint*: cint
    hHint*: cint               ##  Size hint
    wSpace*: cint              ##  Icon/text spacing
    item_h*: cint              ##  Item height
    icon_w*: cint              ##  Item icon width
    dblClicked*: pointer       ##  Used by double click
    items*: AG_TlistItemQ      ##  Current Items
    selitems*: AG_TlistItemQ   ##  Saved item state
    nitems*: cint              ##  Current item count
    nvisitems*: cint           ##  Visible item count
    sbar*: ptr AG_Scrollbar     ##  Vertical scrollbar
    popupqh_first*: ptr AG_TlistPopup
    popupsqh_last*: ptr ptr AG_TlistPopup
    compare_fn*: proc (a2: ptr AG_TlistItem; a3: ptr AG_TlistItem): cint
    popupEv*: ptr AG_Event      ##  Popup menu hook
    changedEv*: ptr AG_Event    ##  Selection change hook
    dblClickEv*: ptr AG_Event   ##  Double click hook
    moveTo*: AG_Timer          ##  Timer for keyboard motion
    wheelTicks*: cuint        ##  For wheel acceleration
    wRow*: cint                ##  Row width
    r*: AG_Rect                ##  View area
    refreshTo*: AG_Timer       ##  Timer for polled mode updates
    rOffs*: cint               ##  Row display offset
    dblClickTo*: AG_Timer      ##  Timer for detecting double clicks
    lastKeyDown*: cint         ##  For key repeat
  AG_Combo* {.bycopy.} = object
    wid*: AG_Widget
    flags*: cuint
    tbox*: ptr AG_Textbox       ##  Text input
    button*: ptr AG_Button      ##  [...] button
    list*: ptr AG_Tlist         ##  List of items
    panel*: ptr AG_Window
    wSaved*: cint
    hSaved*: cint              ##  Saved popup list geometry
    wPreList*: cint
    hPreList*: cint            ##  Size hints
  AG_Console* {.bycopy.} = object
    wid*: AG_Widget
    flags*: cuint
    padding*: cint             ##  Padding in pixels
    lineskip*: cint            ##  Space between lines
    lines*: ptr ptr AG_ConsoleLine ##  Lines in buffer
    nLines*: cuint              ##  Line count
    rOffs*: cuint               ##  Row display offset
    vBar*: ptr AG_Scrollbar     ##  Scrollbar
    r*: AG_Rect                ##  View area
    rVisible*: cuint            ##  Visible line count
    scrollTo*: ptr cuint         ##  Scrolling request
    pos*: cint
    sel*: cint                 ##  Position and selection
    pm*: ptr AG_PopupMenu
  AG_ConsoleLine* {.bycopy.} = object
    text*: cstring             ##  Line text
    len*: csize                ##  Length not including NUL
    surface*: array[2, cint]    ##  Cached surface handle (or -1)
    icon*: cint                ##  Icon to display
    cAlt*: AG_Color            ##  Alternate text color
    p*: pointer                ##  User pointer
    cons*: ptr AG_Console       ##  Back pointer to Console
  AG_DirDlg* {.bycopy.} = object
    wid*: AG_Widget
    flags*: cuint
    cwd*: array[AG_PATHNAME_MAX, char] ##  Current working directory
    tlDirs*: ptr AG_Tlist       ##  List of directories
    tbInput*: ptr AG_Textbox    ##  Filename input
    btnOk*: ptr AG_Button       ##  OK button
    btnCancel*: ptr AG_Button   ##  Cancel button
    okAction*: ptr AG_Event     ##  OK action
    cancelAction*: ptr AG_Event ##  Cancel action
    dirMRU*: cstring           ##  MRU Directory
    comLoc*: ptr AG_Combo       ##  Locations list
  AG_GL_BlendState* {.bycopy.} = object
    enabled*: cuchar        ##  GL_BLEND enable bit
    srcFactor*: cint          ##  GL_BLEND_SRC mode
    dstFactor*: cint          ##  GL_BLEND_DST mode
    texEnvMode*: cfloat       ##  GL_TEXTURE_ENV mode
  AG_ClipRect* {.bycopy.} = object
    r*: AG_Rect                ##  Integer coordinates
    eqns*: array[4, array[4, cdouble]] ##  Computed plane equations (GL)
  AG_GL_Context* {.bycopy.} = object
    clipStates*: array[4, cint] ##  Clipping rectangles enabled state
    clipRects*: ptr AG_ClipRect ##  Clipping rectangle coordinates
    nClipRects*: cuint
    textureGC*: ptr cuint        ##  Textures queued for deletion
    nTextureGC*: cuint
    listGC*: ptr cuint           ##  Display lists queued for deletion
    nListGC*: cuint
    bs*: array[1, AG_GL_BlendState] ##  Saved blending states
    dither*: array[128, cuchar]  ##  Dithering stipple pattern 
  AG_SizeAlloc* {.bycopy.} = object
    w*: cint
    h*: cint                   ##  Allocated geometry in pixels
    x*: cint
    y*: cint                   ##  Allocated position in pixels
  AG_DriverMwClass* {.bycopy.} = object
    inherit*: AG_DriverClass ##  Open/close native windows
    openWindow*: proc (a2: ptr AG_Window; r: AG_Rect; bpp: cint; flags: cuint): cint
    closeWindow*: proc (a2: ptr AG_Window) ##  Show and hide window
    mapWindow*: proc (a2: ptr AG_Window): cint
    unmapWindow*: proc (a2: ptr AG_Window): cint ##  Configure stacking order and parenting
    raiseWindow*: proc (a2: ptr AG_Window): cint
    lowerWindow*: proc (a2: ptr AG_Window): cint
    reparentWindow*: proc (a2: ptr AG_Window; a3: ptr AG_Window; a4: cint; a5: cint): cint ##  Change and query input focus state
    getInputFocus*: proc (a2: ptr ptr AG_Window): cint
    setInputFocus*: proc (a2: ptr AG_Window): cint ##  Move and resize windows
    moveWindow*: proc (a2: ptr AG_Window; x: cint; y: cint): cint
    resizeWindow*: proc (a2: ptr AG_Window; w: cuint; h: cuint): cint
    moveResizeWindow*: proc (a2: ptr AG_Window; a: ptr AG_SizeAlloc): cint
    preResizeCallback*: proc (a2: ptr AG_Window)
    postResizeCallback*: proc (a2: ptr AG_Window; a: ptr AG_SizeAlloc) ##  Capture window framebuffer contents (unlike renderToSurface)
    captureWindow*: proc (a2: ptr AG_Window; s: ptr ptr AG_Surface): cint ##  Configure window parameters
    setBorderWidth*: proc (a2: ptr AG_Window; w: cuint): cint
    setWindowCaption*: proc (a2: ptr AG_Window; a3: cstring): cint
    setTransientFor*: proc (a2: ptr AG_Window; a3: ptr AG_Window)
    setOpacity*: proc (a2: ptr AG_Window; opacity: cfloat): cint
    tweakAlignment*: proc (a2: ptr AG_Window; a: ptr AG_SizeAlloc; wMax: cuint; hMax: cuint)
  AG_DriverMw* {.bycopy.} = object
    inherit*: AG_Driver
    flags*: cuint
    win*: ptr AG_Window         ##  Back pointer to window
  AG_DriverSwClass* {.bycopy.} = object
    inherit*: AG_DriverClass
    flags*: cuint               ##  Create or attach to a graphics display
    openVideo*: proc (drv: pointer; w: cuint; h: cuint; depth: cint; flags: cuint): cint
    openVideoContext*: proc (drv: pointer; ctx: pointer; flags: cuint): cint
    setVideoContext*: proc (drv: pointer; ctx: pointer): cint
    closeVideo*: proc (drv: pointer) ##  Resize the display
    videoResize*: proc (drv: pointer; w: cuint; h: cuint): cint ##  Capture display contents to surface
    videoCapture*: proc (drv: pointer; a3: ptr ptr AG_Surface): cint ##  Clear background
    videoClear*: proc (drv: pointer; c: AG_Color)
  AG_WMOperation* {.pure.} = enum
    AG_WINOP_NONE,            ##  No operation
    AG_WINOP_MOVE,            ##  Move window
    AG_WINOP_LRESIZE,         ##  Resize (via left control)
    AG_WINOP_RRESIZE,         ##  Resize (via right control)
    AG_WINOP_HRESIZE          ##  Resize (via horizontal control)
  AG_Style* {.bycopy.} = object
  AG_DriverSw* {.bycopy.} = object
    inherit*: AG_Driver
    w*: cuint
    h*: cuint
    depth*: cuint               ##  Video resolution
    flags*: cuint
    winSelected*: ptr AG_Window ##  Window being moved/resized/etc
    winLastKeydown*: ptr AG_Window ##  For keyboard processing
    lmodal*: ptr AG_List        ##  Modal window stack
    winop*: AG_WMOperation    ##  WM operation in progress
    theme*: ptr AG_Style        ##  Default style for new windows
    windowXOutLimit*: cint     ##  Limit past left/right boundary
    windowBotOutLimit*: cint   ##  Limit past bottom boundary
    windowIconWidth*: cint     ##  Preferred window icon dimensions
    windowIconHeight*: cint
    rNom*: cuint                ##  Nominal refresh rate (ms)
    rCur*: cint                ##  Effective refresh rate (ms)
    bgColor*: AG_Color         ##  "bgColor" setting
    rLast*: cuint               ##  Refresh rate timestamp
  AG_EditableClipboard* {.bycopy.} = object
    lock*: AG_Mutex
    encoding*: array[32, char]  ##  Character set encoding
    s*: ptr cuint              ##  UCS-4 buffer
    len*: csize                ##  Length in characters
  AG_FileTypeOptionType* {.pure.} = enum
    AG_FILEDLG_BOOL, AG_FILEDLG_INT, AG_FILEDLG_FLOAT, AG_FILEDLG_DOUBLE,
    AG_FILEDLG_STRING
  INNER_C_STRUCT_3676356075* {.bycopy.} = object
    val*: cint
    min*: cint
    max*: cint
  INNER_C_STRUCT_2085602871* {.bycopy.} = object
    val*: cfloat
    min*: cfloat
    max*: cfloat
  INNER_C_STRUCT_2866190071* {.bycopy.} = object
    val*: cdouble
    min*: cdouble
    max*: cdouble
  INNER_C_UNION_4190200976* {.bycopy.} = object {.union.}
    i*: INNER_C_STRUCT_3676356075
    flt*: INNER_C_STRUCT_2085602871
    dbl*: INNER_C_STRUCT_2866190071
    s*: array[128, char]
  AG_FileTypeOption* {.bycopy.} = object
    descr*: cstring
    key*: cstring
    unit*: cstring
    file_type_option_type*: AG_FileTypeOptionType
    data*: INNER_C_UNION_4190200976
    next*: ptr AG_FileTypeOption ##  next element
    prev*: ptr ptr AG_FileTypeOption ##  address of previous next element
  AG_PaneType* {.pure.} = enum
    AG_PANE_HORIZ, AG_PANE_VERT
  AG_PaneResizeAction* {.pure.} = enum
    AG_PANE_EXPAND_DIV1,      ##  Expand left/upper division
    AG_PANE_EXPAND_DIV2,      ##  Expand right/lower division
    AG_PANE_DIVIDE_EVEN,      ##  Divide evenly
    AG_PANE_DIVIDE_PCT        ##  Divide per AG_PaneMoveDividerPct()
  AG_Pane* {.bycopy.} = object
    wid*: AG_Widget
    pane_type*: AG_PaneType
    flags*: cuint
    div_cont*: array[2, ptr AG_Box] ##  Division containers
    wMin*: array[2, cint]
    hMin*: array[2, cint]       ##  Minimum geometry
    wReq*: array[2, cint]
    hReq*: array[2, cint]       ##  Requisition geometry
    dmoving*: cint             ##  Divider being moved
    dx*: cint                  ##  Actual divider position
    rx*: cint                  ##  Requested divider position
    rxPct*: cint               ##  Requested position in %
    wDiv*: cint                ##  Divider width
    ca*: ptr AG_CursorArea      ##  Divider cursor-change area
    resizeAction*: AG_PaneResizeAction ##  Resize action
  AG_FileDlg* {.bycopy.} = object
    wid*: AG_Widget
    flags*: cuint
    cwd*: array[AG_PATHNAME_MAX, char] ##  Current working directory
    cfile*: array[AG_PATHNAME_MAX, char] ##  Current file path
    hPane*: ptr AG_Pane
    tlDirs*: ptr AG_Tlist       ##  List of directories
    tlFiles*: ptr AG_Tlist      ##  List of files
    lbCwd*: ptr AG_Label
    tbFile*: ptr AG_Textbox
    comTypes*: ptr AG_Combo
    cbMaskExt*: ptr AG_Checkbox
    cbMaskHidden*: ptr AG_Checkbox
    btnOk*: ptr AG_Button
    btnCancel*: ptr AG_Button
    okAction*: ptr AG_Event
    cancelAction*: ptr AG_Event
    dirMRU*: cstring           ##  MRU Directory
    optsCtr*: pointer          ##  Container widget for opts
    typesqh_first*: ptr AG_FileType
    typesqh_last*: ptr ptr AG_FileType
    comLoc*: ptr AG_Combo       ##  Locations list
  AG_FileType* {.bycopy.} = object
    fd*: ptr AG_FileDlg
    descr*: cstring            ##  Description
    exts*: cstringArray        ##  Filename extensions
    nexts*: cuint
    action*: ptr AG_Function    ##  Action (save/load)
    opts_first*: ptr AG_FileTypeOption
    opts_last*: ptr ptr AG_FileTypeOption
    types_next*: ptr AG_FileType ##  next element
    types_prev*: ptr ptr AG_FileType ##  address of previous next element
  AG_FileSelector* {.bycopy.} = object
    wid*: AG_Widget
    flags*: cuint
    inTxt*: array[AG_PATHNAME_MAX, char] ##  Input text buffer
    tbox*: ptr AG_Textbox       ##  Textbox
    button*: ptr AG_Button      ##  "Browse" button
    filedlg*: ptr AG_FileDlg    ##  File selection widget
    panel*: ptr AG_Window
    wSaved*: cint
    hSaved*: cint              ##  Saved popup geometry
    wPreList*: cint
    hPreList*: cint            ##  Size hints
  AG_Fixed* {.bycopy.} = object
    wid*: AG_Widget
    flags*: cuint
    wPre*: cint
    hPre*: cint                ##  User geometry
  AG_FixedPlotterValue* = int16
  AG_FixedPlotter* {.bycopy.} = object
    wid*: AG_Widget
    fixed_plotter_type*: AG_FixedPlotterType
    flags*: cuint
    yrange*: AG_FixedPlotterValue ##  Max. value
    xoffs*: AG_FixedPlotterValue ##  Display offset
    yOrigin*: cint             ##  Origin position (%)
    items*: AG_FixedPlotterItemQ ##  Items to plot
  AG_FixedPlotterItem* {.bycopy.} = object
    name*: array[AG_LABEL_MAX, char] ##  Description
    color*: AG_Color           ##  Line color
    vals*: ptr AG_FixedPlotterValue ##  Value array
    nvals*: cuint
    maxvals*: cuint
    limit*: cuint
    fpl*: ptr AG_FixedPlotter  ##  Back pointer
    next*: ptr AG_FixedPlotterItem ##  next element
    prev*: ptr ptr AG_FixedPlotterItem ##  address of previous next element
  AG_FixedPlotterItemQ* {.bycopy.} = object
    first*: ptr AG_FixedPlotterItem
    last*: ptr ptr AG_FixedPlotterItem
  AG_FixedPlotterType* {.pure.} = enum
    AG_FIXED_PLOTTER_POINTS, AG_FIXED_PLOTTER_LINES
  AG_FontSelector* {.bycopy.} = object
    wid*: AG_Widget
    flags*: cuint
    hPane*: ptr AG_Pane
    hPane2*: ptr AG_Pane        ##  Containers
    sizeBox*: ptr AG_Box        ##  Container for sizes
    tlFaces*: ptr AG_Tlist      ##  List of font faces
    tlStyles*: ptr AG_Tlist     ##  List of font styles
    tlSizes*: ptr AG_Tlist      ##  List of available sizes
    curFace*: array[AG_OBJECT_NAME_MAX, char] ##  Current font face
    curStyle*: cuint            ##  Current style flags
    curSize*: cint             ##  Current size
    rPreview*: AG_Rect         ##  Preview area
    sPreview*: cint            ##  Preview surface
    font*: ptr AG_Font          ##  Default `font' binding
  AG_UCombo* {.bycopy.} = object
    wid*: AG_Widget
    flags*: cuint
    button*: ptr AG_Button      ##  Selection button
    list*: ptr AG_Tlist         ##  Item list
    panel*: ptr AG_Window
    wSaved*: cint
    hSaved*: cint              ##  Saved popup list geometry
    wPreList*: cint
    hPreList*: cint            ##  Size hints
  AG_Unit* {.bycopy.} = object
    key*: cstring              ##  Key
    abbr*: cstring             ##  Abbreviated symbol
    name*: cstring             ##  Long name
    divider*: cdouble          ##  Conversion factor (linear)
    function*: proc (a2: cdouble; a3: cint): cdouble ##  Function (nonlinear)
  AG_FSpinbutton* {.bycopy.} = object
    wid*: AG_Widget
    value*: cdouble            ##  Default value binding
    min*: cdouble
    max*: cdouble              ##  Default range bindings
    inc*: cdouble              ##  Increment for buttons
    format*: array[32, char]    ##  Printing format
    unit*: ptr AG_Unit          ##  Conversion unit in use
    writeable*: cint           ##  0 = read-only
    inTxt*: array[64, char]     ##  Input text buffer
    input*: ptr AG_Textbox
    units*: ptr AG_UCombo
    incbu*: ptr AG_Button
    decbu*: ptr AG_Button
  AG_Point* {.bycopy.} = object
    x*: cint
    y*: cint
  AG_GLView* {.bycopy.} = object
    wid*: AG_Widget
    flags*: cuint
    wPre*: cint
    hPre*: cint                ##  Initial geometry
    draw_ev*: ptr AG_Event      ##  Draw callback
    overlay_ev*: ptr AG_Event   ##  Graphics overlay callback
    underlay_ev*: ptr AG_Event  ##  Graphics underlay callback
    scale_ev*: ptr AG_Event     ##  Scaling/movement event
    keydown_ev*: ptr AG_Event
    keyup_ev*: ptr AG_Event     ##  Keyboard events
    btndown_ev*: ptr AG_Event
    btnup_ev*: ptr AG_Event     ##  Mouse button events
    motion_ev*: ptr AG_Event    ##  Mouse motion event
    mProjection*: array[16, cfloat] ##  Projection matrix to load
    mModelview*: array[16, cfloat] ##  Modelview matrix to load
    mTexture*: array[16, cfloat] ##  Texture matrix to load
    bgColor*: AG_Color         ##  Background color
  AG_Graph* {.bycopy.} = object
    wid*: AG_Widget
    flags*: cuint
    wPre*: cint
    hPre*: cint                ##  Requested geometry
    xOffs*: cint
    yOffs*: cint               ##  Display offset
    xMin*: cint
    xMax*: cint
    yMin*: cint
    yMax*: cint                ##  Display boundaries
    hbar*: ptr AG_Scrollbar
    vbar*: ptr AG_Scrollbar     ##  Scrollbars for panning
    verticesqh_first*: ptr AG_GraphVertex
    verticesqh_last*: ptr ptr AG_GraphVertex
    edgesqh_first*: ptr AG_GraphEdge
    edgesqh_last*: ptr ptr AG_GraphEdge
    nvertices*: cuint
    nedges*: cuint
    pxMin*: cint
    pxMax*: cint
    pyMin*: cint
    pyMax*: cint               ##  Bounds of last cluster (for autoplacer)
    r*: AG_Rect                ##  View area
  AG_GraphEdge* {.bycopy.} = object
    labelTxt*: array[AG_GRAPH_LABEL_MAX, char] ##  Label text
    labelSu*: cint             ##  Text surface handle
    edgeColor*: AG_Color       ##  Edge color
    labelColor*: AG_Color      ##  Label color
    flags*: cuint
    v1*: ptr AG_GraphVertex
    v2*: ptr AG_GraphVertex     ##  Connected vertices
    userPtr*: pointer          ##  User pointer
    graph*: ptr AG_Graph        ##  Back pointer to graph
    next*: ptr AG_GraphEdge ##  next element
    prev*: ptr ptr AG_GraphEdge ##  address of previous next element
    popupMenu*: ptr AG_PopupMenu
  AG_GraphVertexStyle* {.pure.} = enum
    AG_GRAPH_RECTANGLE
    AG_GRAPH_CIRCLE
  AG_GraphVertex* {.bycopy.} = object
    labelTxt*: array[AG_GRAPH_LABEL_MAX, char] ##  Label text
    labelSu*: cint             ##  Text surface handle
    labelColor*: AG_Color      ##  Text color
    bgColor*: AG_Color         ##  Background color
    style*: AG_GraphVertexStyle ##  Vertex style
    flags*: cuint
    x*: cint
    y*: cint                   ##  Coordinates
    w*: cuint
    h*: cuint                   ##  Bounding box geometry
    userPtr*: pointer          ##  User pointer
    edges*: ptr ptr AG_GraphEdge ##  Back pointers to edges
    nedges*: cuint
    graph*: ptr AG_Graph        ##  Back pointer to graph
    vertex_next*: ptr AG_GraphVertex ##  next element
    vertex_prev*: ptr ptr AG_GraphVertex ##  address of previous next element
    sorted_next*: ptr AG_GraphVertex ##  next element
    sorted_prev*: ptr ptr AG_GraphVertex ##  address of previous next element
    popupMenu*: ptr AG_PopupMenu
  AG_HBox* {.bycopy.} = object
    box*: AG_Box
  HSVPalEnum* {.pure.} = enum
    AG_HSVPAL_SEL_NONE, AG_HSVPAL_SEL_H, ##  Selecting hue
    AG_HSVPAL_SEL_SV,         ##  Selecting saturation/value
    AG_HSVPAL_SEL_A           ##  Selecting transparency value
  AG_Circle* {.bycopy.} = object
    x*: cint
    y*: cint                   ##  Origin for circle of hues
    rout*: cint
    rin*: cint                 ##  Radii of the circle of hues
    spacing*: cint             ##  Spacing between circle and rect
    width*: cint               ##  Width of circular band (rout-rin)
    dh*: cfloat                ##  Calculated optimal hue increment  
  AG_Triangle* {.bycopy.} = object
    x*: cint
    y*: cint                   ##  Coordinates of triangle
    w*: cint
    h*: cint                   ##  Dimensions of triangle
  AG_HSVPal* {.bycopy.} = object
    wid*: AG_Widget
    flags*: cuint
    h*: cfloat
    s*: cfloat
    v*: cfloat
    a*: cfloat                 ##  Default bindings
    pixel*: cuint             ##  Calculated pixel
    color*: AG_Color           ##  Calculated color
    rAlpha*: AG_Rect           ##  Alpha selector rectangle
    surface*: ptr AG_Surface    ##  Cached surface
    surfaceId*: cint
    selcircle_r*: cint         ##  Radius of selection circles
    circle*: AG_Circle
    triangle*: AG_Triangle
    state*: HSVPalEnum
    menu*: ptr AG_Menu
    menu_item*: ptr AG_MenuItem
    menu_win*: ptr AG_Window
    cTile*: AG_Color
  AG_StaticIcon* {.bycopy.} = object
    w*: cuint
    h*: cuint                   ##  Dimensions in pixels
    Rmask*: cuint             ##  Red mask
    Gmask*: cuint             ##  Green mask
    Bmask*: cuint             ##  Blue mask
    Amask*: cuint             ##  Alpha mask
    data*: ptr cuint           ##  Pixel data
    s*: ptr AG_Surface          ##  Initialized surface  
  AG_KeyboardAction* {.pure.} = enum
    AG_KEY_RELEASED = 0, AG_KEY_PRESSED = 1
  AG_KeyCode* {.bycopy.} = object
    key*: AG_KeySym
    modFlags*: cstring
    function*: proc (a2: ptr AG_Editable; buf: ptr AG_EditableBuffer; ks: AG_KeySym;
                 key_mod: cuint; ch: cuint): cint
    flags*: cstring
  AG_KeyComposition* {.bycopy.} = object
    comp*: cuint              ##  First key
    key*: cuint               ##  Second key
    res*: cuint               ##  Resulting character
  AG_KeyMapping* {.bycopy.} = object
    key*: AG_KeySym            ##  Key
    modmask*: cuint             ##  Modifier mask
    unicode*: cuint           ##  UCS-4 mapping  
  AG_MPaneLayout* {.pure.} = enum
    AG_MPANE1,                ##  Single view
    AG_MPANE2V,               ##  Dual views (left/right)
    AG_MPANE2H,               ##  Dual views (top/bottom)
    AG_MPANE2L1R,             ##  Two views left, one view right
    AG_MPANE1L2R,             ##  One view left, two views right
    AG_MPANE2T1B,             ##  Two views top, one view bottom
    AG_MPANE1T2B,             ##  One view top, two views bottom
    AG_MPANE3L1R,             ##  Three views left, one view right
    AG_MPANE1L3R,             ##  One view left, three views right
    AG_MPANE3T1B,             ##  Three views top, one view bottom
    AG_MPANE1T3B,             ##  One view top, three views bottom
    AG_MPANE4                 ##  Four views
  AG_MFSpinbutton* {.bycopy.} = object
    wid*: AG_Widget
    flags*: cuint
    xvalue*: cdouble
    yvalue*: cdouble           ##  Default value bindings
    min*: cdouble
    max*: cdouble              ##  Default range bindings
    minFlt*: cfloat
    maxFlt*: cfloat
    inc*: cdouble              ##  Increment for buttons
    format*: array[32, char]    ##  Printing format
    sep*: cstring              ##  x/y field separator
    unit*: ptr AG_Unit          ##  Conversion unit
    writeable*: cint           ##  0 = read-only
    inTxt*: array[128, char]    ##  Input text buffer
    input*: ptr AG_Textbox
    units*: ptr AG_UCombo
    xincbu*: ptr AG_Button
    xdecbu*: ptr AG_Button
    yincbu*: ptr AG_Button
    ydecbu*: ptr AG_Button
    updateTo*: AG_Timer
  AG_MPane* {.bycopy.} = object
    box*: AG_Box
    layout*: AG_MPaneLayout
    flags*: cuint
    panes*: array[4, ptr AG_Box]
    npanes*: cuint
  AG_NotebookTabAlignment* {.pure.} = enum
    AG_NOTEBOOK_TABS_TOP, AG_NOTEBOOK_TABS_BOTTOM, AG_NOTEBOOK_TABS_LEFT,
    AG_NOTEBOOK_TABS_RIGHT
  AG_NotebookTab* {.bycopy.} = object
    box*: AG_Box
    lbl*: ptr AG_Label          ##  Optional text label
    next*: ptr AG_NotebookTab ##  next element
    prev*: ptr ptr AG_NotebookTab ##  address of previous next element
  AG_Notebook* {.bycopy.} = object
    wid*: AG_Widget
    tab_align*: AG_NotebookTabAlignment
    flags*: cuint
    bar_w*: cint
    bar_h*: cint               ##  Dimensions of tab button bar
    cont_w*: cint
    cont_h*: cint              ##  Dimensions of largest container
    spacing*: cint
    padding*: cint             ##  Spacing for tabs
    sel_tab*: ptr AG_NotebookTab
    tabsqh_first*: ptr AG_NotebookTab
    tabsqh_last*: ptr ptr AG_NotebookTab
    r*: AG_Rect                ##  View area
    nTabs*: cuint
  AG_Numerical* {.bycopy.} = object
    wid*: AG_Widget
    flags*: cuint
    format*: array[32, char]    ##  Print format (for reals)
    unit*: ptr AG_Unit          ##  Conversion unit in use
    writeable*: cint           ##  0 = read-only
    inTxt*: array[64, char]     ##  Input text buffer
    input*: ptr AG_Textbox      ##  Input textbox
    units*: ptr AG_UCombo       ##  Unit selector
    incbu*: ptr AG_Button       ##  Increment button
    decbu*: ptr AG_Button       ##  Decrement button
    wUnitSel*: cint
    hUnitSel*: cint            ##  Size hints for entry box
    wPreUnit*: cint            ##  Size hint for unit selector
    updateTo*: AG_Timer        ##  Timer for non-EXCL mode
  AG_ObjectSelector* {.bycopy.} = object
    com*: AG_Combo
    flags*: cuint
    type_mask*: array[AG_OBJECT_HIER_MAX, char]
    pobj*: pointer
    root*: pointer
    `object`*: pointer
  AG_Pixmap* {.bycopy.} = object
    wid*: AG_Widget
    flags*: cuint
    n*: cint                   ##  Current surface (or -1)
    s*: cint
    t*: cint                   ##  Source coordinates
    pre_w*: cint
    pre_h*: cint               ##  Geometry to use if there is no surface
    sScaled*: cint             ##  Scaled surface (for RESCALE)
    rClip*: AG_Rect            ##  Clipping rectangle (for !RESCALE)  
  AG_ProgressBarType* {.pure.} = enum
    AG_PROGRESS_BAR_HORIZ, AG_PROGRESS_BAR_VERT
  AG_ProgressBar* {.bycopy.} = object
    wid*: AG_Widget
    flags*: cuint
    value*: cint               ##  Default value binding
    min*: cint
    max*: cint                 ##  Default range binding
    progress_bar_type*: AG_ProgressBarType ##  Style
    width*: cint               ##  Width in pixels
    length*: cint              ##  Length in pixels
    pad*: cint                 ##  Padding in pixels
    tCache*: ptr AG_TextCache  ##  For SHOW_PCT
  AG_RadioItem* {.bycopy.} = object
    text*: array[128, char]
    surface*: cint
    hotkey*: AG_KeySym
  AG_Radio* {.bycopy.} = object
    wid*: AG_Widget
    flags*: cuint
    value*: cint               ##  Default value binding
    items*: ptr AG_RadioItem
    nItems*: cint
    selitem*: cint             ##  Index of selected item
    max_w*: cint               ##  Width of widest label
    oversel*: cint             ##  Overlapping selection
    xPadding*: cint
    yPadding*: cint
    xSpacing*: cint
    ySpacing*: cint
    radius*: cint              ##  Control radius in pixels
    itemHeight*: cint
    r*: AG_Rect                ##  View area
  AG_WidgetPacking* {.pure.} = enum
    AG_PACK_HORIZ, AG_PACK_VERT
  AG_Scrollview* {.bycopy.} = object
    wid*: AG_Widget
    flags*: cuint
    pack*: AG_WidgetPacking   ##  Packing mode
    wPre*: cint
    hPre*: cint                ##  Requested geometry
    xOffs*: cint
    yOffs*: cint               ##  Display offset
    xMin*: cint
    xMax*: cint
    yMin*: cint
    yMax*: cint                ##  Display boundaries
    r*: AG_Rect                ##  Available space for widgets
    hbar*: ptr AG_Scrollbar
    vbar*: ptr AG_Scrollbar     ##  Scrollbars for panning
    wBar*: cint
    hBar2*: cint                ##  Effective scrollbar sizes
    incr*: cint                ##  Scrolling increment
  AG_SeparatorType* {.pure.} = enum
    AG_SEPARATOR_HORIZ, AG_SEPARATOR_VERT
  AG_Separator* {.bycopy.} = object
    wid*: AG_Widget
    `type`*: AG_SeparatorType
    padding*: cuint             ##  Padding in pixels
    visible*: cint             ##  Visible flag
  AG_SliderType* {.pure.} = enum
    AG_SLIDER_HORIZ, AG_SLIDER_VERT
  AG_SliderButton* {.pure.} = enum
    AG_SLIDER_BUTTON_NONE, AG_SLIDER_BUTTON_DEC, AG_SLIDER_BUTTON_INC,
    AG_SLIDER_BUTTON_SCROLL
  AG_Slider* {.bycopy.} = object
    wid*: AG_Widget
    flags*: cuint
    value*: cint               ##  Default value binding
    min*: cint
    max*: cint                 ##  Default range bindings
    `type`*: AG_SliderType    ##  Style of scrollbar
    ctlPressed*: cint          ##  Control is pressed
    wControlPref*: cint        ##  Control size (preferred)
    wControl*: cint            ##  Control size (effective)
    moveTo*: AG_Timer          ##  Timer for keyboard motion
    xOffs*: cint               ##  Cursor offset for scrolling
    extent*: cint              ##  Available area for scrolling
  AG_Spinbutton* {.bycopy.} = object
    wid*: AG_Widget
    value*: cint               ##  Default value binding
    min*: cint
    max*: cint                 ##  Default range bindings
    incr*: cint                ##  Increment for buttons
    writeable*: cint           ##  0 = read-only
    inTxt*: array[64, char]     ##  Input text buffer
    input*: ptr AG_Textbox
    incbu*: ptr AG_Button
    decbu*: ptr AG_Button
  AG_Statusbar* {.bycopy.} = object
    box*: AG_Box
    flags*: cuint
    labels*: array[AG_STATUSBAR_MAX_LABELS, ptr AG_Label]
    nlabels*: cint
  AG_StaticCSS* {.bycopy.} = object
    name*: cstring             ##  Identifier
    size*: cuint              ##  Size in bytes
    data*: cstringArray        ##  CSS data
    css*: ptr AG_StyleSheet     ##  Initialized stylesheet
  AG_TableSelMode* {.pure.} = enum
    AG_TABLE_SEL_ROWS,        ##  Select entire rows
    AG_TABLE_SEL_CELLS,       ##  Select individual cells
    AG_TABLE_SEL_COLS         ##  Select entire columns
  AG_TablePopup* {.bycopy.} = object
    m*: cint
    n*: cint                   ##  Row/column (-1 = all)
    menu*: ptr AG_Menu
    item*: ptr AG_MenuItem
    panel*: ptr AG_Window
    sle_next*: ptr AG_TablePopup
  AG_TableCellType* {.pure.} = enum
    AG_CELL_NULL, AG_CELL_STRING, AG_CELL_INT, AG_CELL_UINT, AG_CELL_LONG,
    AG_CELL_ULONG, AG_CELL_FLOAT, AG_CELL_DOUBLE, AG_CELL_PSTRING, AG_CELL_PINT,
    AG_CELL_PUINT, AG_CELL_PLONG, AG_CELL_PULONG, AG_CELL_PUINT8, AG_CELL_PSINT8,
    AG_CELL_PUINT16, AG_CELL_PSINT16, AG_CELL_PUINT32, AG_CELL_PSINT32,
    AG_CELL_PFLOAT, AG_CELL_PDOUBLE, AG_CELL_INT64, AG_CELL_UINT64, AG_CELL_PINT64,
    AG_CELL_PUINT64, AG_CELL_POINTER, AG_CELL_FN_SU, AG_CELL_FN_SU_NODUP,
    AG_CELL_FN_TXT, AG_CELL_WIDGET
  AG_TableCol* {.bycopy.} = object
    name*: array[AG_TABLE_COL_NAME_MAX, char]
    sortFn*: proc (a2: pointer; a3: pointer): cint
    flags*: cuint
    selected*: cint            ##  Entire column is selected
    w*: cint                   ##  Width (px)
    wPct*: cint                ##  Width (percent or -1)
    x*: cint                   ##  Current position
    surface*: cint             ##  Text surface mapping
    ca*: ptr AG_CursorArea      ##  Column resize cursor-change area
  AG_Table* {.bycopy.} = object
    wid*: AG_Widget
    flags*: cuint
    selMode*: AG_TableSelMode ##  Selection mode
    wHint*: cint
    hHint*: cint               ##  Size hint
    sep*: cstring              ##  Field separators
    hRow*: cint                ##  Row height (px)
    hCol*: cint                ##  Column header height (px)
    wColMin*: cint             ##  Minimum column width (px)
    wColDefault*: cint         ##  "Default" pixel width to use in
                               ##  size requisition for "%" and FILL
                               ##  columns
    xOffs*: cint               ##  Column display offset
    mOffs*: cint               ##  Row offset (for poll function)
    cols*: ptr AG_TableCol      ##  Column data
    cells*: ptr ptr AG_TableCell ##  Current cell data (sorted rows)
    cPrev*: ptr AG_TableBucket  ##  Saved cells (value hash)
    nPrevBuckets*: cuint
    cPrevListqh_first*: ptr AG_TableCell
    cPrevListqh_last*: ptr ptr AG_TableCell
    n*: cint                   ##  Number of columns
    m*: cint                   ##  Number of rows
    mVis*: cint                ##  Maximum number of visible rows
    nResizing*: cint           ##  Column being resized (or -1)
    vbar*: ptr AG_Scrollbar     ##  Vertical scrollbar
    hbar*: ptr AG_Scrollbar     ##  Horizontal scrollbar
    poll_ev*: ptr AG_Event      ##  Poll event
    dblClickRowEv*: ptr AG_Event ##  Row double click callback
    dblClickColEv*: ptr AG_Event ##  Column double click callback
    dblClickCellEv*: ptr AG_Event ##  Cell double click callback
    dblClickedRow*: cint       ##  For SEL_ROWS
    dblClickedCol*: cint       ##  For SEL_COLS
    dblClickedCell*: cint      ##  For SEL_CELLS
    wheelTicks*: cuint        ##  For wheel acceleration
    moveTo*: AG_Timer          ##  Timers for keyboard motion
    r*: AG_Rect                ##  View area
    wTot*: cint                ##  Total width for all columns
    selColor*: AG_Color        ##  Selection color
    slh_first*: ptr AG_TablePopup
    colAction*: cuint
    clickRowEv*: ptr AG_Event   ##  Row double click callback
    clickColEv*: ptr AG_Event   ##  Column double click callback
    clickCellEv*: ptr AG_Event  ##  Cell double click callback
    nSorting*: cuint            ##  Index of sorting column
                  ## 					   (computed from flags)
    pollTo*: AG_Timer          ##  For polled table update
    dblClickTo*: AG_Timer      ##  For double click
  TableCellData* {.bycopy.} = object {.union.}
    s*: array[AG_TABLE_TXT_MAX, char]
    i*: cint
    f*: cdouble
    p*: pointer
    l*: clong
    u64*: uint64
  AG_TableCell* {.bycopy.} = object
    `type`*: AG_TableCellType
    data*: TableCellData
    fmt*: array[AG_TABLE_FMT_MAX, char] ##  Format string
    fnSu*: proc (a2: pointer; a3: cint; a4: cint): ptr AG_Surface ##  For AG_CELL_FN_SU
    fnTxt*: proc (a2: pointer; a3: cstring; a4: csize) ##  For AG_CELL_FN_TXT
    widget*: ptr AG_Widget      ##  For AG_CELL_WIDGET
    selected*: cint            ##  Cell is selected
    surface*: cint             ##  Named of mapped surface
    tbl*: ptr AG_Table          ##  Back pointer to Table
    id*: cuint                  ##  Optional user-specified ID
    flags*: cuint
    cell_next*: ptr AG_TableCell ##  next element
    cell_prev*: ptr ptr AG_TableCell ##  address of previous next element
    cells_list_next*: ptr AG_TableCell ##  next element
    cells_list_prev*: ptr ptr AG_TableCell ##  address of previous next element
    nPrev*: cuint               ##  For SEL_ROWS mode
  AG_TableBucket* {.bycopy.} = object
    first*: ptr AG_TableCell
    last*: ptr ptr AG_TableCell
  AG_TextMsgTitle* {.pure.} = enum
    AG_MSG_ERROR, AG_MSG_WARNING, AG_MSG_INFO
  AG_StaticFont* {.bycopy.} = object
    name*: cstring             ##  Identifier
    `type`*: AG_FontType      ##  Type of font
    size*: cuint              ##  Size in bytes
    data*: ptr cuchar            ##  Font data
    font*: ptr AG_Font          ##  Initialized font structure
  AG_TextMetrics* {.bycopy.} = object
    w*: cint
    h*: cint                   ##  Dimensions in pixels
    wLines*: ptr cuint           ##  Width of each line
    nLines*: cuint              ##  Total line count
  AG_TreetblCell* {.bycopy.} = object
    text*: cstring             ##  Cell text
    textSu*: cint              ##  Rendered surface or -1
  AG_TreetblRowDocketItem* {.bycopy.} = object
    row*: ptr AG_TreetblRow     ##  Visible row cache
    depth*: cuint
  INNER_C_STRUCT_1406202721* {.bycopy.} = object
    redraw_last*: cuint         ##  Last drawn
    redraw_rate*: cuint         ##  Refresh rate
    dirty*: cint               ##  Needs update
    count*: cuint               ##  Visible rows per view
    items*: ptr AG_TreetblRowDocketItem
  AG_Treetbl* {.bycopy.} = object
    wid*: AG_Widget
    flags*: cuint
    r*: AG_Rect                ##  View area
    hCol*: cint                ##  Header height
    hRow*: cint                ##  Per-row height
    dblClicked*: cint          ##  Used by double click
    wHint*: cint
    hHint*: cint               ##  Size hint
    toDblClick*: AG_Timer
    n*: cuint                   ##  Column count
    column*: ptr AG_TreetblCol  ##  Column array
    sortMode*: AG_TreetblSortMode ##  Sorting mode
    children*: AG_TreetblRowQ  ##  Tree of rows
    backstore*: AG_TreetblRowQ ##  For polling
    nExpandedRows*: cint       ##  Number of rows visible
    vBar*: ptr AG_Scrollbar     ##  Vertical scrollbar
    hBar*: ptr AG_Scrollbar     ##  Horizontal scrollbar
    cellDataFn*: AG_TreetblDataFn ##  Callback to get cell data
    sortFn*: AG_TreetblSortFn  ##  Compare function
    visible*: INNER_C_STRUCT_1406202721
  AG_TreetblRow* {.bycopy.} = object
    rid*: cint                 ##  Row identifier
    tbl*: ptr AG_Treetbl        ##  Back pointer to Treetbl
    cell*: ptr AG_TreetblCell   ##  Array of cells
    flags*: cuint
    parent*: ptr AG_TreetblRow
    children*: AG_TreetblRowQ
    sibling_next*: ptr AG_TreetblRow ##  next element
    sibling_prev*: ptr ptr AG_TreetblRow ##  address of previous next element
    backstore_next*: ptr AG_TreetblRow ##  next element
    backstore_prev*: ptr ptr AG_TreetblRow ##  address of previous next element
  AG_TreetblRowQ* {.bycopy.} = object
    first*: ptr AG_TreetblRow
    last*: ptr ptr AG_TreetblRow
  AG_TreetblCol* {.bycopy.} = object
    cid*: cint                 ##  Column identifier
    tbl*: ptr AG_Treetbl        ##  Back pointer to Treetbl
    idx*: cuint                 ##  Index into row->cell[]
    flags*: cuint
    label*: array[AG_TREETBL_LABEL_MAX, char] ##  Header text
    labelSu*: cint             ##  Cached text surface or -1
    w*: cint                   ##  Column width
  AG_TreetblDataFn* = proc (a2: ptr AG_Treetbl; a3: cint; a4: cint): cstring
  AG_TreetblSortFn* = proc (a2: ptr AG_Treetbl; a3: cint; a4: cint; a5: cint; a6: cint): cint
  AG_TreetblSortMode* {.pure.} = enum
    AG_TREETBL_SORT_NOT = 0, AG_TREETBL_SORT_ASC = 1, AG_TREETBL_SORT_DSC = 2
  FT_Bitmap* {.bycopy.} = object
  FT_Face* {.bycopy.} = object
  AG_TTFGlyph* {.bycopy.} = object
    stored*: cint
    index*: cuint
    bitmap*: FT_Bitmap
    pixmap*: FT_Bitmap
    minx*: cint
    maxx*: cint
    miny*: cint
    maxy*: cint
    yoffset*: cint
    advance*: cint
    cached*: cuint
  AG_TTFFont* {.bycopy.} = object
    face*: FT_Face
    height*: cint
    ascent*: cint
    descent*: cint
    lineskip*: cint
    style*: cint
    glyph_overhang*: cint
    glyph_italics*: cfloat
    underline_offset*: cint
    underline_height*: cint
    current*: ptr AG_TTFGlyph
    cache*: array[256, AG_TTFGlyph] ##  Transform cache
    scratch*: AG_TTFGlyph
    font_size_family*: cint    ##  For non-scalable formats
  AG_VBox* {.bycopy.} = object
    box*: AG_Box
  AG_SizeReq* {.bycopy.} = object
    w*: cint
    h*: cint                   ##  Requested geometry in pixels
  AG_WidgetClass* {.bycopy.} = object
    inherit*: AG_ObjectClass
    draw*: proc (a2: pointer)
    size_request*: proc (a2: pointer; a3: ptr AG_SizeReq)
    size_allocate*: proc (a2: pointer; a3: ptr AG_SizeAlloc): cint
  AG_SizeSpec* {.pure.} = enum
    AG_WIDGET_BAD_SPEC,       ##  Parser error
    AG_WIDGET_PIXELS,         ##  Pixel count
    AG_WIDGET_PERCENT,        ##  % of available space
    AG_WIDGET_STRINGLEN,      ##  Width of given string
    AG_WIDGET_FILL            ##  Fill remaining space
  AG_FlagDescr* {.bycopy.} = object
    bitmask*: cuint            ##  Bitmask
    descr*: cstring            ##  Bit(s) description
    writeable*: cint           ##  User-editable
  AG_ActionType* {.pure.} = enum
    AG_ACTION_FN,             ##  Execute function
    AG_ACTION_SET_INT,        ##  Set an integer
    AG_ACTION_TOGGLE_INT,     ##  Toggle an integer
    AG_ACTION_SET_FLAG,       ##  Set specified bits in a word
    AG_ACTION_TOGGLE_FLAG     ##  Toggle specified bits in a word
  AG_Action* {.bycopy.} = object
    `type`*: AG_ActionType
    widget*: ptr AG_Widget      ##  Back pointer to widget
    fn*: ptr AG_Event           ##  Callback function
    p*: pointer                ##  Target (for SET_*)
    val*: cint                 ##  Value (for SET_*)
    bitmask*: cuint             ##  Bitmask (for SET_FLAG)
  AG_WindowCloseAction* {.pure.} = enum
    AG_WINDOW_HIDE, AG_WINDOW_DETACH, AG_WINDOW_IGNORE
  SDL_Surface* = object
  SDL_Event* = object

const
  AG_ACTION_ON_BUTTON* = AG_ACTION_ON_BUTTONDOWN

const
  AG_KEY_ASCII_START* = AG_KEY_NONE
  AG_KEY_ASCII_END* = AG_KEY_DELETE

const
  AG_BOX_TOP* = AG_BOX_LEFT
  AG_BOX_MIDDLE* = AG_BOX_CENTER
  AG_BOX_BOTTOM* = AG_BOX_RIGHT

const
  AG_WINDOW_UPPER_LEFT* = AG_WINDOW_TL
  AG_WINDOW_UPPER_CENTER* = AG_WINDOW_TC
  AG_WINDOW_UPPER_RIGHT* = AG_WINDOW_TR
  AG_WINDOW_MIDDLE_LEFT* = AG_WINDOW_ML
  AG_WINDOW_CENTER* = AG_WINDOW_MC
  AG_WINDOW_MIDDLE_RIGHT* = AG_WINDOW_MR
  AG_WINDOW_LOWER_LEFT* = AG_WINDOW_BL
  AG_WINDOW_LOWER_CENTER* = AG_WINDOW_BC
  AG_WINDOW_LOWER_RIGHT* = AG_WINDOW_BR

template AG_MOUSE_BUTTON_T*(b: untyped): untyped =
  (1 shl ((b) - 1))

const
  AG_MOUSE_LMASK* = AG_MOUSE_BUTTON_T(1)
  AG_MOUSE_MMASK* = AG_MOUSE_BUTTON_T(2)
  AG_MOUSE_RMASK* = AG_MOUSE_BUTTON_T(3)

proc AG_ColorHex*(h: uint32): AG_Color {.inline.} =
  var c: AG_Color
  c.r = ((h and 0xff000000u32) shr 24u32).cuchar
  c.g = ((h and 0x00ff0000u32) shr 16u32).cuchar
  c.b = ((h and 0x0000ff00u32) shr 8u32).cuchar
  c.a = (h and 0x000000ff).cuchar
  c

proc `==`*(c1, c2: AG_Color): bool {.inline.} =
  result = c1.r == c2.r and
           c1.g == c2.g and
           c1.b == c2.b and
           c1.a == c2.a
           
proc AG_AnimNew*(a2: AG_AnimType; a3: cuint; a4: cuint; a5: ptr AG_PixelFormat; a6: cuint): ptr AG_Anim {.importc:"AG_AnimNew", libag_gui.}
proc AG_AnimEmpty*(): ptr AG_Anim {.importc:"AG_AnimEmpty", libag_gui.}
proc AG_AnimIndexed*(a2: cuint; a3: cuint; a4: cint; a5: cuint): ptr AG_Anim {.importc:"AG_AnimIndexed", libag_gui.}
proc AG_AnimRGB*(a2: cuint; a3: cuint; a4: cint; a5: cuint; a6: uint32; a7: uint32; a8: uint32): ptr AG_Anim {.importc:"AG_AnimRGB", libag_gui.}
proc AG_AnimRGBA*(a2: cuint; a3: cuint; a4: cint; a5: cuint; a6: uint32; a7: uint32; a8: uint32; a9: uint32): ptr AG_Anim {.importc:"AG_AnimRGBA", libag_gui.}
proc AG_AnimFromPNGs*(a2: cstring): ptr AG_Anim {.importc:"AG_AnimFromPNGs", libag_gui.}
proc AG_AnimFromJPEGs*(a2: cstring): ptr AG_Anim {.importc:"AG_AnimFromJPEGs", libag_gui.}
proc AG_AnimSetPalette*(a2: ptr AG_Anim; a3: ptr AG_Color; a4: cuint; a5: cuint): cint {.importc:"AG_AnimSetPalette", libag_gui.}
proc AG_AnimDup*(a2: ptr AG_Anim): ptr AG_Anim {.importc:"AG_AnimDup", libag_gui.}
proc AG_AnimResize*(a2: ptr AG_Anim; a3: cuint; a4: cuint): cint {.importc:"AG_AnimResize", libag_gui.}
proc AG_AnimFree*(a2: ptr AG_Anim) {.importc:"AG_AnimFree", libag_gui.}
proc AG_AnimStateInit*(a2: ptr AG_Anim; a3: ptr AG_AnimState) {.importc:"AG_AnimStateInit", libag_gui.}
proc AG_AnimStateDestroy*(a2: ptr AG_Anim; a3: ptr AG_AnimState) {.importc:"AG_AnimStateDestroy", libag_gui.}
proc AG_AnimSetOrigFPS*(a2: ptr AG_Anim; a3: cdouble) {.importc:"AG_AnimSetOrigFPS", libag_gui.}
proc AG_AnimSetFPS*(a2: ptr AG_AnimState; a3: cdouble) {.importc:"AG_AnimSetFPS", libag_gui.}
proc AG_AnimSetLoop*(a2: ptr AG_AnimState; a3: cint) {.importc:"AG_AnimSetLoop", libag_gui.}
proc AG_AnimSetPingPong*(a2: ptr AG_AnimState; a3: cint) {.importc:"AG_AnimSetPingPong", libag_gui.}
proc AG_AnimSetAlpha*(a2: ptr AG_Anim; a3: cuint; a4: uint8) {.importc:"AG_AnimSetAlpha", libag_gui.}
proc AG_AnimSetColorKey*(a2: ptr AG_Anim; a3: cuint; a4: uint32) {.importc:"AG_AnimSetColorKey", libag_gui.}
proc AG_AnimPlay*(a2: ptr AG_AnimState): cint {.importc:"AG_AnimPlay", libag_gui.}
proc AG_AnimStop*(a2: ptr AG_AnimState) {.importc:"AG_AnimStop", libag_gui.}
proc AG_AnimFrameNew*(a2: ptr AG_Anim; a3: ptr AG_Surface): cint {.importc:"AG_AnimFrameNew", libag_gui.}
proc AG_AnimFrameToSurface*(a2: ptr AG_Anim; a3: cint): ptr AG_Surface {.importc:"AG_AnimFrameToSurface", libag_gui.}
proc AG_BoxNew*(a2: pointer; a3: AG_BoxType; a4: cuint): ptr AG_Box {.importc:"AG_BoxNew", libag_gui.}
proc AG_BoxSetLabel*(a2: ptr AG_Box; a3: cstring)  {.importc:"AG_BoxSetLabel", varargs, libag_gui.}
proc AG_BoxSetLabelS*(a2: ptr AG_Box; a3: cstring) {.importc:"AG_BoxSetLabelS", libag_gui.}
proc AG_BoxSetHomogenous*(a2: ptr AG_Box; a3: cint) {.importc:"AG_BoxSetHomogenous", libag_gui.}
proc AG_BoxSetPadding*(a2: ptr AG_Box; a3: cint) {.importc:"AG_BoxSetPadding", libag_gui.}
proc AG_BoxSetSpacing*(a2: ptr AG_Box; a3: cint) {.importc:"AG_BoxSetSpacing", libag_gui.}
proc AG_BoxSetDepth*(a2: ptr AG_Box; a3: cint) {.importc:"AG_BoxSetDepth", libag_gui.}
proc AG_BoxSetType*(a2: ptr AG_Box; a3: AG_BoxType) {.importc:"AG_BoxSetType", libag_gui.}
proc AG_BoxSetHorizAlign*(a2: ptr AG_Box; a3: AG_BoxAlign) {.importc:"AG_BoxSetHorizAlign", libag_gui.}
proc AG_BoxSetVertAlign*(a2: ptr AG_Box; a3: AG_BoxAlign) {.importc:"AG_BoxSetVertAlign", libag_gui.}
proc AG_ButtonNew*(a2: pointer; a3: cuint; a4: cstring): ptr AG_Button  {.importc:"AG_ButtonNew", varargs, libag_gui.}
proc AG_ButtonNewS*(a2: pointer; a3: cuint; a4: cstring): ptr AG_Button {.importc:"AG_ButtonNewS", libag_gui.}
proc AG_ButtonNewFn*(a2: pointer; a3: cuint; a4: cstring; a5: AG_EventFn; a6: cstring): ptr AG_Button  {.importc:"AG_ButtonNewFn", varargs, libag_gui.}
proc AG_ButtonNewInt*(a2: pointer; a3: cuint; a4: cstring; a5: ptr cint): ptr AG_Button {.importc:"AG_ButtonNewInt", libag_gui.}
proc AG_ButtonNewUint8*(a2: pointer; a3: cuint; a4: cstring; a5: ptr uint8): ptr AG_Button {.importc:"AG_ButtonNewUint8", libag_gui.}
proc AG_ButtonNewUint16*(a2: pointer; a3: cuint; a4: cstring; a5: ptr uint16): ptr AG_Button {.importc:"AG_ButtonNewUint16", libag_gui.}
proc AG_ButtonNewuint32*(a2: pointer; a3: cuint; a4: cstring; a5: ptr uint32): ptr AG_Button {.importc:"AG_ButtonNewuint32", libag_gui.}
proc AG_ButtonNewFlag*(a2: pointer; a3: cuint; a4: cstring; a5: ptr cuint; a6: cuint): ptr AG_Button {.importc:"AG_ButtonNewFlag", libag_gui.}
proc AG_ButtonNewFlag8*(a2: pointer; a3: cuint; a4: cstring; a5: ptr uint8; a6: uint8): ptr AG_Button {.importc:"AG_ButtonNewFlag8", libag_gui.}
proc AG_ButtonNewFlag16*(a2: pointer; a3: cuint; a4: cstring; a5: ptr uint16; a6: uint16): ptr AG_Button {.importc:"AG_ButtonNewFlag16", libag_gui.}
proc AG_ButtonNewFlag32*(a2: pointer; a3: cuint; a4: cstring; a5: ptr uint32; a6: uint32): ptr AG_Button {.importc:"AG_ButtonNewFlag32", libag_gui.}
proc AG_ButtonSetPadding*(a2: ptr AG_Button; a3: cint; a4: cint; a5: cint; a6: cint) {.importc:"AG_ButtonSetPadding", libag_gui.}
proc AG_ButtonSetFocusable*(a2: ptr AG_Button; a3: cint) {.importc:"AG_ButtonSetFocusable", libag_gui.}
proc AG_ButtonSetSticky*(a2: ptr AG_Button; a3: cint) {.importc:"AG_ButtonSetSticky", libag_gui.}
proc AG_ButtonInvertState*(a2: ptr AG_Button; a3: cint) {.importc:"AG_ButtonInvertState", libag_gui.}
proc AG_ButtonJustify*(a2: ptr AG_Button; a3: AG_TextJustify) {.importc:"AG_ButtonJustify", libag_gui.}
proc AG_ButtonValign*(a2: ptr AG_Button; a3: AG_TextVAlign) {.importc:"AG_ButtonValign", libag_gui.}
proc AG_ButtonSurface*(a2: ptr AG_Button; a3: ptr AG_Surface) {.importc:"AG_ButtonSurface", libag_gui.}
proc AG_ButtonSurfaceNODUP*(a2: ptr AG_Button; a3: ptr AG_Surface) {.importc:"AG_ButtonSurfaceNODUP", libag_gui.}
proc AG_ButtonSetRepeatMode*(a2: ptr AG_Button; a3: cint) {.importc:"AG_ButtonSetRepeatMode", libag_gui.}
proc AG_ButtonText*(a2: ptr AG_Button; a3: cstring)  {.importc:"AG_ButtonText", varargs, libag_gui.}
proc AG_ButtonTextS*(a2: ptr AG_Button; a3: cstring) {.importc:"AG_ButtonTextS", libag_gui.}
proc AG_CheckboxNew*(a2: pointer; a3: cuint; a4: cstring): ptr AG_Checkbox  {.importc:"AG_CheckboxNew", varargs, libag_gui.}
proc AG_CheckboxNewS*(a2: pointer; a3: cuint; a4: cstring): ptr AG_Checkbox {.importc:"AG_CheckboxNewS", libag_gui.}
proc AG_CheckboxNewFn*(a2: pointer; a3: cuint; a4: cstring; a5: AG_EventFn; a6: cstring): ptr AG_Checkbox  {.importc:"AG_CheckboxNewFn", varargs, libag_gui.}
proc AG_CheckboxNewInt*(a2: pointer; a3: cuint; a4: cstring; a5: ptr cint): ptr AG_Checkbox {.importc:"AG_CheckboxNewInt", libag_gui.}
proc AG_CheckboxNewFlag*(a2: pointer; a3: cuint; a4: cstring; a5: ptr cuint; a6: cuint): ptr AG_Checkbox {.importc:"AG_CheckboxNewFlag", libag_gui.}
proc AG_CheckboxNewFlag32*(a2: pointer; a3: cuint; a4: cstring; a5: ptr uint32; a6: uint32): ptr AG_Checkbox {.importc:"AG_CheckboxNewFlag32", libag_gui.}
proc AG_CheckboxSetFromFlags*(a2: pointer; a3: cuint; a4: ptr cuint; a5: ptr AG_FlagDescr) {.importc:"AG_CheckboxSetFromFlags", libag_gui.}
proc AG_CheckboxSetFromFlags32*(a2: pointer; a3: cuint; a4: ptr uint32; a5: ptr AG_FlagDescr) {.importc:"AG_CheckboxSetFromFlags32", libag_gui.}
proc AG_CheckboxToggle*(a2: ptr AG_Checkbox) {.importc:"AG_CheckboxToggle", libag_gui.}
proc AG_ColorFromString*(a2: cstring; a3: ptr AG_Color): AG_Color {.importc:"AG_ColorFromString", libag_gui.}
proc AG_ComboNew*(a2: pointer; a3: cuint; a4: cstring): ptr AG_Combo  {.importc:"AG_ComboNew", varargs, libag_gui.}
proc AG_ComboNewS*(a2: pointer; a3: cuint; a4: cstring): ptr AG_Combo {.importc:"AG_ComboNewS", libag_gui.}
proc AG_ComboSizeHint*(a2: ptr AG_Combo; a3: cstring; a4: cint) {.importc:"AG_ComboSizeHint", libag_gui.}
proc AG_ComboSizeHintPixels*(a2: ptr AG_Combo; a3: cint; a4: cint) {.importc:"AG_ComboSizeHintPixels", libag_gui.}
proc AG_ComboSelect*(a2: ptr AG_Combo; a3: ptr AG_TlistItem) {.importc:"AG_ComboSelect", libag_gui.}
proc AG_ComboSelectPointer*(a2: ptr AG_Combo; a3: pointer): ptr AG_TlistItem {.importc:"AG_ComboSelectPointer", libag_gui.}
proc AG_ComboSelectText*(a2: ptr AG_Combo; a3: cstring): ptr AG_TlistItem {.importc:"AG_ComboSelectText", libag_gui.}
proc AG_ComboSetButtonText*(a2: ptr AG_Combo; a3: cstring) {.importc:"AG_ComboSetButtonText", libag_gui.}
proc AG_ComboSetButtonSurface*(a2: ptr AG_Combo; a3: ptr AG_Surface) {.importc:"AG_ComboSetButtonSurface", libag_gui.}
proc AG_ComboSetButtonSurfaceNODUP*(a2: ptr AG_Combo; a3: ptr AG_Surface) {.importc:"AG_ComboSetButtonSurfaceNODUP", libag_gui.}
proc AG_ConsoleNew*(a2: pointer; a3: cuint): ptr AG_Console {.importc:"AG_ConsoleNew", libag_gui.}
proc AG_ConsoleSetPadding*(a2: ptr AG_Console; a3: cint) {.importc:"AG_ConsoleSetPadding", libag_gui.}
proc AG_ConsoleSetFont*(a2: ptr AG_Console; a3: ptr AG_Font) {.importc:"AG_ConsoleSetFont", libag_gui.}
proc AG_ConsoleAppendLine*(a2: ptr AG_Console; a3: cstring): ptr AG_ConsoleLine {.importc:"AG_ConsoleAppendLine", libag_gui.}
proc AG_ConsoleMsg*(a2: ptr AG_Console; a3: cstring): ptr AG_ConsoleLine  {.importc:"AG_ConsoleMsg", varargs, libag_gui.}
proc AG_ConsoleMsgS*(a2: ptr AG_Console; a3: cstring): ptr AG_ConsoleLine {.importc:"AG_ConsoleMsgS", libag_gui.}
proc AG_ConsoleMsgEdit*(a2: ptr AG_ConsoleLine; a3: cstring) {.importc:"AG_ConsoleMsgEdit", libag_gui.}
proc AG_ConsoleMsgPtr*(a2: ptr AG_ConsoleLine; a3: pointer) {.importc:"AG_ConsoleMsgPtr", libag_gui.}
proc AG_ConsoleMsgIcon*(a2: ptr AG_ConsoleLine; a3: cint) {.importc:"AG_ConsoleMsgIcon", libag_gui.}
proc AG_ConsoleMsgColor*(a2: ptr AG_ConsoleLine; a3: ptr AG_Color) {.importc:"AG_ConsoleMsgColor", libag_gui.}
proc AG_ConsoleClear*(a2: ptr AG_Console) {.importc:"AG_ConsoleClear", libag_gui.}
proc AG_ConsoleExportText*(a2: ptr AG_Console; a3: cint): cstring {.importc:"AG_ConsoleExportText", libag_gui.}
proc AG_InitStockCursors*(a2: ptr AG_Driver): cint {.importc:"AG_InitStockCursors", libag_gui.}
proc AG_FreeCursors*(a2: ptr AG_Driver) {.importc:"AG_FreeCursors", libag_gui.}
proc AG_CursorNew*(a2: pointer; a3: cuint; a4: cuint; a5: ptr uint8; a6: ptr uint8; a7: cint; a8: cint): ptr AG_Cursor {.importc:"AG_CursorNew", libag_gui.}
proc AG_CursorFromXPM*(a2: pointer; a3: ptr cstring; a4: cint; a5: cint): ptr AG_Cursor {.importc:"AG_CursorFromXPM", libag_gui.}
proc AG_CursorFree*(a2: pointer; a3: ptr AG_Cursor) {.importc:"AG_CursorFree", libag_gui.}
proc AG_DirDlgNew*(a2: pointer; a3: cuint): ptr AG_DirDlg {.importc:"AG_DirDlgNew", libag_gui.}
proc AG_DirDlgNewMRU*(a2: pointer; a3: cstring; a4: cuint): ptr AG_DirDlg {.importc:"AG_DirDlgNewMRU", libag_gui.}
proc AG_DirDlgSetDirectoryMRU*(a2: ptr AG_DirDlg; a3: cstring; a4: cstring) {.importc:"AG_DirDlgSetDirectoryMRU", libag_gui.}
proc AG_DirDlgSetDirectoryS*(a2: ptr AG_DirDlg; a3: cstring): cint {.importc:"AG_DirDlgSetDirectoryS", libag_gui.}
proc AG_DirDlgSetDirectory*(a2: ptr AG_DirDlg; a3: cstring): cint  {.importc:"AG_DirDlgSetDirectory", varargs, libag_gui.}
proc AG_DirDlgOkAction*(a2: ptr AG_DirDlg; a3: AG_EventFn; a4: cstring)  {.importc:"AG_DirDlgOkAction", varargs, libag_gui.}
proc AG_DirDlgCancelAction*(a2: ptr AG_DirDlg; a3: AG_EventFn; a4: cstring)  {.importc:"AG_DirDlgCancelAction", varargs, libag_gui.}
proc AG_DirDlgCheckReadAccess*(a2: ptr AG_DirDlg): cint {.importc:"AG_DirDlgCheckReadAccess", libag_gui.}
proc AG_DirDlgCheckWriteAccess*(a2: ptr AG_DirDlg): cint {.importc:"AG_DirDlgCheckWriteAccess", libag_gui.}
proc AG_ListDriverNames*(a2: cstring; a3: csize) {.importc:"AG_ListDriverNames", libag_gui.}
proc AG_DriverOpen*(a2: ptr AG_DriverClass): ptr AG_Driver {.importc:"AG_DriverOpen", libag_gui.}
proc AG_DriverClose*(a2: ptr AG_Driver) {.importc:"AG_DriverClose", libag_gui.}
proc AG_ViewCapture*() {.importc:"AG_ViewCapture", libag_gui.}
proc AG_GL_InitContext*(a2: pointer; a3: ptr AG_GL_Context): cint {.importc:"AG_GL_InitContext", libag_gui.}
proc AG_GL_SetViewport*(a2: ptr AG_GL_Context; a3: AG_Rect) {.importc:"AG_GL_SetViewport", libag_gui.}
proc AG_GL_DestroyContext*(a2: pointer) {.importc:"AG_GL_DestroyContext", libag_gui.}
proc AG_GL_StdPushClipRect*(a2: pointer; a3: AG_Rect) {.importc:"AG_GL_StdPushClipRect", libag_gui.}
proc AG_GL_StdPopClipRect*(a2: pointer) {.importc:"AG_GL_StdPopClipRect", libag_gui.}
proc AG_GL_StdPushBlendingMode*(a2: pointer; a3: AG_BlendFn; a4: AG_BlendFn) {.importc:"AG_GL_StdPushBlendingMode", libag_gui.}
proc AG_GL_StdPopBlendingMode*(a2: pointer) {.importc:"AG_GL_StdPopBlendingMode", libag_gui.}
proc AG_GL_StdUploadTexture*(a2: pointer; a3: ptr cuint; a4: ptr AG_Surface; a5: ptr AG_TexCoord) {.importc:"AG_GL_StdUploadTexture", libag_gui.}
proc AG_GL_StdUpdateTexture*(a2: pointer; a3: cuint; a4: ptr AG_Surface; a5: ptr AG_TexCoord): cint {.importc:"AG_GL_StdUpdateTexture", libag_gui.}
proc AG_GL_StdDeleteTexture*(a2: pointer; a3: cuint) {.importc:"AG_GL_StdDeleteTexture", libag_gui.}
proc AG_GL_StdDeleteList*(a2: pointer; a3: cuint) {.importc:"AG_GL_StdDeleteList", libag_gui.}
proc AG_GL_PrepareTexture*(a2: pointer; a3: cint) {.importc:"AG_GL_PrepareTexture", libag_gui.}
proc AG_GL_BlitSurface*(a2: pointer; a3: ptr AG_Widget; a4: ptr AG_Surface; a5: cint; a6: cint) {.importc:"AG_GL_BlitSurface", libag_gui.}
proc AG_GL_BlitSurfaceFrom*(a2: pointer; a3: ptr AG_Widget; a4: ptr AG_Widget; a5: cint; a6: ptr AG_Rect; a7: cint; a8: cint) {.importc:"AG_GL_BlitSurfaceFrom", libag_gui.}
proc AG_GL_BlitSurfaceGL*(a2: pointer; a3: ptr AG_Widget; a4: ptr AG_Surface; a5: cfloat; a6: cfloat) {.importc:"AG_GL_BlitSurfaceGL", libag_gui.}
proc AG_GL_BlitSurfaceFromGL*(a2: pointer; a3: ptr AG_Widget; a4: cint; a5: cfloat; a6: cfloat) {.importc:"AG_GL_BlitSurfaceFromGL", libag_gui.}
proc AG_GL_BlitSurfaceFlippedGL*(a2: pointer; a3: ptr AG_Widget; a4: cint; a5: cfloat; a6: cfloat) {.importc:"AG_GL_BlitSurfaceFlippedGL", libag_gui.}
proc AG_GL_BackupSurfaces*(a2: pointer; a3: ptr AG_Widget) {.importc:"AG_GL_BackupSurfaces", libag_gui.}
proc AG_GL_RestoreSurfaces*(a2: pointer; a3: ptr AG_Widget) {.importc:"AG_GL_RestoreSurfaces", libag_gui.}
proc AG_GL_RenderToSurface*(a2: pointer; a3: ptr AG_Widget; a4: ptr ptr AG_Surface): cint {.importc:"AG_GL_RenderToSurface", libag_gui.}
proc AG_GL_FillRect*(a2: pointer; a3: AG_Rect; a4: AG_Color) {.importc:"AG_GL_FillRect", libag_gui.}
proc AG_GL_PutPixel*(a2: pointer; a3: cint; a4: cint; a5: AG_Color) {.importc:"AG_GL_PutPixel", libag_gui.}
proc AG_GL_PutPixel32*(a2: pointer; a3: cint; a4: cint; a5: uint32) {.importc:"AG_GL_PutPixel32", libag_gui.}
proc AG_GL_PutPixelRGB*(a2: pointer; a3: cint; a4: cint; a5: uint8; a6: uint8; a7: uint8) {.importc:"AG_GL_PutPixelRGB", libag_gui.}
proc AG_GL_BlendPixel*(a2: pointer; a3: cint; a4: cint; a5: AG_Color; a6: AG_BlendFn; a7: AG_BlendFn) {.importc:"AG_GL_BlendPixel", libag_gui.}
proc AG_GL_DrawLine*(a2: pointer; a3: cint; a4: cint; a5: cint; a6: cint; a7: AG_Color) {.importc:"AG_GL_DrawLine", libag_gui.}
proc AG_GL_DrawLineH*(a2: pointer; a3: cint; a4: cint; a5: cint; a6: AG_Color) {.importc:"AG_GL_DrawLineH", libag_gui.}
proc AG_GL_DrawLineV*(a2: pointer; a3: cint; a4: cint; a5: cint; a6: AG_Color) {.importc:"AG_GL_DrawLineV", libag_gui.}
proc AG_GL_DrawLineBlended*(a2: pointer; a3: cint; a4: cint; a5: cint; a6: cint; a7: AG_Color; a8: AG_BlendFn; a9: AG_BlendFn) {.importc:"AG_GL_DrawLineBlended", libag_gui.}
proc AG_GL_DrawArrow*(a2: pointer; a3: cfloat; a4: cint; a5: cint; a6: cint; a7: AG_Color; a8: AG_Color) {.importc:"AG_GL_DrawArrow", libag_gui.}
proc AG_GL_DrawRectDithered*(a2: pointer; a3: AG_Rect; a4: AG_Color) {.importc:"AG_GL_DrawRectDithered", libag_gui.}
proc AG_GL_DrawBoxRounded*(a2: pointer; a3: AG_Rect; a4: cint; a5: cint; a6: AG_Color; a7: AG_Color; a8: AG_Color) {.importc:"AG_GL_DrawBoxRounded", libag_gui.}
proc AG_GL_DrawBoxRoundedTop*(a2: pointer; a3: AG_Rect; a4: cint; a5: cint; a6: AG_Color; a7: AG_Color; a8: AG_Color) {.importc:"AG_GL_DrawBoxRoundedTop", libag_gui.}
proc AG_GL_DrawCircle*(a2: pointer; a3: cint; a4: cint; a5: cint; a6: AG_Color) {.importc:"AG_GL_DrawCircle", libag_gui.}
proc AG_GL_DrawCircle2*(a2: pointer; a3: cint; a4: cint; a5: cint; a6: AG_Color) {.importc:"AG_GL_DrawCircle2", libag_gui.}
proc AG_GL_DrawCircleFilled*(a2: pointer; a3: cint; a4: cint; a5: cint; a6: AG_Color) {.importc:"AG_GL_DrawCircleFilled", libag_gui.}
proc AG_GL_DrawRectFilled*(a2: pointer; a3: AG_Rect; a4: AG_Color) {.importc:"AG_GL_DrawRectFilled", libag_gui.}
proc AG_GL_DrawRectBlended*(a2: pointer; a3: AG_Rect; a4: AG_Color; a5: AG_BlendFn;a6: AG_BlendFn) {.importc:"AG_GL_DrawRectBlended", libag_gui.}
proc AG_GL_UpdateGlyph*(a2: pointer; a3: ptr AG_Glyph) {.importc:"AG_GL_UpdateGlyph", libag_gui.}
proc AG_GL_DrawGlyph*(a2: pointer; a3: ptr AG_Glyph; a4: cint; a5: cint) {.importc:"AG_GL_DrawGlyph", libag_gui.}
proc InitKeymaps*() {.importc:"InitKeymaps", libag_gui.}
proc AG_SDL_GetPixelFormat*(a2: ptr SDL_Surface): ptr AG_PixelFormat {.importc:"AG_SDL_GetPixelFormat", libag_gui.}
proc AG_SDL_BlitSurface*(a2: ptr AG_Surface; a3: ptr AG_Rect; a4: ptr SDL_Surface; a5: cint; a6: cint) {.importc:"AG_SDL_BlitSurface", libag_gui.}
proc AG_SDL_ImportSurface*(a2: ptr SDL_Surface): ptr AG_Surface {.importc:"AG_SDL_ImportSurface", libag_gui.}
proc AG_SDL_SetRefreshRate*(a2: pointer; a3: cint): cint {.importc:"AG_SDL_SetRefreshRate", libag_gui.}
proc AG_SDL_InitDefaultCursor*(a2: pointer): cint {.importc:"AG_SDL_InitDefaultCursor", libag_gui.}
proc AG_SDL_SetCursor*(a2: pointer; a3: ptr AG_Cursor): cint {.importc:"AG_SDL_SetCursor", libag_gui.}
proc AG_SDL_UnsetCursor*(a2: pointer) {.importc:"AG_SDL_UnsetCursor", libag_gui.}
proc AG_SDL_CreateCursor*(a2: pointer; a3: cuint; a4: cuint; a5: ptr uint8; a6: ptr uint8; a7: cint; a8: cint): ptr AG_Cursor {.importc:"AG_SDL_CreateCursor", libag_gui.}
proc AG_SDL_FreeCursor*(a2: pointer; a3: ptr AG_Cursor) {.importc:"AG_SDL_FreeCursor", libag_gui.}
proc AG_SDL_GetCursorVisibility*(a2: pointer): cint {.importc:"AG_SDL_GetCursorVisibility", libag_gui.}
proc AG_SDL_SetCursorVisibility*(a2: pointer; a3: cint) {.importc:"AG_SDL_SetCursorVisibility", libag_gui.}
proc AG_SDL_GetDisplaySize*(a2: ptr cuint; a3: ptr cuint): cint {.importc:"AG_SDL_GetDisplaySize", libag_gui.}
proc AG_SDL_GetPrefDisplaySettings*(a2: pointer; a3: ptr cuint; a4: ptr cuint; a5: ptr cint) {.importc:"AG_SDL_GetPrefDisplaySettings", libag_gui.}
proc AG_SDL_BeginEventProcessing*(a2: pointer) {.importc:"AG_SDL_BeginEventProcessing", libag_gui.}
proc AG_SDL_PendingEvents*(a2: pointer): cint {.importc:"AG_SDL_PendingEvents", libag_gui.}
proc AG_SDL_TranslateEvent*(a2: pointer; a3: ptr SDL_Event; a4: ptr AG_DriverEvent) {.importc:"AG_SDL_TranslateEvent", libag_gui.}
proc AG_SDL_GetNextEvent*(a2: pointer; a3: ptr AG_DriverEvent): cint {.importc:"AG_SDL_GetNextEvent", libag_gui.}
proc AG_SDL_ProcessEvent*(a2: pointer; a3: ptr AG_DriverEvent): cint {.importc:"AG_SDL_ProcessEvent", libag_gui.}
proc AG_SDL_EventSink*(a2: ptr AG_EventSink; a3: ptr AG_Event): cint {.importc:"AG_SDL_EventSink", libag_gui.}
proc AG_SDL_EventEpilogue*(a2: ptr AG_EventSink; a3: ptr AG_Event): cint {.importc:"AG_SDL_EventEpilogue", libag_gui.}
proc AG_SDL_EndEventProcessing*(a2: pointer) {.importc:"AG_SDL_EndEventProcessing", libag_gui.}
proc AG_WM_BackgroundPopupMenu*(a2: ptr AG_DriverSw) {.importc:"AG_WM_BackgroundPopupMenu", libag_gui.}
proc AG_WM_CommitWindowFocus*(a2: ptr AG_Window) {.importc:"AG_WM_CommitWindowFocus", libag_gui.}
proc AG_ResizeDisplay*(a2: cint; a3: cint): cint {.importc:"AG_ResizeDisplay", libag_gui.}
proc AG_PostResizeDisplay*(a2: ptr AG_DriverSw) {.importc:"AG_PostResizeDisplay", libag_gui.}
proc AG_SetVideoResizeCallback*(a2: proc (a2: cuint; a3: cuint)) {.importc:"AG_SetVideoResizeCallback", libag_gui.}
proc AG_WM_LimitWindowToView*(a2: ptr AG_Window) {.importc:"AG_WM_LimitWindowToView", libag_gui.}
proc AG_WM_LimitWindowToDisplaySize*(a2: ptr AG_Driver; a3: ptr AG_SizeAlloc) {.importc:"AG_WM_LimitWindowToDisplaySize", libag_gui.}
proc AG_WM_GetPrefPosition*(a2: ptr AG_Window; a3: ptr cint; a4: ptr cint; a5: cint; a6: cint) {.importc:"AG_WM_GetPrefPosition", libag_gui.}
proc AG_WM_MoveBegin*(a2: ptr AG_Window) {.importc:"AG_WM_MoveBegin", libag_gui.}
proc AG_WM_MoveEnd*(a2: ptr AG_Window) {.importc:"AG_WM_MoveEnd", libag_gui.}
proc AG_WM_MouseMotion*(a2: ptr AG_DriverSw; a3: ptr AG_Window; a4: cint; a5: cint) {.importc:"AG_WM_MouseMotion", libag_gui.}
proc AG_EditableNew*(a2: pointer; a3: cuint): ptr AG_Editable {.importc:"AG_EditableNew", libag_gui.}
proc AG_EditableBindUTF8*(a2: ptr AG_Editable; a3: cstring; a4: csize) {.importc:"AG_EditableBindUTF8", libag_gui.}
proc AG_EditableBindASCII*(a2: ptr AG_Editable; a3: cstring; a4: csize) {.importc:"AG_EditableBindASCII", libag_gui.}
proc AG_EditableBindEncoded*(a2: ptr AG_Editable; a3: cstring; a4: cstring; a5: csize) {.importc:"AG_EditableBindEncoded", libag_gui.}
proc AG_EditableBindText*(a2: ptr AG_Editable; a3: ptr AG_Text) {.importc:"AG_EditableBindText", libag_gui.}
proc AG_EditableSetLang*(a2: ptr AG_Editable; a3: AG_Language) {.importc:"AG_EditableSetLang", libag_gui.}
proc AG_EditableGetBuffer*(a2: ptr AG_Editable): ptr AG_EditableBuffer {.importc:"AG_EditableGetBuffer", libag_gui.}
proc AG_EditableReleaseBuffer*(a2: ptr AG_Editable; a3: ptr AG_EditableBuffer) {.importc:"AG_EditableReleaseBuffer", libag_gui.}
proc AG_EditableClearBuffer*(a2: ptr AG_Editable; a3: ptr AG_EditableBuffer) {.importc:"AG_EditableClearBuffer", libag_gui.}
proc AG_EditableGrowBuffer*(a2: ptr AG_Editable; a3: ptr AG_EditableBuffer; a4: ptr uint32; a5: csize): cint {.importc:"AG_EditableGrowBuffer", libag_gui.}
proc AG_EditableCut*(a2: ptr AG_Editable; a3: ptr AG_EditableBuffer; a4: ptr AG_EditableClipboard): cint {.importc:"AG_EditableCut", libag_gui.}
proc AG_EditableCopy*(a2: ptr AG_Editable; a3: ptr AG_EditableBuffer; a4: ptr AG_EditableClipboard): cint {.importc:"AG_EditableCopy", libag_gui.}
proc AG_EditableCopyChunk*(a2: ptr AG_Editable; a3: ptr AG_EditableClipboard; a4: ptr uint32; a5: csize) {.importc:"AG_EditableCopyChunk", libag_gui.}
proc AG_EditablePaste*(a2: ptr AG_Editable; a3: ptr AG_EditableBuffer; a4: ptr AG_EditableClipboard): cint {.importc:"AG_EditablePaste", libag_gui.}
proc AG_EditableDelete*(a2: ptr AG_Editable; a3: ptr AG_EditableBuffer): cint {.importc:"AG_EditableDelete", libag_gui.}
proc AG_EditableSelectAll*(a2: ptr AG_Editable; a3: ptr AG_EditableBuffer) {.importc:"AG_EditableSelectAll", libag_gui.}
proc AG_EditableSizeHint*(a2: ptr AG_Editable; a3: cstring) {.importc:"AG_EditableSizeHint", libag_gui.}
proc AG_EditableSizeHintPixels*(a2: ptr AG_Editable; a3: cuint; a4: cuint) {.importc:"AG_EditableSizeHintPixels", libag_gui.}
proc AG_EditableSizeHintLines*(a2: ptr AG_Editable; a3: cuint) {.importc:"AG_EditableSizeHintLines", libag_gui.}
proc AG_EditableSetPassword*(a2: ptr AG_Editable; a3: cint) {.importc:"AG_EditableSetPassword", libag_gui.}
proc AG_EditableSetWordWrap*(a2: ptr AG_Editable; a3: cint) {.importc:"AG_EditableSetWordWrap", libag_gui.}
proc AG_EditableSetExcl*(a2: ptr AG_Editable; a3: cint) {.importc:"AG_EditableSetExcl", libag_gui.}
proc AG_EditableSetFltOnly*(a2: ptr AG_Editable; a3: cint) {.importc:"AG_EditableSetFltOnly", libag_gui.}
proc AG_EditableSetIntOnly*(a2: ptr AG_Editable; a3: cint) {.importc:"AG_EditableSetIntOnly", libag_gui.}
proc AG_EditableSetString*(a2: ptr AG_Editable; a3: cstring) {.importc:"AG_EditableSetString", libag_gui.}
proc AG_EditablePrintf*(a2: pointer; a3: cstring)  {.importc:"AG_EditablePrintf", varargs, libag_gui.}
proc AG_EditableDupString*(a2: ptr AG_Editable): cstring {.importc:"AG_EditableDupString", libag_gui.}
proc AG_EditableCopyString*(a2: ptr AG_Editable; a3: cstring; a4: csize): csize {.importc:"AG_EditableCopyString", libag_gui.}
proc AG_EditableInt*(a2: ptr AG_Editable): cint {.importc:"AG_EditableInt", libag_gui.}
proc AG_EditableFlt*(a2: ptr AG_Editable): cfloat {.importc:"AG_EditableFlt", libag_gui.}
proc AG_EditableDbl*(a2: ptr AG_Editable): cdouble {.importc:"AG_EditableDbl", libag_gui.}
proc AG_EditableInitClipboards*() {.importc:"AG_EditableInitClipboards", libag_gui.}
proc AG_EditableDestroyClipboards*() {.importc:"AG_EditableDestroyClipboards", libag_gui.}
proc AG_EditableMapPosition*(a2: ptr AG_Editable; a3: ptr AG_EditableBuffer; a4: cint; a5: cint; a6: ptr cint): cint {.importc:"AG_EditableMapPosition", libag_gui.}
proc AG_EditableMoveCursor*(a2: ptr AG_Editable; a3: ptr AG_EditableBuffer; a4: cint; a5: cint) {.importc:"AG_EditableMoveCursor", libag_gui.}
proc AG_EditableSetCursorPos*(a2: ptr AG_Editable; a3: ptr AG_EditableBuffer; a4: cint): cint {.importc:"AG_EditableSetCursorPos", libag_gui.}
proc AG_FileDlgNew*(a2: pointer; a3: cuint): ptr AG_FileDlg {.importc:"AG_FileDlgNew", libag_gui.}
proc AG_FileDlgNewMRU*(a2: pointer; a3: cstring; a4: cuint): ptr AG_FileDlg {.importc:"AG_FileDlgNewMRU", libag_gui.}
proc AG_FileDlgSetOptionContainer*(a2: ptr AG_FileDlg; a3: pointer) {.importc:"AG_FileDlgSetOptionContainer", libag_gui.}
proc AG_FileDlgSetDirectoryMRU*(a2: ptr AG_FileDlg; a3: cstring; a4: cstring) {.importc:"AG_FileDlgSetDirectoryMRU", libag_gui.}
proc AG_FileDlgSetDirectoryS*(a2: ptr AG_FileDlg; a3: cstring): cint {.importc:"AG_FileDlgSetDirectoryS", libag_gui.}
proc AG_FileDlgSetDirectory*(a2: ptr AG_FileDlg; a3: cstring): cint  {.importc:"AG_FileDlgSetDirectory", varargs, libag_gui.}
proc AG_FileDlgSetFilenameS*(a2: ptr AG_FileDlg; a3: cstring) {.importc:"AG_FileDlgSetFilenameS", libag_gui.}
proc AG_FileDlgSetFilename*(a2: ptr AG_FileDlg; a3: cstring)  {.importc:"AG_FileDlgSetFilename", varargs, libag_gui.}
proc AG_FileDlgOkAction*(a2: ptr AG_FileDlg; a3: AG_EventFn; a4: cstring)  {.importc:"AG_FileDlgOkAction", varargs, libag_gui.}
proc AG_FileDlgCancelAction*(a2: ptr AG_FileDlg; a3: AG_EventFn; a4: cstring)  {.importc:"AG_FileDlgCancelAction", varargs, libag_gui.}
proc AG_FileDlgCheckReadAccess*(a2: ptr AG_FileDlg): cint {.importc:"AG_FileDlgCheckReadAccess", libag_gui.}
proc AG_FileDlgCheckWriteAccess*(a2: ptr AG_FileDlg): cint {.importc:"AG_FileDlgCheckWriteAccess", libag_gui.}
proc AG_FileDlgRefresh*(a2: ptr AG_FileDlg) {.importc:"AG_FileDlgRefresh", libag_gui.}
proc AG_FileDlgAddType*(a2: ptr AG_FileDlg; a3: cstring; a4: cstring; a5: AG_IntFn; a6: cstring): ptr AG_FileType  {.importc:"AG_FileDlgAddType", varargs, libag_gui.}
proc AG_FileOptionNewBool*(a2: ptr AG_FileType; a3: cstring; a4: cstring; a5: cint): ptr AG_FileTypeOption {.importc:"AG_FileOptionNewBool", libag_gui.}
proc AG_FileOptionNewInt*(a2: ptr AG_FileType; a3: cstring; a4: cstring; a5: cint; a6: cint; a7: cint): ptr AG_FileTypeOption {.importc:"AG_FileOptionNewInt", libag_gui.}
proc AG_FileOptionNewFlt*(a2: ptr AG_FileType; a3: cstring; a4: cstring; a5: cfloat; a6: cfloat; a7: cfloat; a8: cstring): ptr AG_FileTypeOption {.importc:"AG_FileOptionNewFlt", libag_gui.}
proc AG_FileOptionNewDbl*(a2: ptr AG_FileType; a3: cstring; a4: cstring; a5: cdouble; a6: cdouble; a7: cdouble; a8: cstring): ptr AG_FileTypeOption {.importc:"AG_FileOptionNewDbl", libag_gui.}
proc AG_FileOptionNewString*(a2: ptr AG_FileType; a3: cstring; a4: cstring; a5: cstring): ptr AG_FileTypeOption {.importc:"AG_FileOptionNewString", libag_gui.}
proc AG_FileOptionGet*(a2: ptr AG_FileType; a3: cstring): ptr AG_FileTypeOption {.importc:"AG_FileOptionGet", libag_gui.}
proc AG_FileOptionInt*(a2: ptr AG_FileType; a3: cstring): cint {.importc:"AG_FileOptionInt", libag_gui.}
proc AG_FileOptionFlt*(a2: ptr AG_FileType; a3: cstring): cfloat {.importc:"AG_FileOptionFlt", libag_gui.}
proc AG_FileOptionDbl*(a2: ptr AG_FileType; a3: cstring): cdouble {.importc:"AG_FileOptionDbl", libag_gui.}
proc AG_FileOptionString*(a2: ptr AG_FileType; a3: cstring): cstring {.importc:"AG_FileOptionString", libag_gui.}
proc AG_FileSelectorNew*(a2: pointer; a3: cuint; a4: cstring): ptr AG_FileSelector {.importc:"AG_FileSelectorNew", libag_gui.}
proc AG_FileSelectorSetFile*(a2: ptr AG_FileSelector; a3: cstring) {.importc:"AG_FileSelectorSetFile", libag_gui.}
proc AG_FileSelectorSetDirectory*(a2: ptr AG_FileSelector; a3: cstring) {.importc:"AG_FileSelectorSetDirectory", libag_gui.}
proc AG_FixedNew*(a2: pointer; a3: cuint): ptr AG_Fixed {.importc:"AG_FixedNew", libag_gui.}
proc AG_FixedSizeHint*(a2: ptr AG_Fixed; a3: cint; a4: cint) {.importc:"AG_FixedSizeHint", libag_gui.}
proc AG_FixedDrawBg*(a2: pointer) {.importc:"AG_FixedDrawBg", libag_gui.}
proc AG_FixedDrawBox*(a2: pointer) {.importc:"AG_FixedDrawBox", libag_gui.}
proc AG_FixedDrawInvBox*(a2: pointer) {.importc:"AG_FixedDrawInvBox", libag_gui.}
proc AG_FixedDrawFrame*(a2: pointer) {.importc:"AG_FixedDrawFrame", libag_gui.}
proc AG_FixedPut*(a2: ptr AG_Fixed; a3: pointer; a4: cint; a5: cint) {.importc:"AG_FixedPut", libag_gui.}
proc AG_FixedDel*(a2: ptr AG_Fixed; a3: pointer) {.importc:"AG_FixedDel", libag_gui.}
proc AG_FixedSize*(a2: ptr AG_Fixed; a3: pointer; a4: cint; a5: cint) {.importc:"AG_FixedSize", libag_gui.}
proc AG_FixedMove*(a2: ptr AG_Fixed; a3: pointer; a4: cint; a5: cint) {.importc:"AG_FixedMove", libag_gui.}
proc AG_FixedPlotterNew*(a2: pointer; a3: AG_FixedPlotterType; a4: cuint): ptr AG_FixedPlotter {.importc:"AG_FixedPlotterNew", libag_gui.}
proc AG_FixedPlotterCurve*(a2: ptr AG_FixedPlotter; a3: cstring; a4: uint8; a5: uint8; a6: uint8; a7: uint32): ptr AG_FixedPlotterItem {.importc:"AG_FixedPlotterCurve", libag_gui.}
proc AG_FixedPlotterFreeItems*(a2: ptr AG_FixedPlotter) {.importc:"AG_FixedPlotterFreeItems", libag_gui.}
proc AG_FixedPlotterSetRange*(a2: ptr AG_FixedPlotter; a3: AG_FixedPlotterValue) {.importc:"AG_FixedPlotterSetRange", libag_gui.}
proc AG_FixedPlotterDatum*(a2: ptr AG_FixedPlotterItem; a3: AG_FixedPlotterValue) {.importc:"AG_FixedPlotterDatum", libag_gui.}
proc AG_FontSelectorNew*(a2: pointer; a3: cuint): ptr AG_FontSelector {.importc:"AG_FontSelectorNew", libag_gui.}
proc AG_FSpinbuttonNew*(a2: pointer; a3: cuint; a4: cstring; a5: cstring): ptr AG_FSpinbutton {.importc:"AG_FSpinbuttonNew", libag_gui.}
proc AG_FSpinbuttonSizeHint*(a2: ptr AG_FSpinbutton; a3: cstring) {.importc:"AG_FSpinbuttonSizeHint", libag_gui.}
proc AG_FSpinbuttonSetValue*(a2: ptr AG_FSpinbutton; a3: cdouble) {.importc:"AG_FSpinbuttonSetValue", libag_gui.}
proc AG_FSpinbuttonAddValue*(a2: ptr AG_FSpinbutton; a3: cdouble) {.importc:"AG_FSpinbuttonAddValue", libag_gui.}
proc AG_FSpinbuttonSetMin*(a2: ptr AG_FSpinbutton; a3: cdouble) {.importc:"AG_FSpinbuttonSetMin", libag_gui.}
proc AG_FSpinbuttonSetMax*(a2: ptr AG_FSpinbutton; a3: cdouble) {.importc:"AG_FSpinbuttonSetMax", libag_gui.}
proc AG_FSpinbuttonSetRange*(a2: ptr AG_FSpinbutton; a3: cdouble; a4: cdouble) {.importc:"AG_FSpinbuttonSetRange", libag_gui.}
proc AG_FSpinbuttonSetIncrement*(a2: ptr AG_FSpinbutton; a3: cdouble) {.importc:"AG_FSpinbuttonSetIncrement", libag_gui.}
proc AG_FSpinbuttonSelectUnit*(a2: ptr AG_FSpinbutton; a3: cstring) {.importc:"AG_FSpinbuttonSelectUnit", libag_gui.}
proc AG_FSpinbuttonSetPrecision*(a2: ptr AG_FSpinbutton; a3: cstring; a4: cint) {.importc:"AG_FSpinbuttonSetPrecision", libag_gui.}
proc AG_FSpinbuttonSetWriteable*(a2: ptr AG_FSpinbutton; a3: cint) {.importc:"AG_FSpinbuttonSetWriteable", libag_gui.}
proc AG_ReadRect*(a2: ptr AG_DataSource): AG_Rect {.importc:"AG_ReadRect", libag_gui.}
proc AG_WriteRect*(a2: ptr AG_DataSource; a3: AG_Rect) {.importc:"AG_WriteRect", libag_gui.}
proc AG_GLViewNew*(a2: pointer; a3: cuint): ptr AG_GLView {.importc:"AG_GLViewNew", libag_gui.}
proc AG_GLViewDraw*(a2: pointer) {.importc:"AG_GLViewDraw", libag_gui.}
proc AG_GLViewSizeRequest*(a2: pointer; a3: ptr AG_SizeReq) {.importc:"AG_GLViewSizeRequest", libag_gui.}
proc AG_GLViewSizeAllocate*(a2: pointer; a3: ptr AG_SizeAlloc): cint {.importc:"AG_GLViewSizeAllocate", libag_gui.}
proc AG_GLViewSetBgColor*(a2: ptr AG_GLView; a3: AG_Color) {.importc:"AG_GLViewSetBgColor", libag_gui.}
proc AG_GLViewSizeHint*(a2: ptr AG_GLView; a3: cint; a4: cint) {.importc:"AG_GLViewSizeHint", libag_gui.}
proc AG_GLViewReshape*(a2: ptr AG_GLView) {.importc:"AG_GLViewReshape", libag_gui.}
proc AG_GLViewDrawFn*(a2: pointer; a3: AG_EventFn; a4: cstring)  {.importc:"AG_GLViewDrawFn", varargs, libag_gui.}
proc AG_GLViewUnderlayFn*(a2: pointer; a3: AG_EventFn; a4: cstring)  {.importc:"AG_GLViewUnderlayFn", varargs, libag_gui.}
proc AG_GLViewOverlayFn*(a2: pointer; a3: AG_EventFn; a4: cstring)  {.importc:"AG_GLViewOverlayFn", varargs, libag_gui.}
proc AG_GLViewScaleFn*(a2: pointer; a3: AG_EventFn; a4: cstring)  {.importc:"AG_GLViewScaleFn", varargs, libag_gui.}
proc AG_GLViewKeydownFn*(a2: pointer; a3: AG_EventFn; a4: cstring)  {.importc:"AG_GLViewKeydownFn", varargs, libag_gui.}
proc AG_GLViewKeyupFn*(a2: pointer; a3: AG_EventFn; a4: cstring)  {.importc:"AG_GLViewKeyupFn", varargs, libag_gui.}
proc AG_GLViewButtondownFn*(a2: pointer; a3: AG_EventFn; a4: cstring)  {.importc:"AG_GLViewButtondownFn", varargs, libag_gui.}
proc AG_GLViewButtonupFn*(a2: pointer; a3: AG_EventFn; a4: cstring)  {.importc:"AG_GLViewButtonupFn", varargs, libag_gui.}
proc AG_GLViewMotionFn*(a2: pointer; a3: AG_EventFn; a4: cstring)  {.importc:"AG_GLViewMotionFn", varargs, libag_gui.}
proc AG_GraphNew*(a2: pointer; a3: cuint): ptr AG_Graph {.importc:"AG_GraphNew", libag_gui.}
proc AG_GraphFreeVertices*(a2: ptr AG_Graph) {.importc:"AG_GraphFreeVertices", libag_gui.}
proc AG_GraphSizeHint*(a2: ptr AG_Graph; a3: cuint; a4: cuint) {.importc:"AG_GraphSizeHint", libag_gui.}
proc AG_GraphVertexNew*(a2: ptr AG_Graph; a3: pointer): ptr AG_GraphVertex {.importc:"AG_GraphVertexNew", libag_gui.}
proc AG_GraphVertexFree*(a2: ptr AG_GraphVertex) {.importc:"AG_GraphVertexFree", libag_gui.}
proc AG_GraphVertexFind*(a2: ptr AG_Graph; a3: pointer): ptr AG_GraphVertex {.importc:"AG_GraphVertexFind", libag_gui.}
proc AG_GraphVertexLabel*(a2: ptr AG_GraphVertex; a3: cstring)  {.importc:"AG_GraphVertexLabel", varargs, libag_gui.}
proc AG_GraphVertexLabelS*(a2: ptr AG_GraphVertex; a3: cstring) {.importc:"AG_GraphVertexLabelS", libag_gui.}
proc AG_GraphVertexColorLabel*(a2: ptr AG_GraphVertex; a3: uint8; a4: uint8; a5: uint8) {.importc:"AG_GraphVertexColorLabel", libag_gui.}
proc AG_GraphVertexColorBG*(a2: ptr AG_GraphVertex; a3: uint8; a4: uint8; a5: uint8) {.importc:"AG_GraphVertexColorBG", libag_gui.}
proc AG_GraphVertexPosition*(a2: ptr AG_GraphVertex; a3: cint; a4: cint) {.importc:"AG_GraphVertexPosition", libag_gui.}
proc AG_GraphVertexSize*(a2: ptr AG_GraphVertex; a3: cuint; a4: cuint) {.importc:"AG_GraphVertexSize", libag_gui.}
proc style*(a2: ptr AG_GraphVertex; a3: AG_GraphVertexStyle) {.importc:"AG_GraphVertexStyle", libag_gui.}
proc AG_GraphVertexPopupMenu*(a2: ptr AG_GraphVertex; a3: ptr AG_PopupMenu) {.importc:"AG_GraphVertexPopupMenu", libag_gui.}
proc AG_GraphEdgeNew*(a2: ptr AG_Graph; a3: ptr AG_GraphVertex; a4: ptr AG_GraphVertex; a5: pointer): ptr AG_GraphEdge {.importc:"AG_GraphEdgeNew", libag_gui.}
proc AG_GraphEdgeFree*(a2: ptr AG_GraphEdge) {.importc:"AG_GraphEdgeFree", libag_gui.}
proc AG_GraphEdgeFind*(a2: ptr AG_Graph; a3: pointer): ptr AG_GraphEdge {.importc:"AG_GraphEdgeFind", libag_gui.}
proc AG_GraphEdgeLabel*(a2: ptr AG_GraphEdge; a3: cstring)  {.importc:"AG_GraphEdgeLabel", varargs, libag_gui.}
proc AG_GraphEdgeLabelS*(a2: ptr AG_GraphEdge; a3: cstring) {.importc:"AG_GraphEdgeLabelS", libag_gui.}
proc AG_GraphEdgeColorLabel*(a2: ptr AG_GraphEdge; a3: uint8; a4: uint8; a5: uint8) {.importc:"AG_GraphEdgeColorLabel", libag_gui.}
proc AG_GraphEdgeColor*(a2: ptr AG_GraphEdge; a3: uint8; a4: uint8; a5: uint8) {.importc:"AG_GraphEdgeColor", libag_gui.}
proc AG_GraphEdgePopupMenu*(a2: ptr AG_GraphEdge; a3: ptr AG_PopupMenu) {.importc:"AG_GraphEdgePopupMenu", libag_gui.}
proc AG_GraphAutoPlace*(a2: ptr AG_Graph; a3: cuint; a4: cuint) {.importc:"AG_GraphAutoPlace", libag_gui.}
proc AG_InitGraphics*(a2: cstring): cint {.importc:"AG_InitGraphics", libag_gui.}
proc AG_DestroyGraphics*() {.importc:"AG_DestroyGraphics", libag_gui.}
proc AG_InitGUI*(a2: cuint): cint {.importc:"AG_InitGUI", libag_gui.}
proc AG_DestroyGUI*() {.importc:"AG_DestroyGUI", libag_gui.}
proc AG_InitGUIGlobals*(): cint {.importc:"AG_InitGUIGlobals", libag_gui.}
proc AG_DestroyGUIGlobals*() {.importc:"AG_DestroyGUIGlobals", libag_gui.}
proc AG_QuitGUI*() {.importc:"AG_QuitGUI", libag_gui.}
proc AG_ZoomIn*() {.importc:"AG_ZoomIn", libag_gui.}
proc AG_ZoomOut*() {.importc:"AG_ZoomOut", libag_gui.}
proc AG_ZoomReset*() {.importc:"AG_ZoomReset", libag_gui.}
proc AG_GuiDebugger*(a2: pointer): pointer {.importc:"AG_GuiDebugger", libag_gui.}
proc AG_InitVideoSDL*(a2: pointer; a3: cuint): cint {.importc:"AG_InitVideoSDL", libag_gui.}
proc AG_SetVideoSurfaceSDL*(a2: pointer): cint {.importc:"AG_SetVideoSurfaceSDL", libag_gui.}
proc AG_HSVPalNew*(a2: pointer; a3: cuint): ptr AG_HSVPal {.importc:"AG_HSVPalNew", libag_gui.}
proc AG_IconNew*(a2: pointer; a3: cuint): ptr AG_Icon {.importc:"AG_IconNew", libag_gui.}
proc AG_IconFromSurface*(a2: ptr AG_Surface): ptr AG_Icon {.importc:"AG_IconFromSurface", libag_gui.}
proc AG_IconFromBMP*(a2: cstring): ptr AG_Icon {.importc:"AG_IconFromBMP", libag_gui.}
proc AG_IconSetSurface*(a2: ptr AG_Icon; a3: ptr AG_Surface) {.importc:"AG_IconSetSurface", libag_gui.}
proc AG_IconSetSurfaceNODUP*(a2: ptr AG_Icon; a3: ptr AG_Surface) {.importc:"AG_IconSetSurfaceNODUP", libag_gui.}
proc AG_IconSetText*(a2: ptr AG_Icon; a3: cstring)  {.importc:"AG_IconSetText", varargs, libag_gui.}
proc AG_IconSetTextS*(a2: ptr AG_Icon; a3: cstring) {.importc:"AG_IconSetTextS", libag_gui.}
proc AG_IconSetBackgroundFill*(a2: ptr AG_Icon; a3: cint; a4: AG_Color) {.importc:"AG_IconSetBackgroundFill", libag_gui.}
proc AG_InitStaticIcon*(a2: ptr AG_StaticIcon) {.importc:"AG_InitStaticIcon", libag_gui.}
proc AG_FreeStaticIcon*(a2: ptr AG_StaticIcon) {.importc:"AG_FreeStaticIcon", libag_gui.}
proc AG_InputDeviceNew*(a2: pointer): ptr AG_InputDevice {.importc:"AG_InputDeviceNew", libag_gui.}
proc AG_KeyboardNew*(a2: pointer; a3: cstring): ptr AG_Keyboard {.importc:"AG_KeyboardNew", libag_gui.}
proc AG_KeyboardUpdate*(a2: ptr AG_Keyboard; a3: AG_KeyboardAction; a4: AG_KeySym; a5: uint32): cint {.importc:"AG_KeyboardUpdate", libag_gui.}
proc AG_ProcessKey*(a2: ptr AG_Keyboard; a3: ptr AG_Window; a4: AG_KeyboardAction; a5: AG_KeySym; a6: uint32): cint {.importc:"AG_ProcessKey", libag_gui.}
proc AG_LookupKeyName*(a2: AG_KeySym): cstring {.importc:"AG_LookupKeyName", libag_gui.}
proc AG_LookupKeySym*(a2: cstring): AG_KeySym {.importc:"AG_LookupKeySym", libag_gui.}
proc AG_InitGlobalKeys*() {.importc:"AG_InitGlobalKeys", libag_gui.}
proc AG_DestroyGlobalKeys*() {.importc:"AG_DestroyGlobalKeys", libag_gui.}
proc AG_BindStdGlobalKeys*() {.importc:"AG_BindStdGlobalKeys", libag_gui.}
proc AG_BindGlobalKey*(a2: AG_KeySym; a3: AG_KeyMod; a4: proc ()) {.importc:"AG_BindGlobalKey", libag_gui.}
proc AG_BindGlobalKeyEv*(a2: AG_KeySym; a3: AG_KeyMod; a4: proc (a2: ptr AG_Event)) {.importc:"AG_BindGlobalKeyEv", libag_gui.}
proc AG_UnbindGlobalKey*(a2: AG_KeySym; a3: AG_KeyMod): cint {.importc:"AG_UnbindGlobalKey", libag_gui.}
proc AG_ClearGlobalKeys*() {.importc:"AG_ClearGlobalKeys", libag_gui.}
proc AG_ExecGlobalKeys*(a2: AG_KeySym; a3: AG_KeyMod): cint {.importc:"AG_ExecGlobalKeys", libag_gui.}
proc AG_ApplyModifiersASCII*(a2: uint32; a3: cint): uint32 {.importc:"AG_ApplyModifiersASCII", libag_gui.}
proc AG_KeyInputCompose*(a2: ptr AG_Editable; a3: uint32; a4: ptr uint32): cint {.importc:"AG_KeyInputCompose", libag_gui.}
proc AG_LabelNew*(a2: pointer; a3: cuint; a4: cstring): ptr AG_Label  {.importc:"AG_LabelNew", varargs, libag_gui.}
proc AG_LabelNewS*(a2: pointer; a3: cuint; a4: cstring): ptr AG_Label {.importc:"AG_LabelNewS", libag_gui.}
proc AG_LabelNewPolled*(a2: pointer; a3: cuint; a4: cstring): ptr AG_Label  {.importc:"AG_LabelNewPolled", varargs, libag_gui.}
proc AG_LabelNewPolledMT*(a2: pointer; a3: cuint; a4: ptr AG_Mutex; a5: cstring): ptr AG_Label  {.importc:"AG_LabelNewPolledMT", varargs, libag_gui.}
proc AG_LabelText*(a2: ptr AG_Label; a3: cstring)  {.importc:"AG_LabelText", varargs, libag_gui.}
proc AG_LabelTextS*(a2: ptr AG_Label; a3: cstring) {.importc:"AG_LabelTextS", libag_gui.}
proc AG_LabelSetPadding*(a2: ptr AG_Label; a3: cint; a4: cint; a5: cint; a6: cint) {.importc:"AG_LabelSetPadding", libag_gui.}
proc AG_LabelJustify*(a2: ptr AG_Label; a3: AG_TextJustify) {.importc:"AG_LabelJustify", libag_gui.}
proc AG_LabelValign*(a2: ptr AG_Label; a3: AG_TextVAlign) {.importc:"AG_LabelValign", libag_gui.}
proc AG_LabelSizeHint*(a2: ptr AG_Label; a3: cuint; a4: cstring) {.importc:"AG_LabelSizeHint", libag_gui.}
proc AG_ReadColor*(a2: ptr AG_DataSource): AG_Color {.importc:"AG_ReadColor", libag_gui.}
proc AG_WriteColor*(a2: ptr AG_DataSource; a3: AG_Color) {.importc:"AG_WriteColor", libag_gui.}
proc AG_ReadSurface*(a2: ptr AG_DataSource): ptr AG_Surface {.importc:"AG_ReadSurface", libag_gui.}
proc AG_WriteSurface*(a2: ptr AG_DataSource; a3: ptr AG_Surface) {.importc:"AG_WriteSurface", libag_gui.}
proc AG_XCFLoad*(a2: ptr AG_DataSource; a3: Off; a4: proc (a2: ptr AG_Surface; a3: cstring; a4: pointer); a5: pointer): cint {.importc:"AG_XCFLoad", libag_gui.}
proc AG_InitAppMenu*() {.importc:"AG_InitAppMenu", libag_gui.}
proc AG_DestroyAppMenu*() {.importc:"AG_DestroyAppMenu", libag_gui.}
proc AG_MenuNew*(a2: pointer; a3: cuint): ptr AG_Menu {.importc:"AG_MenuNew", libag_gui.}
proc AG_MenuNewGlobal*(a2: cuint): ptr AG_Menu {.importc:"AG_MenuNewGlobal", libag_gui.}
proc AG_MenuScale*(a2: pointer; a3: cint; a4: cint) {.importc:"AG_MenuScale", libag_gui.}
proc AG_MenuDraw*(a2: pointer) {.importc:"AG_MenuDraw", libag_gui.}
proc AG_PopupNew*(a2: pointer): ptr AG_PopupMenu {.importc:"AG_PopupNew", libag_gui.}
proc AG_PopupShow*(a2: ptr AG_PopupMenu) {.importc:"AG_PopupShow", libag_gui.}
proc AG_PopupShowAt*(a2: ptr AG_PopupMenu; a3: cint; a4: cint) {.importc:"AG_PopupShowAt", libag_gui.}
proc AG_PopupHide*(a2: ptr AG_PopupMenu) {.importc:"AG_PopupHide", libag_gui.}
proc AG_PopupDestroy*(a2: ptr AG_PopupMenu) {.importc:"AG_PopupDestroy", libag_gui.}
proc AG_MenuDel*(a2: ptr AG_MenuItem) {.importc:"AG_MenuDel", libag_gui.}
proc AG_MenuItemFree*(a2: ptr AG_MenuItem) {.importc:"AG_MenuItemFree", libag_gui.}
proc menuExpand*(a2: pointer; a3: ptr AG_MenuItem; a4: cint; a5: cint): ptr AG_Window {.importc:"AG_MenuExpand", libag_gui.}
proc AG_MenuCollapse*(a2: ptr AG_MenuItem) {.importc:"AG_MenuCollapse", libag_gui.}
proc AG_MenuCollapseAll*(a2: ptr AG_Menu) {.importc:"AG_MenuCollapseAll", libag_gui.}
proc AG_MenuSetPadding*(a2: ptr AG_Menu; a3: cint; a4: cint; a5: cint; a6: cint) {.importc:"AG_MenuSetPadding", libag_gui.}
proc AG_MenuSetLabelPadding*(a2: ptr AG_Menu; a3: cint; a4: cint; a5: cint; a6: cint) {.importc:"AG_MenuSetLabelPadding", libag_gui.}
proc AG_MenuSetIcon*(a2: ptr AG_MenuItem; a3: ptr AG_Surface) {.importc:"AG_MenuSetIcon", libag_gui.}
proc AG_MenuSetLabel*(a2: ptr AG_MenuItem; a3: cstring)  {.importc:"AG_MenuSetLabel", varargs, libag_gui.}
proc AG_MenuSetLabelS*(a2: ptr AG_MenuItem; a3: cstring) {.importc:"AG_MenuSetLabelS", libag_gui.}
proc AG_MenuSetPollFn*(a2: ptr AG_MenuItem; a3: AG_EventFn; a4: cstring)  {.importc:"AG_MenuSetPollFn", varargs, libag_gui.}
proc AG_MenuUpdateItem*(a2: ptr AG_MenuItem) {.importc:"AG_MenuUpdateItem", libag_gui.}
proc AG_MenuState*(a2: ptr AG_MenuItem; a3: cint) {.importc:"AG_MenuState", libag_gui.}
proc AG_MenuToolbar*(a2: ptr AG_MenuItem; a3: ptr AG_Toolbar) {.importc:"AG_MenuToolbar", libag_gui.}
proc AG_MenuNode*(a2: ptr AG_MenuItem; a3: cstring; a4: ptr AG_Surface): ptr AG_MenuItem {.importc:"AG_MenuNode", libag_gui.}
proc AG_MenuSeparator*(a2: ptr AG_MenuItem): ptr AG_MenuItem {.importc:"AG_MenuSeparator", libag_gui.}
proc AG_MenuSection*(a2: ptr AG_MenuItem; a3: cstring): ptr AG_MenuItem  {.importc:"AG_MenuSection", varargs, libag_gui.}
proc AG_MenuSectionS*(a2: ptr AG_MenuItem; a3: cstring): ptr AG_MenuItem {.importc:"AG_MenuSectionS", libag_gui.}
proc AG_MenuAction*(a2: ptr AG_MenuItem; a3: cstring; a4: ptr AG_Surface; a5: AG_EventFn; a6: cstring): ptr AG_MenuItem  {.importc:"AG_MenuAction", varargs, libag_gui.}
proc AG_MenuActionKb*(a2: ptr AG_MenuItem; a3: cstring; a4: ptr AG_Surface; a5: AG_KeySym; a6: AG_KeyMod; a7: AG_EventFn; a8: cstring): ptr AG_MenuItem  {.importc:"AG_MenuActionKb", varargs, libag_gui.}
proc AG_MenuTool*(a2: ptr AG_MenuItem; a3: ptr AG_Toolbar; a4: cstring; a5: ptr AG_Surface; a6: AG_KeySym; a7: AG_KeyMod; a8: AG_EventFn; a9: cstring): ptr AG_MenuItem  {.importc:"AG_MenuTool", varargs, libag_gui.}
proc AG_MenuDynamicItem*(a2: ptr AG_MenuItem; a3: cstring; a4: ptr AG_Surface; a5: AG_EventFn; a6: cstring): ptr AG_MenuItem  {.importc:"AG_MenuDynamicItem", varargs, libag_gui.}
proc AG_MenuDynamicItemKb*(a2: ptr AG_MenuItem; a3: cstring; a4: ptr AG_Surface; a5: AG_KeySym; a6: AG_KeyMod; a7: AG_EventFn; a8: cstring): ptr AG_MenuItem  {.importc:"AG_MenuDynamicItemKb", varargs, libag_gui.}
proc AG_MenuIntBoolMp*(a2: ptr AG_MenuItem; a3: cstring; a4: ptr AG_Surface; a5: ptr cint; a6: cint; a7: ptr AG_Mutex): ptr AG_MenuItem {.importc:"AG_MenuIntBoolMp", libag_gui.}
proc AG_MenuInt8BoolMp*(a2: ptr AG_MenuItem; a3: cstring; a4: ptr AG_Surface; a5: ptr uint8; a6: cint; a7: ptr AG_Mutex): ptr AG_MenuItem {.importc:"AG_MenuInt8BoolMp", libag_gui.}
proc AG_MenuIntFlagsMp*(a2: ptr AG_MenuItem; a3: cstring; a4: ptr AG_Surface; a5: ptr cint; a6: cint; a7: cint; a8: ptr AG_Mutex): ptr AG_MenuItem {.importc:"AG_MenuIntFlagsMp", libag_gui.}
proc AG_MenuInt8FlagsMp*(a2: ptr AG_MenuItem; a3: cstring; a4: ptr AG_Surface; a5: ptr uint8; a6: uint8; a7: cint; a8: ptr AG_Mutex): ptr AG_MenuItem {.importc:"AG_MenuInt8FlagsMp", libag_gui.}
proc AG_MenuInt16FlagsMp*(a2: ptr AG_MenuItem; a3: cstring; a4: ptr AG_Surface; a5: ptr uint16; a6: uint16; a7: cint; a8: ptr AG_Mutex): ptr AG_MenuItem {.importc:"AG_MenuInt16FlagsMp", libag_gui.}
proc AG_Menuint32FlagsMp*(a2: ptr AG_MenuItem; a3: cstring; a4: ptr AG_Surface; a5: ptr uint32; a6: uint32; a7: cint; a8: ptr AG_Mutex): ptr AG_MenuItem {.importc:"AG_Menuint32FlagsMp", libag_gui.}
proc AG_MenuSetIntBoolMp*(a2: ptr AG_MenuItem; a3: ptr cint; a4: cint; a5: ptr AG_Mutex) {.importc:"AG_MenuSetIntBoolMp", libag_gui.}
proc AG_MenuSetIntFlagsMp*(a2: ptr AG_MenuItem; a3: ptr cint; a4: cint; a5: cint; a6: ptr AG_Mutex) {.importc:"AG_MenuSetIntFlagsMp", libag_gui.}
proc AG_MFSpinbuttonNew*(a2: pointer; a3: cuint; a4: cstring; a5: cstring; a6: cstring): ptr AG_MFSpinbutton {.importc:"AG_MFSpinbuttonNew", libag_gui.}
proc AG_MFSpinbuttonUpdate*(a2: ptr AG_MFSpinbutton) {.importc:"AG_MFSpinbuttonUpdate", libag_gui.}
proc AG_MFSpinbuttonSetValue*(a2: ptr AG_MFSpinbutton; a3: cstring; a4: cdouble) {.importc:"AG_MFSpinbuttonSetValue", libag_gui.}
proc AG_MFSpinbuttonAddValue*(a2: ptr AG_MFSpinbutton; a3: cstring; a4: cdouble) {.importc:"AG_MFSpinbuttonAddValue", libag_gui.}
proc AG_MFSpinbuttonSetMin*(a2: ptr AG_MFSpinbutton; a3: cdouble) {.importc:"AG_MFSpinbuttonSetMin", libag_gui.}
proc AG_MFSpinbuttonSetMax*(a2: ptr AG_MFSpinbutton; a3: cdouble) {.importc:"AG_MFSpinbuttonSetMax", libag_gui.}
proc AG_MFSpinbuttonSetRange*(a2: ptr AG_MFSpinbutton; a3: cdouble; a4: cdouble) {.importc:"AG_MFSpinbuttonSetRange", libag_gui.}
proc AG_MFSpinbuttonSetIncrement*(a2: ptr AG_MFSpinbutton; a3: cdouble) {.importc:"AG_MFSpinbuttonSetIncrement", libag_gui.}
proc AG_MFSpinbuttonSelectUnit*(a2: ptr AG_MFSpinbutton; a3: cstring) {.importc:"AG_MFSpinbuttonSelectUnit", libag_gui.}
proc AG_MFSpinbuttonSetPrecision*(a2: ptr AG_MFSpinbutton; a3: cstring; a4: cint) {.importc:"AG_MFSpinbuttonSetPrecision", libag_gui.}
proc AG_MFSpinbuttonSetWriteable*(a2: ptr AG_MFSpinbutton; a3: cint) {.importc:"AG_MFSpinbuttonSetWriteable", libag_gui.}
proc AG_MouseNew*(a2: pointer; a3: cstring): ptr AG_Mouse {.importc:"AG_MouseNew", libag_gui.}
proc AG_MouseMotionUpdate*(a2: ptr AG_Mouse; a3: cint; a4: cint) {.importc:"AG_MouseMotionUpdate", libag_gui.}
proc AG_MouseCursorUpdate*(a2: ptr AG_Window; a3: cint; a4: cint) {.importc:"AG_MouseCursorUpdate", libag_gui.}
proc AG_MouseButtonUpdate*(a2: ptr AG_Mouse; a3: AG_MouseButtonAction; a4: cint) {.importc:"AG_MouseButtonUpdate", libag_gui.}
proc AG_ProcessMouseMotion*(a2: ptr AG_Window; a3: cint; a4: cint; a5: cint; a6: cint; a7: cuint) {.importc:"AG_ProcessMouseMotion", libag_gui.}
proc AG_ProcessMouseButtonUp*(a2: ptr AG_Window; a3: cint; a4: cint; a5: AG_MouseButton) {.importc:"AG_ProcessMouseButtonUp", libag_gui.}
proc AG_ProcessMouseButtonDown*(a2: ptr AG_Window; a3: cint; a4: cint; a5: AG_MouseButton) {.importc:"AG_ProcessMouseButtonDown", libag_gui.}
proc AG_MPaneNew*(a2: pointer; a3: AG_MPaneLayout; a4: cuint): ptr AG_MPane {.importc:"AG_MPaneNew", libag_gui.}
proc AG_MPaneSetLayout*(a2: ptr AG_MPane; a3: AG_MPaneLayout) {.importc:"AG_MPaneSetLayout", libag_gui.}
proc AG_MSpinbuttonNew*(a2: pointer; a3: cuint; a4: cstring; a5: cstring): ptr AG_MFSpinbutton {.importc:"AG_MSpinbuttonNew", libag_gui.}
proc AG_MSpinbuttonAddValue*(a2: ptr AG_MFSpinbutton; a3: cstring; a4: cint) {.importc:"AG_MSpinbuttonAddValue", libag_gui.}
proc AG_MSpinbuttonSetValue*(a2: ptr AG_MFSpinbutton; a3: cstring)  {.importc:"AG_MSpinbuttonSetValue", varargs, libag_gui.}
proc AG_MSpinbuttonSetMin*(a2: ptr AG_MFSpinbutton; a3: cint) {.importc:"AG_MSpinbuttonSetMin", libag_gui.}
proc AG_MSpinbuttonSetMax*(a2: ptr AG_MFSpinbutton; a3: cint) {.importc:"AG_MSpinbuttonSetMax", libag_gui.}
proc AG_MSpinbuttonSetRange*(a2: ptr AG_MFSpinbutton; a3: cint; a4: cint) {.importc:"AG_MSpinbuttonSetRange", libag_gui.}
proc AG_MSpinbuttonSetIncrement*(a2: ptr AG_MFSpinbutton; a3: cint) {.importc:"AG_MSpinbuttonSetIncrement", libag_gui.}
proc AG_MSpinbuttonSetWriteable*(a2: ptr AG_MFSpinbutton; a3: cint) {.importc:"AG_MSpinbuttonSetWriteable", libag_gui.}
proc AG_NotebookNew*(a2: pointer; a3: cuint): ptr AG_Notebook {.importc:"AG_NotebookNew", libag_gui.}
proc AG_NotebookSetPadding*(a2: ptr AG_Notebook; a3: cint) {.importc:"AG_NotebookSetPadding", libag_gui.}
proc AG_NotebookSetSpacing*(a2: ptr AG_Notebook; a3: cint) {.importc:"AG_NotebookSetSpacing", libag_gui.}
proc AG_NotebookSetTabAlignment*(a2: ptr AG_Notebook; a3: AG_NotebookTabAlignment) {.importc:"AG_NotebookSetTabAlignment", libag_gui.}
proc AG_NotebookSetTabVisibility*(a2: ptr AG_Notebook; a3: cint) {.importc:"AG_NotebookSetTabVisibility", libag_gui.}
proc AG_NotebookAdd*(a2: ptr AG_Notebook; a3: cstring; a4: AG_BoxType): ptr AG_NotebookTab {.importc:"AG_NotebookAdd", libag_gui.}
proc AG_NotebookDel*(a2: ptr AG_Notebook; a3: ptr AG_NotebookTab) {.importc:"AG_NotebookDel", libag_gui.}
proc AG_NotebookSelect*(a2: ptr AG_Notebook; a3: ptr AG_NotebookTab) {.importc:"AG_NotebookSelect", libag_gui.}
proc AG_NumericalNew*(a2: pointer; a3: cuint; a4: cstring; a5: cstring): ptr AG_Numerical  {.importc:"AG_NumericalNew", varargs, libag_gui.}
proc AG_NumericalNewS*(a2: pointer; a3: cuint; a4: cstring; a5: cstring): ptr AG_Numerical {.importc:"AG_NumericalNewS", libag_gui.}
proc AG_NumericalNewFlt*(a2: pointer; a3: cuint; a4: cstring; a5: cstring; a6: ptr cfloat): ptr AG_Numerical {.importc:"AG_NumericalNewFlt", libag_gui.}
proc AG_NumericalNewFltR*(a2: pointer; a3: cuint; a4: cstring; a5: cstring; a6: ptr cfloat; a7: cfloat; a8: cfloat): ptr AG_Numerical {.importc:"AG_NumericalNewFltR", libag_gui.}
proc AG_NumericalNewDbl*(a2: pointer; a3: cuint; a4: cstring; a5: cstring; a6: ptr cdouble): ptr AG_Numerical {.importc:"AG_NumericalNewDbl", libag_gui.}
proc AG_NumericalNewDblR*(a2: pointer; a3: cuint; a4: cstring; a5: cstring; a6: ptr cdouble; a7: cdouble; a8: cdouble): ptr AG_Numerical {.importc:"AG_NumericalNewDblR", libag_gui.}
proc AG_NumericalNewInt*(a2: pointer; a3: cuint; a4: cstring; a5: cstring; a6: ptr cint): ptr AG_Numerical {.importc:"AG_NumericalNewInt", libag_gui.}
proc AG_NumericalNewIntR*(a2: pointer; a3: cuint; a4: cstring; a5: cstring; a6: ptr cint; a7: cint; a8: cint): ptr AG_Numerical {.importc:"AG_NumericalNewIntR", libag_gui.}
proc AG_NumericalNewUint*(a2: pointer; a3: cuint; a4: cstring; a5: cstring; a6: ptr cuint): ptr AG_Numerical {.importc:"AG_NumericalNewUint", libag_gui.}
proc AG_NumericalNewUintR*(a2: pointer; a3: cuint; a4: cstring; a5: cstring; a6: ptr cuint; a7: cuint; a8: cuint): ptr AG_Numerical {.importc:"AG_NumericalNewUintR", libag_gui.}
proc AG_NumericalSizeHint*(a2: ptr AG_Numerical; a3: cstring) {.importc:"AG_NumericalSizeHint", libag_gui.}
proc AG_NumericalIncrement*(a2: ptr AG_Numerical) {.importc:"AG_NumericalIncrement", libag_gui.}
proc AG_NumericalDecrement*(a2: ptr AG_Numerical) {.importc:"AG_NumericalDecrement", libag_gui.}
proc AG_NumericalUpdate*(a2: ptr AG_Numerical) {.importc:"AG_NumericalUpdate", libag_gui.}
proc AG_NumericalSelectUnit*(a2: ptr AG_Numerical; a3: cstring) {.importc:"AG_NumericalSelectUnit", libag_gui.}
proc AG_NumericalSetUnitSystem*(a2: ptr AG_Numerical; a3: cstring): cint {.importc:"AG_NumericalSetUnitSystem", libag_gui.}
proc AG_NumericalSetPrecision*(a2: ptr AG_Numerical; a3: cstring; a4: cint) {.importc:"AG_NumericalSetPrecision", libag_gui.}
proc AG_NumericalSetWriteable*(a2: ptr AG_Numerical; a3: cint) {.importc:"AG_NumericalSetWriteable", libag_gui.}
proc AG_NumericalGetFlt*(a2: ptr AG_Numerical): cfloat {.importc:"AG_NumericalGetFlt", libag_gui.}
proc AG_NumericalGetDbl*(a2: ptr AG_Numerical): cdouble {.importc:"AG_NumericalGetDbl", libag_gui.}
proc AG_NumericalGetInt*(a2: ptr AG_Numerical): cint {.importc:"AG_NumericalGetInt", libag_gui.}
proc AG_NumericalGetuint32*(a2: ptr AG_Numerical): uint32 {.importc:"AG_NumericalGetuint32", libag_gui.}
proc AG_NumericalGetuint64*(a2: ptr AG_Numerical): uint64 {.importc:"AG_NumericalGetuint64", libag_gui.}
proc AG_ObjectSelectorNew*(a2: pointer; a3: cint; a4: pointer; a5: pointer; a6: cstring): ptr AG_ObjectSelector  {.importc:"AG_ObjectSelectorNew", varargs, libag_gui.}
proc AG_ObjectSelectorSelect*(a2: ptr AG_ObjectSelector; a3: pointer): ptr AG_TlistItem {.importc:"AG_ObjectSelectorSelect", libag_gui.}
proc AG_ObjectSelectorMaskType*(a2: ptr AG_ObjectSelector; a3: cstring) {.importc:"AG_ObjectSelectorMaskType", libag_gui.}
proc AG_PackedPixelFlip*(a2: ptr uint8; a3: cuint; a4: cint): cint {.importc:"AG_PackedPixelFlip", libag_gui.}
proc AG_PaneNew*(a2: pointer; a3: AG_PaneType; a4: cuint): ptr AG_Pane {.importc:"AG_PaneNew", libag_gui.}
proc AG_PaneAttachBox*(a2: ptr AG_Pane; a3: cint; a4: ptr AG_Box) {.importc:"AG_PaneAttachBox", libag_gui.}
proc AG_PaneAttachBoxes*(a2: ptr AG_Pane; a3: ptr AG_Box; a4: ptr AG_Box) {.importc:"AG_PaneAttachBoxes", libag_gui.}
proc AG_PaneSetDividerWidth*(a2: ptr AG_Pane; a3: cint) {.importc:"AG_PaneSetDividerWidth", libag_gui.}
proc AG_PaneSetDivisionMin*(a2: ptr AG_Pane; a3: cint; a4: cint; a5: cint) {.importc:"AG_PaneSetDivisionMin", libag_gui.}
proc AG_PaneSetDivisionPacking*(a2: ptr AG_Pane; a3: cint; a4: AG_BoxType) {.importc:"AG_PaneSetDivisionPacking", libag_gui.}
proc AG_PaneMoveDivider*(a2: ptr AG_Pane; a3: cint): cint {.importc:"AG_PaneMoveDivider", libag_gui.}
proc AG_PaneMoveDividerPct*(a2: ptr AG_Pane; a3: cint): cint {.importc:"AG_PaneMoveDividerPct", libag_gui.}
proc resizeAction*(a2: ptr AG_Pane; a3: AG_PaneResizeAction) {.importc:"AG_PaneResizeAction", libag_gui.}
proc AG_PixmapNew*(a2: pointer; a3: cuint; a4: cuint; a5: cuint): ptr AG_Pixmap {.importc:"AG_PixmapNew", libag_gui.}
proc AG_PixmapFromSurface*(a2: pointer; a3: cuint; a4: ptr AG_Surface): ptr AG_Pixmap {.importc:"AG_PixmapFromSurface", libag_gui.}
proc AG_PixmapFromSurfaceScaled*(a2: pointer; a3: cuint; a4: ptr AG_Surface; a5: cuint; a6: cuint): ptr AG_Pixmap {.importc:"AG_PixmapFromSurfaceScaled", libag_gui.}
proc AG_PixmapFromSurfaceNODUP*(a2: pointer; a3: cuint; a4: ptr AG_Surface): ptr AG_Pixmap {.importc:"AG_PixmapFromSurfaceNODUP", libag_gui.}
proc AG_PixmapFromFile*(a2: pointer; a3: cuint; a4: cstring): ptr AG_Pixmap {.importc:"AG_PixmapFromFile", libag_gui.}
proc AG_PixmapFromTexture*(a2: pointer; a3: cuint; a4: cuint; a5: cint): ptr AG_Pixmap {.importc:"AG_PixmapFromTexture", libag_gui.}
proc AG_PixmapAddSurface*(a2: ptr AG_Pixmap; a3: ptr AG_Surface): cint {.importc:"AG_PixmapAddSurface", libag_gui.}
proc AG_PixmapAddSurfaceScaled*(a2: ptr AG_Pixmap; a3: ptr AG_Surface; a4: cuint; a5: cuint): cint {.importc:"AG_PixmapAddSurfaceScaled", libag_gui.}
proc AG_PixmapAddSurfaceFromFile*(a2: ptr AG_Pixmap; a3: cstring): cint {.importc:"AG_PixmapAddSurfaceFromFile", libag_gui.}
proc AG_ProgressBarNew*(a2: pointer; a3: AG_ProgressBarType; a4: cuint): ptr AG_ProgressBar {.importc:"AG_ProgressBarNew", libag_gui.}
proc AG_ProgressBarNewInt*(a2: pointer; a3: AG_ProgressBarType; a4: cuint; a5: ptr cint; a6: ptr cint; a7: ptr cint): ptr AG_ProgressBar {.importc:"AG_ProgressBarNewInt", libag_gui.}
proc AG_ProgressBarSetLength*(a2: ptr AG_ProgressBar; a3: cint) {.importc:"AG_ProgressBarSetLength", libag_gui.}
proc AG_ProgressBarSetWidth*(a2: ptr AG_ProgressBar; a3: cint) {.importc:"AG_ProgressBarSetWidth", libag_gui.}
proc AG_ProgressBarPercent*(a2: ptr AG_ProgressBar): cint {.importc:"AG_ProgressBarPercent", libag_gui.}
proc AG_RadioNew*(a2: pointer; a3: cuint; a4: ptr cstring): ptr AG_Radio {.importc:"AG_RadioNew", libag_gui.}
proc AG_RadioNewFn*(a2: pointer; a3: cuint; a4: cstringArray; a5: AG_EventFn; a6: cstring): ptr AG_Radio  {.importc:"AG_RadioNewFn", varargs, libag_gui.}
proc AG_RadioNewInt*(a2: pointer; a3: cuint; a4: cstringArray; a5: ptr cint): ptr AG_Radio {.importc:"AG_RadioNewInt", libag_gui.}
proc AG_RadioNewUint*(a2: pointer; a3: cuint; a4: cstringArray; a5: ptr cuint): ptr AG_Radio {.importc:"AG_RadioNewUint", libag_gui.}
proc AG_RadioItemsFromArray*(a2: ptr AG_Radio; a3: cstringArray) {.importc:"AG_RadioItemsFromArray", libag_gui.}
proc AG_RadioAddItem*(a2: ptr AG_Radio; a3: cstring): cint  {.importc:"AG_RadioAddItem", varargs, libag_gui.}
proc AG_RadioAddItemS*(a2: ptr AG_Radio; a3: cstring): cint {.importc:"AG_RadioAddItemS", libag_gui.}
proc AG_RadioAddItemHK*(a2: ptr AG_Radio; a3: AG_KeySym; a4: cstring): cint  {.importc:"AG_RadioAddItemHK", varargs, libag_gui.}
proc AG_RadioAddItemHKS*(a2: ptr AG_Radio; a3: AG_KeySym; a4: cstring): cint {.importc:"AG_RadioAddItemHKS", libag_gui.}
proc AG_RadioClearItems*(a2: ptr AG_Radio) {.importc:"AG_RadioClearItems", libag_gui.}
proc AG_ScrollbarNew*(a2: pointer; a3: AG_ScrollbarType; a4: cuint): ptr AG_Scrollbar {.importc:"AG_ScrollbarNew", libag_gui.}
proc AG_ScrollbarSizeHint*(a2: ptr AG_Scrollbar; a3: cint) {.importc:"AG_ScrollbarSizeHint", libag_gui.}
proc AG_ScrollbarSetIncFn*(a2: ptr AG_Scrollbar; a3: AG_EventFn; a4: cstring)  {.importc:"AG_ScrollbarSetIncFn", varargs, libag_gui.}
proc AG_ScrollbarSetDecFn*(a2: ptr AG_Scrollbar; a3: AG_EventFn; a4: cstring)  {.importc:"AG_ScrollbarSetDecFn", varargs, libag_gui.}
proc AG_ScrollbarVisible*(a2: ptr AG_Scrollbar): cint {.importc:"AG_ScrollbarVisible", libag_gui.}
proc AG_ScrollviewNew*(a2: pointer; a3: cuint): ptr AG_Scrollview {.importc:"AG_ScrollviewNew", libag_gui.}
proc AG_ScrollviewSizeHint*(a2: ptr AG_Scrollview; a3: cuint; a4: cuint) {.importc:"AG_ScrollviewSizeHint", libag_gui.}
proc AG_ScrollviewSetIncrement*(a2: ptr AG_Scrollview; a3: cint) {.importc:"AG_ScrollviewSetIncrement", libag_gui.}
proc AG_SeparatorNew*(a2: pointer; a3: AG_SeparatorType): ptr AG_Separator {.importc:"AG_SeparatorNew", libag_gui.}
proc AG_SpacerNew*(a2: pointer; a3: AG_SeparatorType): ptr AG_Separator {.importc:"AG_SpacerNew", libag_gui.}
proc AG_SeparatorSetPadding*(a2: ptr AG_Separator; a3: cuint) {.importc:"AG_SeparatorSetPadding", libag_gui.}
proc AG_SliderNew*(a2: pointer; a3: AG_SliderType; a4: cuint): ptr AG_Slider {.importc:"AG_SliderNew", libag_gui.}
proc AG_SliderNewInt*(a2: pointer; a3: AG_SliderType; a4: cuint; a5: ptr cint; a6: ptr cint; a7: ptr cint): ptr AG_Slider {.importc:"AG_SliderNewInt", libag_gui.}
proc AG_SliderNewIntR*(a2: pointer; a3: AG_SliderType; a4: cuint; a5: ptr cint; a6: cint; a7: cint): ptr AG_Slider {.importc:"AG_SliderNewIntR", libag_gui.}
proc AG_SliderNewUint*(a2: pointer; a3: AG_SliderType; a4: cuint; a5: ptr cuint; a6: ptr cuint; a7: ptr cuint): ptr AG_Slider {.importc:"AG_SliderNewUint", libag_gui.}
proc AG_SliderNewUintR*(a2: pointer; a3: AG_SliderType; a4: cuint; a5: ptr cuint; a6: cuint; a7: cuint): ptr AG_Slider {.importc:"AG_SliderNewUintR", libag_gui.}
proc AG_SliderNewFlt*(a2: pointer; a3: AG_SliderType; a4: cuint; a5: ptr cfloat; a6: ptr cfloat; a7: ptr cfloat): ptr AG_Slider {.importc:"AG_SliderNewFlt", libag_gui.}
proc AG_SliderNewFltR*(a2: pointer; a3: AG_SliderType; a4: cuint; a5: ptr cfloat; a6: cfloat; a7: cfloat): ptr AG_Slider {.importc:"AG_SliderNewFltR", libag_gui.}
proc AG_SliderNewDbl*(a2: pointer; a3: AG_SliderType; a4: cuint; a5: ptr cdouble; a6: ptr cdouble; a7: ptr cdouble): ptr AG_Slider {.importc:"AG_SliderNewDbl", libag_gui.}
proc AG_SliderNewDblR*(a2: pointer; a3: AG_SliderType; a4: cuint; a5: ptr cdouble; a6: cdouble; a7: cdouble): ptr AG_Slider {.importc:"AG_SliderNewDblR", libag_gui.}
proc AG_SliderSetControlSize*(a2: ptr AG_Slider; a3: cint) {.importc:"AG_SliderSetControlSize", libag_gui.}
proc AG_SocketNew*(a2: pointer; a3: cuint): ptr AG_Socket {.importc:"AG_SocketNew", libag_gui.}
proc AG_SocketFromBMP*(a2: pointer; a3: cuint; a4: cstring): ptr AG_Socket {.importc:"AG_SocketFromBMP", libag_gui.}
proc AG_SocketFromSurface*(a2: pointer; a3: cuint; a4: ptr AG_Surface): ptr AG_Socket {.importc:"AG_SocketFromSurface", libag_gui.}
proc AG_SocketInsertFn*(a2: ptr AG_Socket; a3: proc (a2: ptr AG_Socket; a3: ptr AG_Icon): cint) {.importc:"AG_SocketInsertFn", libag_gui.}
proc AG_SocketRemoveFn*(a2: ptr AG_Socket; a3: proc (a2: ptr AG_Socket; a3: ptr AG_Icon)) {.importc:"AG_SocketRemoveFn", libag_gui.}
proc AG_SocketOverlayFn*(a2: ptr AG_Socket; a3: AG_EventFn; a4: cstring)  {.importc:"AG_SocketOverlayFn", varargs, libag_gui.}
proc AG_SocketSetPadding*(a2: ptr AG_Socket; a3: cint; a4: cint; a5: cint; a6: cint) {.importc:"AG_SocketSetPadding", libag_gui.}
proc AG_SocketBgRect*(a2: ptr AG_Socket; a3: cuint; a4: cuint) {.importc:"AG_SocketBgRect", libag_gui.}
proc AG_SocketBgCircle*(a2: ptr AG_Socket; a3: cuint) {.importc:"AG_SocketBgCircle", libag_gui.}
proc AG_SocketBgPixmap*(a2: ptr AG_Socket; a3: ptr AG_Surface) {.importc:"AG_SocketBgPixmap", libag_gui.}
proc AG_SocketBgPixmapNODUP*(a2: ptr AG_Socket; a3: ptr AG_Surface) {.importc:"AG_SocketBgPixmapNODUP", libag_gui.}
proc AG_SocketInsertIcon*(a2: ptr AG_Socket; a3: ptr AG_Icon) {.importc:"AG_SocketInsertIcon", libag_gui.}
proc AG_SocketRemoveIcon*(a2: ptr AG_Socket) {.importc:"AG_SocketRemoveIcon", libag_gui.}
proc AG_SpinbuttonNew*(a2: pointer; a3: cuint; a4: cstring): ptr AG_Spinbutton {.importc:"AG_SpinbuttonNew", libag_gui.}
proc AG_SpinbuttonAddValue*(a2: ptr AG_Spinbutton; a3: cint) {.importc:"AG_SpinbuttonAddValue", libag_gui.}
proc AG_SpinbuttonSetValue*(a2: ptr AG_Spinbutton)  {.importc:"AG_SpinbuttonSetValue", varargs, libag_gui.}
proc AG_SpinbuttonSetMin*(a2: ptr AG_Spinbutton; a3: cint) {.importc:"AG_SpinbuttonSetMin", libag_gui.}
proc AG_SpinbuttonSetMax*(a2: ptr AG_Spinbutton; a3: cint) {.importc:"AG_SpinbuttonSetMax", libag_gui.}
proc AG_SpinbuttonSetRange*(a2: ptr AG_Spinbutton; a3: cint; a4: cint) {.importc:"AG_SpinbuttonSetRange", libag_gui.}
proc AG_SpinbuttonSetIncrement*(a2: ptr AG_Spinbutton; a3: cint) {.importc:"AG_SpinbuttonSetIncrement", libag_gui.}
proc AG_SpinbuttonSetWriteable*(a2: ptr AG_Spinbutton; a3: cint) {.importc:"AG_SpinbuttonSetWriteable", libag_gui.}
proc AG_StatusbarNew*(a2: pointer; a3: cuint): ptr AG_Statusbar {.importc:"AG_StatusbarNew", libag_gui.}
proc AG_StatusbarAddLabel*(a2: ptr AG_Statusbar; a3: cstring): ptr AG_Label  {.importc:"AG_StatusbarAddLabel", varargs, libag_gui.}
proc AG_InitStyleSheet*(a2: ptr AG_StyleSheet) {.importc:"AG_InitStyleSheet", libag_gui.}
proc AG_DestroyStyleSheet*(a2: ptr AG_StyleSheet) {.importc:"AG_DestroyStyleSheet", libag_gui.}
proc AG_LoadStyleSheet*(a2: pointer; a3: cstring): ptr AG_StyleSheet {.importc:"AG_LoadStyleSheet", libag_gui.}
proc AG_LookupStyleSheet*(a2: ptr AG_StyleSheet; a3: pointer; a4: cstring; a5: cstringArray): cint {.importc:"AG_LookupStyleSheet", libag_gui.}
proc AG_PixelFormatRGB*(a2: cint; a3: uint32; a4: uint32; a5: uint32): ptr AG_PixelFormat {.importc:"AG_PixelFormatRGB", libag_gui.}
proc AG_PixelFormatRGBA*(a2: cint; a3: uint32; a4: uint32; a5: uint32; a6: uint32): ptr AG_PixelFormat {.importc:"AG_PixelFormatRGBA", libag_gui.}
proc AG_PixelFormatIndexed*(a2: cint): ptr AG_PixelFormat {.importc:"AG_PixelFormatIndexed", libag_gui.}
proc AG_PixelFormatDup*(a2: ptr AG_PixelFormat): ptr AG_PixelFormat {.importc:"AG_PixelFormatDup", libag_gui.}
proc AG_PixelFormatFree*(a2: ptr AG_PixelFormat) {.importc:"AG_PixelFormatFree", libag_gui.}
proc AG_PixelFormatComparePalettes*(a2: ptr AG_Palette; a3: ptr AG_Palette): cint {.importc:"AG_PixelFormatComparePalettes", libag_gui.}
proc AG_SurfaceNew*(a2: AG_SurfaceType; a3: cuint; a4: cuint; a5: ptr AG_PixelFormat; a6: cuint): ptr AG_Surface {.importc:"AG_SurfaceNew", libag_gui.}
proc AG_SurfaceEmpty*(): ptr AG_Surface {.importc:"AG_SurfaceEmpty", libag_gui.}
proc AG_SurfaceIndexed*(a2: cuint; a3: cuint; a4: cint; a5: cuint): ptr AG_Surface {.importc:"AG_SurfaceIndexed", libag_gui.}
proc AG_SurfaceRGB*(a2: cuint; a3: cuint; a4: cint; a5: cuint; a6: uint32; a7: uint32; a8: uint32): ptr AG_Surface {.importc:"AG_SurfaceRGB", libag_gui.}
proc AG_SurfaceRGBA*(a2: cuint; a3: cuint; a4: cint; a5: cuint; a6: uint32; a7: uint32; a8: uint32; a9: uint32): ptr AG_Surface {.importc:"AG_SurfaceRGBA", libag_gui.}
proc AG_SurfaceFromPixelsRGB*(a2: pointer; a3: cuint; a4: cuint; a5: cint; a6: uint32; a7: uint32; a8: uint32): ptr AG_Surface {.importc:"AG_SurfaceFromPixelsRGB", libag_gui.}
proc AG_SurfaceFromPixelsRGBA*(a2: pointer; a3: cuint; a4: cuint; a5: cint; a6: uint32; a7: uint32; a8: uint32; a9: uint32): ptr AG_Surface {.importc:"AG_SurfaceFromPixelsRGBA", libag_gui.}
proc AG_SurfaceStdGL*(a2: cuint; a3: cuint): ptr AG_Surface {.importc:"AG_SurfaceStdGL", libag_gui.}
proc AG_SurfaceSetPalette*(a2: ptr AG_Surface; a3: ptr AG_Color; a4: cuint; a5: cuint): cint {.importc:"AG_SurfaceSetPalette", libag_gui.}
proc AG_SurfaceDup*(a2: ptr AG_Surface): ptr AG_Surface {.importc:"AG_SurfaceDup", libag_gui.}
proc AG_SurfaceConvert*(a2: ptr AG_Surface; a3: ptr AG_PixelFormat): ptr AG_Surface {.importc:"AG_SurfaceConvert", libag_gui.}
proc AG_SurfaceCopy*(a2: ptr AG_Surface; a3: ptr AG_Surface) {.importc:"AG_SurfaceCopy", libag_gui.}
proc AG_SurfaceBlit*(a2: ptr AG_Surface; a3: ptr AG_Rect; a4: ptr AG_Surface; a5: cint; a6: cint) {.importc:"AG_SurfaceBlit", libag_gui.}
proc AG_SurfaceResize*(a2: ptr AG_Surface; a3: cuint; a4: cuint): cint {.importc:"AG_SurfaceResize", libag_gui.}
proc AG_SurfaceFree*(a2: ptr AG_Surface) {.importc:"AG_SurfaceFree", libag_gui.}
proc AG_SurfaceFromFile*(a2: cstring): ptr AG_Surface {.importc:"AG_SurfaceFromFile", libag_gui.}
proc AG_SurfaceExportFile*(a2: ptr AG_Surface; a3: cstring): cint {.importc:"AG_SurfaceExportFile", libag_gui.}
proc AG_SurfaceFromSDL*(a2: pointer): ptr AG_Surface {.importc:"AG_SurfaceFromSDL", libag_gui.}
proc AG_SurfaceExportSDL*(a2: ptr AG_Surface): pointer {.importc:"AG_SurfaceExportSDL", libag_gui.}
proc AG_ReadSurfaceFromBMP*(a2: ptr AG_DataSource): ptr AG_Surface {.importc:"AG_ReadSurfaceFromBMP", libag_gui.}
proc AG_SurfaceFromBMP*(a2: cstring): ptr AG_Surface {.importc:"AG_SurfaceFromBMP", libag_gui.}
proc AG_SurfaceExportBMP*(a2: ptr AG_Surface; a3: cstring): cint {.importc:"AG_SurfaceExportBMP", libag_gui.}
proc AG_ReadSurfaceFromPNG*(a2: ptr AG_DataSource): ptr AG_Surface {.importc:"AG_ReadSurfaceFromPNG", libag_gui.}
proc AG_SurfaceFromPNG*(a2: cstring): ptr AG_Surface {.importc:"AG_SurfaceFromPNG", libag_gui.}
proc AG_SurfaceExportPNG*(a2: ptr AG_Surface; a3: cstring; a4: cuint): cint {.importc:"AG_SurfaceExportPNG", libag_gui.}
proc AG_ReadSurfaceFromJPEG*(a2: ptr AG_DataSource): ptr AG_Surface {.importc:"AG_ReadSurfaceFromJPEG", libag_gui.}
proc AG_SurfaceFromJPEG*(a2: cstring): ptr AG_Surface {.importc:"AG_SurfaceFromJPEG", libag_gui.}
proc AG_SurfaceExportJPEG*(a2: ptr AG_Surface; a3: cstring; a4: cuint; a5: cuint): cint {.importc:"AG_SurfaceExportJPEG", libag_gui.}
proc AG_SurfaceBlendPixel*(a2: ptr AG_Surface; a3: ptr uint8; a4: AG_Color; a5: AG_BlendFn) {.importc:"AG_SurfaceBlendPixel", libag_gui.}
proc AG_RGB2HSV*(a2: uint8; a3: uint8; a4: uint8; a5: ptr cfloat; a6: ptr cfloat; a7: ptr cfloat) {.importc:"AG_RGB2HSV", libag_gui.}
proc AG_HSV2RGB*(a2: cfloat; a3: cfloat; a4: cfloat; a5: ptr uint8; a6: ptr uint8; a7: ptr uint8) {.importc:"AG_HSV2RGB", libag_gui.}
proc AG_ScaleSurface*(a2: ptr AG_Surface; a3: uint16; a4: uint16; a5: ptr ptr AG_Surface): cint {.importc:"AG_ScaleSurface", libag_gui.}
proc AG_SetAlphaPixels*(a2: ptr AG_Surface; a3: uint8) {.importc:"AG_SetAlphaPixels", libag_gui.}
proc AG_FillRect*(a2: ptr AG_Surface; a3: ptr AG_Rect; a4: AG_Color) {.importc:"AG_FillRect", libag_gui.}
proc AG_MapPixelIndexedRGB*(a2: ptr AG_PixelFormat; a3: uint8; a4: uint8; a5: uint8): uint32 {.importc:"AG_MapPixelIndexedRGB", libag_gui.}
proc AG_MapPixelIndexedRGBA*(a2: ptr AG_PixelFormat; a3: uint8; a4: uint8; a5: uint8; a6: uint8): uint32 {.importc:"AG_MapPixelIndexedRGBA", libag_gui.}
proc AG_TableNew*(a2: pointer; a3: cuint): ptr AG_Table {.importc:"AG_TableNew", libag_gui.}
proc AG_TableNewPolled*(a2: pointer; a3: cuint; fn: proc (a2: ptr AG_Event); a5: cstring): ptr AG_Table  {.importc:"AG_TableNewPolled", varargs, libag_gui.}
proc AG_TableSizeHint*(a2: ptr AG_Table; a3: cint; a4: cint) {.importc:"AG_TableSizeHint", libag_gui.}
proc AG_TableSetPollInterval*(a2: ptr AG_Table; a3: cuint) {.importc:"AG_TableSetPollInterval", libag_gui.}
proc AG_TableSetSeparator*(a2: ptr AG_Table; a3: cstring) {.importc:"AG_TableSetSeparator", libag_gui.}
proc AG_TableSetRowClickFn*(a2: ptr AG_Table; a3: AG_EventFn; a4: cstring)  {.importc:"AG_TableSetRowClickFn", varargs, libag_gui.}
proc AG_TableSetColClickFn*(a2: ptr AG_Table; a3: AG_EventFn; a4: cstring)  {.importc:"AG_TableSetColClickFn", varargs, libag_gui.}
proc AG_TableSetCellClickFn*(a2: ptr AG_Table; a3: AG_EventFn; a4: cstring)  {.importc:"AG_TableSetCellClickFn", varargs, libag_gui.}
proc AG_TableSetRowDblClickFn*(a2: ptr AG_Table; a3: AG_EventFn; a4: cstring)  {.importc:"AG_TableSetRowDblClickFn", varargs, libag_gui.}
proc AG_TableSetColDblClickFn*(a2: ptr AG_Table; a3: AG_EventFn; a4: cstring)  {.importc:"AG_TableSetColDblClickFn", varargs, libag_gui.}
proc AG_TableSetCellDblClickFn*(a2: ptr AG_Table; a3: AG_EventFn; a4: cstring)  {.importc:"AG_TableSetCellDblClickFn", varargs, libag_gui.}
proc AG_TableSetColHeight*(a2: ptr AG_Table; a3: cint) {.importc:"AG_TableSetColHeight", libag_gui.}
proc AG_TableSetRowHeight*(a2: ptr AG_Table; a3: cint) {.importc:"AG_TableSetRowHeight", libag_gui.}
proc AG_TableSetColMin*(a2: ptr AG_Table; a3: cint) {.importc:"AG_TableSetColMin", libag_gui.}
proc AG_TableSetDefaultColWidth*(a2: ptr AG_Table; a3: cint) {.importc:"AG_TableSetDefaultColWidth", libag_gui.}
proc AG_TableSetSelectionMode*(a2: ptr AG_Table; a3: AG_TableSelMode) {.importc:"AG_TableSetSelectionMode", libag_gui.}
proc AG_TableSetSelectionColor*(a2: ptr AG_Table; a3: uint8; a4: uint8; a5: uint8; a6: uint8) {.importc:"AG_TableSetSelectionColor", libag_gui.}
proc AG_TableSetColumnAction*(a2: ptr AG_Table; a3: cuint) {.importc:"AG_TableSetColumnAction", libag_gui.}
proc AG_TableClear*(a2: ptr AG_Table) {.importc:"AG_TableClear", libag_gui.}
proc AG_TableBegin*(a2: ptr AG_Table) {.importc:"AG_TableBegin", libag_gui.}
proc AG_TableEnd*(a2: ptr AG_Table) {.importc:"AG_TableEnd", libag_gui.}
proc AG_TableSort*(a2: ptr AG_Table) {.importc:"AG_TableSort", libag_gui.}
proc AG_TableInitCell*(a2: ptr AG_Table; a3: ptr AG_TableCell) {.importc:"AG_TableInitCell", libag_gui.}
proc AG_TablePrintCell*(a2: ptr AG_TableCell; a3: cstring; a4: csize) {.importc:"AG_TablePrintCell", libag_gui.}
proc AG_TableFreeCell*(a2: ptr AG_Table; a3: ptr AG_TableCell) {.importc:"AG_TableFreeCell", libag_gui.}
proc AG_TableAddRow*(a2: ptr AG_Table; a3: cstring): cint  {.importc:"AG_TableAddRow", varargs, libag_gui.}
proc AG_TableSelectRow*(a2: ptr AG_Table; a3: cint) {.importc:"AG_TableSelectRow", libag_gui.}
proc AG_TableDeselectRow*(a2: ptr AG_Table; a3: cint) {.importc:"AG_TableDeselectRow", libag_gui.}
proc AG_TableSelectAllRows*(a2: ptr AG_Table) {.importc:"AG_TableSelectAllRows", libag_gui.}
proc AG_TableDeselectAllRows*(a2: ptr AG_Table) {.importc:"AG_TableDeselectAllRows", libag_gui.}
proc AG_TableRowSelected*(a2: ptr AG_Table; a3: cint): cint {.importc:"AG_TableRowSelected", libag_gui.}
proc AG_TableAddCol*(a2: ptr AG_Table; a3: cstring; a4: cstring; a5: proc (a2: pointer; a3: pointer): cint): cint {.importc:"AG_TableAddCol", libag_gui.}
proc AG_TableSelectAllCols*(a2: ptr AG_Table) {.importc:"AG_TableSelectAllCols", libag_gui.}
proc AG_TableDeselectAllCols*(a2: ptr AG_Table) {.importc:"AG_TableDeselectAllCols", libag_gui.}
proc redrawCells*(a2: ptr AG_Table) {.importc:"AG_TableRedrawCells", libag_gui.}
proc AG_TableCompareCells*(a2: ptr AG_TableCell; a3: ptr AG_TableCell): cint {.importc:"AG_TableCompareCells", libag_gui.}
proc AG_TableSetPopup*(a2: ptr AG_Table; a3: cint; a4: cint): ptr AG_MenuItem {.importc:"AG_TableSetPopup", libag_gui.}
proc AG_TableSaveASCII*(a2: ptr AG_Table; a3: ptr FILE; a4: char): cint {.importc:"AG_TableSaveASCII", libag_gui.}
proc AG_InitTextSubsystem*(): cint {.importc:"AG_InitTextSubsystem", libag_gui.}
proc AG_DestroyTextSubsystem*() {.importc:"AG_DestroyTextSubsystem", libag_gui.}
proc AG_TextParseFontSpec*(a2: cstring) {.importc:"AG_TextParseFontSpec", libag_gui.}
proc AG_FetchFont*(a2: cstring; a3: cint; a4: cint): ptr AG_Font {.importc:"AG_FetchFont", libag_gui.}
proc AG_UnusedFont*(a2: ptr AG_Font) {.importc:"AG_UnusedFont", libag_gui.}
proc AG_SetDefaultFont*(a2: ptr AG_Font) {.importc:"AG_SetDefaultFont", libag_gui.}
proc AG_SetRTL*(a2: cint) {.importc:"AG_SetRTL", libag_gui.}
proc AG_PushTextState*() {.importc:"AG_PushTextState", libag_gui.}
proc AG_PopTextState*() {.importc:"AG_PopTextState", libag_gui.}
proc AG_TextFontLookup*(a2: cstring; a3: cint; a4: cuint): ptr AG_Font {.importc:"AG_TextFontLookup", libag_gui.}
proc AG_TextFontPts*(a2: cint): ptr AG_Font {.importc:"AG_TextFontPts", libag_gui.}
proc AG_TextFontPct*(a2: cint): ptr AG_Font {.importc:"AG_TextFontPct", libag_gui.}
proc AG_TextSize*(a2: cstring; a3: ptr cint; a4: ptr cint) {.importc:"AG_TextSize", libag_gui.}
proc AG_TextSizeMulti*(a2: cstring; a3: ptr cint; a4: ptr cint; a5: ptr ptr cuint; a6: ptr cuint) {.importc:"AG_TextSizeMulti", libag_gui.}
proc AG_TextSizeUCS4*(a2: ptr uint32; a3: ptr cint; a4: ptr cint) {.importc:"AG_TextSizeUCS4", libag_gui.}
proc AG_TextSizeMultiUCS4*(a2: ptr uint32; a3: ptr cint; a4: ptr cint; a5: ptr ptr cuint; a6: ptr cuint) {.importc:"AG_TextSizeMultiUCS4", libag_gui.}
proc AG_TextRenderf*(a2: cstring): ptr AG_Surface  {.importc:"AG_TextRenderf", varargs, libag_gui.}
proc AG_TextRenderUCS4*(a2: ptr uint32): ptr AG_Surface {.importc:"AG_TextRenderUCS4", libag_gui.}
proc AG_TextMsgS*(a2: AG_TextMsgTitle; a3: cstring) {.importc:"AG_TextMsgS", libag_gui.}
proc AG_TextMsg*(a2: AG_TextMsgTitle; a3: cstring)  {.importc:"AG_TextMsg", varargs, libag_gui.}
proc AG_TextTmsgS*(a2: AG_TextMsgTitle; a3: uint32; a4: cstring) {.importc:"AG_TextTmsgS", libag_gui.}
proc AG_TextTmsg*(a2: AG_TextMsgTitle; a3: uint32; a4: cstring)  {.importc:"AG_TextTmsg", varargs, libag_gui.}
proc AG_TextInfoS*(a2: cstring; a3: cstring) {.importc:"AG_TextInfoS", libag_gui.}
proc AG_TextInfo*(a2: cstring; a3: cstring)  {.importc:"AG_TextInfo", varargs, libag_gui.}
proc AG_TextWarningS*(a2: cstring; a3: cstring) {.importc:"AG_TextWarningS", libag_gui.}
proc AG_TextWarning*(a2: cstring; a3: cstring)  {.importc:"AG_TextWarning", varargs, libag_gui.}
proc AG_TextErrorS*(a2: cstring) {.importc:"AG_TextErrorS", libag_gui.}
proc AG_TextError*(a2: cstring)  {.importc:"AG_TextError", varargs, libag_gui.}
proc AG_TextEditFloat*(a2: ptr cdouble; a3: cdouble; a4: cdouble; a5: cstring; a6: cstring)  {.importc:"AG_TextEditFloat", varargs, libag_gui.}
proc AG_TextEditString*(a2: cstring; a3: csize; a4: cstring)  {.importc:"AG_TextEditString", varargs, libag_gui.}
proc AG_TextPromptOptions*(a2: ptr ptr AG_Button; a3: cuint; a4: cstring): ptr AG_Window  {.importc:"AG_TextPromptOptions", varargs, libag_gui.}
proc AG_TextInitGlyphCache*(a2: ptr AG_Driver) {.importc:"AG_TextInitGlyphCache", libag_gui.}
proc AG_TextClearGlyphCache*(a2: ptr AG_Driver) {.importc:"AG_TextClearGlyphCache", libag_gui.}
proc AG_TextDestroyGlyphCache*(a2: ptr AG_Driver) {.importc:"AG_TextDestroyGlyphCache", libag_gui.}
proc AG_TextRenderGlyphMiss*(a2: ptr AG_Driver; a3: uint32): ptr AG_Glyph {.importc:"AG_TextRenderGlyphMiss", libag_gui.}
proc AG_TextAlign*(a2: ptr cint; a3: ptr cint; a4: cint; a5: cint; a6: cint; a7: cint; a8: cint; a9: cint; a10: cint; a11: cint; a12: AG_TextJustify; a13: AG_TextVAlign) {.importc:"AG_TextAlign", libag_gui.}
proc AG_TextCacheNew*(a2: pointer; a3: cuint; a4: cuint): ptr AG_TextCache {.importc:"AG_TextCacheNew", libag_gui.}
proc AG_TextCacheClear*(a2: ptr AG_TextCache) {.importc:"AG_TextCacheClear", libag_gui.}
proc AG_TextCacheDestroy*(a2: ptr AG_TextCache) {.importc:"AG_TextCacheDestroy", libag_gui.}
proc AG_TextCacheGet*(a2: ptr AG_TextCache; a3: cstring): cint {.importc:"AG_TextCacheGet", libag_gui.}
proc AG_TextboxNew*(a2: pointer; a3: cuint; a4: cstring): ptr AG_Textbox  {.importc:"AG_TextboxNew", varargs, libag_gui.}
proc AG_TextboxNewS*(a2: pointer; a3: cuint; a4: cstring): ptr AG_Textbox {.importc:"AG_TextboxNewS", libag_gui.}
proc AG_TextboxSetLabel*(a2: ptr AG_Textbox; a3: cstring)  {.importc:"AG_TextboxSetLabel", varargs, libag_gui.}
proc AG_TextboxSetLabelS*(a2: ptr AG_Textbox; a3: cstring) {.importc:"AG_TextboxSetLabelS", libag_gui.}
proc AG_TextboxSetWordWrap*(a2: ptr AG_Textbox; a3: cint) {.importc:"AG_TextboxSetWordWrap", libag_gui.}
proc AG_TextboxPrintf*(a2: ptr AG_Textbox; a3: cstring)  {.importc:"AG_TextboxPrintf", varargs, libag_gui.}
proc AG_TextboxMapPosition*(a2: ptr AG_Textbox; a3: cint; a4: cint; a5: ptr cint): cint {.importc:"AG_TextboxMapPosition", libag_gui.}
proc AG_TextboxMoveCursor*(a2: ptr AG_Textbox; a3: cint; a4: cint) {.importc:"AG_TextboxMoveCursor", libag_gui.}
proc AG_TextboxSetCursorPos*(a2: ptr AG_Textbox; a3: cint) {.importc:"AG_TextboxSetCursorPos", libag_gui.}
proc AG_TitlebarNew*(a2: pointer; a3: cuint): ptr AG_Titlebar {.importc:"AG_TitlebarNew", libag_gui.}
proc AG_TlistNew*(a2: pointer; a3: cuint): ptr AG_Tlist {.importc:"AG_TlistNew", libag_gui.}
proc AG_TlistNewPolled*(a2: pointer; a3: cuint; a4: AG_EventFn; a5: cstring): ptr AG_Tlist  {.importc:"AG_TlistNewPolled", varargs, libag_gui.}
proc AG_TlistSizeHint*(a2: ptr AG_Tlist; a3: cstring; a4: cint) {.importc:"AG_TlistSizeHint", libag_gui.}
proc AG_TlistSizeHintPixels*(a2: ptr AG_Tlist; a3: cint; a4: cint) {.importc:"AG_TlistSizeHintPixels", libag_gui.}
proc AG_TlistSizeHintLargest*(a2: ptr AG_Tlist; a3: cint) {.importc:"AG_TlistSizeHintLargest", libag_gui.}
proc AG_TlistSetItemHeight*(a2: ptr AG_Tlist; a3: cint) {.importc:"AG_TlistSetItemHeight", libag_gui.}
proc AG_TlistSetIconWidth*(a2: ptr AG_Tlist; a3: cint) {.importc:"AG_TlistSetIconWidth", libag_gui.}
proc AG_TlistSetIcon*(a2: ptr AG_Tlist; a3: ptr AG_TlistItem; a4: ptr AG_Surface) {.importc:"AG_TlistSetIcon", libag_gui.}
proc AG_TlistSetRefresh*(a2: ptr AG_Tlist; a3: cint) {.importc:"AG_TlistSetRefresh", libag_gui.}
proc AG_TlistSetArgs*(a2: ptr AG_TlistItem; a3: cstring)  {.importc:"AG_TlistSetArgs", varargs, libag_gui.}
proc AG_TlistDel*(a2: ptr AG_Tlist; a3: ptr AG_TlistItem) {.importc:"AG_TlistDel", libag_gui.}
proc AG_TlistUniq*(a2: ptr AG_Tlist) {.importc:"AG_TlistUniq", libag_gui.}
proc AG_TlistClear*(a2: ptr AG_Tlist) {.importc:"AG_TlistClear", libag_gui.}
proc AG_TlistRestore*(a2: ptr AG_Tlist) {.importc:"AG_TlistRestore", libag_gui.}
proc AG_TlistAdd*(a2: ptr AG_Tlist; a3: ptr AG_Surface; a4: cstring): ptr AG_TlistItem  {.importc:"AG_TlistAdd", varargs, libag_gui.}
proc AG_TlistAddS*(a2: ptr AG_Tlist; a3: ptr AG_Surface; a4: cstring): ptr AG_TlistItem {.importc:"AG_TlistAddS", libag_gui.}
proc AG_TlistAddHead*(a2: ptr AG_Tlist; a3: ptr AG_Surface; a4: cstring): ptr AG_TlistItem  {.importc:"AG_TlistAddHead", varargs, libag_gui.}
proc AG_TlistAddHeadS*(a2: ptr AG_Tlist; a3: ptr AG_Surface; a4: cstring): ptr AG_TlistItem {.importc:"AG_TlistAddHeadS", libag_gui.}
proc AG_TlistAddPtr*(a2: ptr AG_Tlist; a3: ptr AG_Surface; a4: cstring; a5: pointer): ptr AG_TlistItem {.importc:"AG_TlistAddPtr", libag_gui.}
proc AG_TlistAddPtrHead*(a2: ptr AG_Tlist; a3: ptr AG_Surface; a4: cstring; a5: pointer): ptr AG_TlistItem {.importc:"AG_TlistAddPtrHead", libag_gui.}
proc AG_TlistSelect*(a2: ptr AG_Tlist; a3: ptr AG_TlistItem) {.importc:"AG_TlistSelect", libag_gui.}
proc AG_TlistDeselect*(a2: ptr AG_Tlist; a3: ptr AG_TlistItem) {.importc:"AG_TlistDeselect", libag_gui.}
proc AG_TlistSelectAll*(a2: ptr AG_Tlist) {.importc:"AG_TlistSelectAll", libag_gui.}
proc AG_TlistSelectPtr*(a2: ptr AG_Tlist; a3: pointer): ptr AG_TlistItem {.importc:"AG_TlistSelectPtr", libag_gui.}
proc AG_TlistSelectText*(a2: ptr AG_Tlist; a3: cstring): ptr AG_TlistItem {.importc:"AG_TlistSelectText", libag_gui.}
proc AG_TlistDeselectAll*(a2: ptr AG_Tlist) {.importc:"AG_TlistDeselectAll", libag_gui.}
proc AG_TlistFindByIndex*(a2: ptr AG_Tlist; a3: cint): ptr AG_TlistItem {.importc:"AG_TlistFindByIndex", libag_gui.}
proc AG_TlistSelectedItem*(a2: ptr AG_Tlist): ptr AG_TlistItem {.importc:"AG_TlistSelectedItem", libag_gui.}
proc AG_TlistSelectedItemPtr*(a2: ptr AG_Tlist): pointer {.importc:"AG_TlistSelectedItemPtr", libag_gui.}
proc AG_TlistFindPtr*(a2: ptr AG_Tlist): pointer {.importc:"AG_TlistFindPtr", libag_gui.}
proc AG_TlistFindText*(a2: ptr AG_Tlist; a3: cstring): ptr AG_TlistItem {.importc:"AG_TlistFindText", libag_gui.}
proc AG_TlistFirstItem*(a2: ptr AG_Tlist): ptr AG_TlistItem {.importc:"AG_TlistFirstItem", libag_gui.}
proc AG_TlistLastItem*(a2: ptr AG_Tlist): ptr AG_TlistItem {.importc:"AG_TlistLastItem", libag_gui.}
proc AG_TlistSetPopup*(a2: ptr AG_Tlist; a3: cstring): ptr AG_MenuItem {.importc:"AG_TlistSetPopup", libag_gui.}
proc AG_TlistScrollToStart*(a2: ptr AG_Tlist) {.importc:"AG_TlistScrollToStart", libag_gui.}
proc AG_TlistScrollToEnd*(a2: ptr AG_Tlist) {.importc:"AG_TlistScrollToEnd", libag_gui.}
proc AG_TlistSetDblClickFn*(a2: ptr AG_Tlist; a3: AG_EventFn; a4: cstring)  {.importc:"AG_TlistSetDblClickFn", varargs, libag_gui.}
proc AG_TlistSetPopupFn*(a2: ptr AG_Tlist; a3: AG_EventFn; a4: cstring)  {.importc:"AG_TlistSetPopupFn", varargs, libag_gui.}
proc AG_TlistSetChangedFn*(a2: ptr AG_Tlist; a3: AG_EventFn; a4: cstring)  {.importc:"AG_TlistSetChangedFn", varargs, libag_gui.}
proc AG_TlistSetCompareFn*(a2: ptr AG_Tlist; a3: proc (a2: ptr AG_TlistItem; a3: ptr AG_TlistItem): cint) {.importc:"AG_TlistSetCompareFn", libag_gui.}
proc AG_TlistCompareStrings*(a2: ptr AG_TlistItem; a3: ptr AG_TlistItem): cint {.importc:"AG_TlistCompareStrings", libag_gui.}
proc AG_TlistComparePtrs*(a2: ptr AG_TlistItem; a3: ptr AG_TlistItem): cint {.importc:"AG_TlistComparePtrs", libag_gui.}
proc AG_TlistComparePtrsAndClasses*(a2: ptr AG_TlistItem; a3: ptr AG_TlistItem): cint {.importc:"AG_TlistComparePtrsAndClasses", libag_gui.}
proc AG_TlistSort*(a2: ptr AG_Tlist): cint {.importc:"AG_TlistSort", libag_gui.}
proc AG_ToolbarNew*(a2: pointer; a3: AG_ToolbarType; a4: cint; a5: cuint): ptr AG_Toolbar {.importc:"AG_ToolbarNew", libag_gui.}
proc AG_ToolbarInit*(a2: ptr AG_Toolbar; a3: AG_ToolbarType; a4: cint; a5: cuint) {.importc:"AG_ToolbarInit", libag_gui.}
proc AG_ToolbarScale*(a2: pointer; a3: cint; a4: cint) {.importc:"AG_ToolbarScale", libag_gui.}
proc AG_ToolbarRow*(a2: ptr AG_Toolbar; a3: cint) {.importc:"AG_ToolbarRow", libag_gui.}
proc AG_ToolbarButton*(a2: ptr AG_Toolbar; a3: cstring; a4: cint; a5: proc (a2: ptr AG_Event); a6: cstring): ptr AG_Button  {.importc:"AG_ToolbarButton", varargs, libag_gui.}
proc AG_ToolbarButtonIcon*(a2: ptr AG_Toolbar; a3: ptr AG_Surface; a4: cint; a5: proc (a2: ptr AG_Event); a6: cstring): ptr AG_Button  {.importc:"AG_ToolbarButtonIcon", varargs, libag_gui.}
proc AG_ToolbarSeparator*(a2: ptr AG_Toolbar) {.importc:"AG_ToolbarSeparator", libag_gui.}
proc AG_ToolbarSelect*(a2: ptr AG_Toolbar; a3: ptr AG_Button) {.importc:"AG_ToolbarSelect", libag_gui.}
proc AG_ToolbarDeselect*(a2: ptr AG_Toolbar; a3: ptr AG_Button) {.importc:"AG_ToolbarDeselect", libag_gui.}
proc AG_ToolbarSelectOnly*(a2: ptr AG_Toolbar; a3: ptr AG_Button) {.importc:"AG_ToolbarSelectOnly", libag_gui.}
proc AG_ToolbarSelectAll*(a2: ptr AG_Toolbar) {.importc:"AG_ToolbarSelectAll", libag_gui.}
proc AG_ToolbarDeselectAll*(a2: ptr AG_Toolbar) {.importc:"AG_ToolbarDeselectAll", libag_gui.}
proc AG_TreetblNew*(a2: pointer; a3: cuint; a4: AG_TreetblDataFn; a5: AG_TreetblSortFn): ptr AG_Treetbl {.importc:"AG_TreetblNew", libag_gui.}
proc AG_TreetblSizeHint*(a2: ptr AG_Treetbl; a3: cint; a4: cint) {.importc:"AG_TreetblSizeHint", libag_gui.}
proc AG_TreetblSetRefreshRate*(a2: ptr AG_Treetbl; a3: cuint) {.importc:"AG_TreetblSetRefreshRate", libag_gui.}
proc AG_TreetblSetColHeight*(a2: ptr AG_Treetbl; a3: cint) {.importc:"AG_TreetblSetColHeight", libag_gui.}
proc AG_TreetblSetSortCol*(a2: ptr AG_Treetbl; a3: ptr AG_TreetblCol) {.importc:"AG_TreetblSetSortCol", libag_gui.}
proc AG_TreetblSetSortMode*(a2: ptr AG_Treetbl; mode: AG_TreetblSortMode) {.importc:"AG_TreetblSetSortMode", libag_gui.}
proc AG_TreetblSetExpanderCol*(a2: ptr AG_Treetbl; a3: ptr AG_TreetblCol) {.importc:"AG_TreetblSetExpanderCol", libag_gui.}
proc AG_TreetblAddCol*(a2: ptr AG_Treetbl; a3: cint; a4: cstring; a5: cstring): ptr AG_TreetblCol  {.importc:"AG_TreetblAddCol", varargs, libag_gui.}
proc AG_TreetblSelectCol*(a2: ptr AG_Treetbl; a3: ptr AG_TreetblCol) {.importc:"AG_TreetblSelectCol", libag_gui.}
proc AG_TreetblSelectColID*(a2: ptr AG_Treetbl; a3: cint): cint {.importc:"AG_TreetblSelectColID", libag_gui.}
proc AG_TreetblDeselectCol*(a2: ptr AG_Treetbl; a3: ptr AG_TreetblCol) {.importc:"AG_TreetblDeselectCol", libag_gui.}
proc AG_TreetblDeselectColID*(a2: ptr AG_Treetbl; a3: cint): cint {.importc:"AG_TreetblDeselectColID", libag_gui.}
proc AG_TreetblAddRow*(a2: ptr AG_Treetbl; a3: ptr AG_TreetblRow; a4: cint; a5: cstring): ptr AG_TreetblRow  {.importc:"AG_TreetblAddRow", varargs, libag_gui.}
proc AG_TreetblDelRow*(a2: ptr AG_Treetbl; a3: ptr AG_TreetblRow) {.importc:"AG_TreetblDelRow", libag_gui.}
proc AG_TreetblClearRows*(a2: ptr AG_Treetbl) {.importc:"AG_TreetblClearRows", libag_gui.}
proc AG_TreetblRestoreRows*(a2: ptr AG_Treetbl) {.importc:"AG_TreetblRestoreRows", libag_gui.}
proc AG_TreetblSelectRow*(a2: ptr AG_Treetbl; a3: ptr AG_TreetblRow) {.importc:"AG_TreetblSelectRow", libag_gui.}
proc AG_TreetblDeselectRow*(a2: ptr AG_Treetbl; a3: ptr AG_TreetblRow) {.importc:"AG_TreetblDeselectRow", libag_gui.}
proc AG_TreetblSelectAll*(a2: ptr AG_Treetbl; a3: ptr AG_TreetblRow) {.importc:"AG_TreetblSelectAll", libag_gui.}
proc AG_TreetblDeselectAll*(a2: ptr AG_Treetbl; a3: ptr AG_TreetblRow) {.importc:"AG_TreetblDeselectAll", libag_gui.}
proc AG_TreetblSelectedRow*(a2: ptr AG_Treetbl): ptr AG_TreetblRow {.importc:"AG_TreetblSelectedRow", libag_gui.}
proc AG_TreetblExpandRow*(a2: ptr AG_Treetbl; a3: ptr AG_TreetblRow) {.importc:"AG_TreetblExpandRow", libag_gui.}
proc AG_TreetblCollapseRow*(a2: ptr AG_Treetbl; a3: ptr AG_TreetblRow) {.importc:"AG_TreetblCollapseRow", libag_gui.}
proc AG_TTFInit*(): cint {.importc:"AG_TTFInit", libag_gui.}
proc AG_TTFDestroy*() {.importc:"AG_TTFDestroy", libag_gui.}
proc AG_TTFOpenFont*(a2: ptr AG_Font): cint {.importc:"AG_TTFOpenFont", libag_gui.}
proc AG_TTFCloseFont*(a2: ptr AG_Font) {.importc:"AG_TTFCloseFont", libag_gui.}
proc AG_TTFFindGlyph*(a2: ptr AG_TTFFont; a3: uint32; a4: cint): cint {.importc:"AG_TTFFindGlyph", libag_gui.}
proc AG_UComboNew*(a2: pointer; a3: cuint): ptr AG_UCombo {.importc:"AG_UComboNew", libag_gui.}
proc AG_UComboNewPolled*(a2: pointer; a3: cuint; a4: AG_EventFn; a5: cstring): ptr AG_UCombo  {.importc:"AG_UComboNewPolled", varargs, libag_gui.}
proc AG_UComboSizeHint*(a2: ptr AG_UCombo; a3: cstring; a4: cint) {.importc:"AG_UComboSizeHint", libag_gui.}
proc AG_UComboSizeHintPixels*(a2: ptr AG_UCombo; a3: cint; a4: cint) {.importc:"AG_UComboSizeHintPixels", libag_gui.}
proc AG_FindUnit*(a2: cstring): ptr AG_Unit {.importc:"AG_FindUnit", libag_gui.}
proc AG_BestUnit*(a2: ptr AG_Unit; a3: cdouble): ptr AG_Unit {.importc:"AG_BestUnit", libag_gui.}
proc AG_UnitFormat*(a2: cdouble; a3: ptr AG_Unit; a4: cstring; a5: csize): cint {.importc:"AG_UnitFormat", libag_gui.}
proc AG_UnitFahrenheit*(a2: cdouble; a3: cint): cdouble {.importc:"AG_UnitFahrenheit", libag_gui.}
proc AG_UnitCelsius*(a2: cdouble; a3: cint): cdouble {.importc:"AG_UnitCelsius", libag_gui.}
proc AG_WidgetDraw*(a2: pointer) {.importc:"AG_WidgetDraw", libag_gui.}
proc AG_WidgetSizeReq*(a2: pointer; a3: ptr AG_SizeReq) {.importc:"AG_WidgetSizeReq", libag_gui.}
proc AG_WidgetSizeAlloc*(a2: pointer; a3: ptr AG_SizeAlloc) {.importc:"AG_WidgetSizeAlloc", libag_gui.}
proc AG_WidgetSetFocusable*(a2: pointer; a3: cint): cint {.importc:"AG_WidgetSetFocusable", libag_gui.}
proc AG_WidgetForwardFocus*(a2: pointer; a3: pointer) {.importc:"AG_WidgetForwardFocus", libag_gui.}
proc AG_WidgetFocus*(a2: pointer): cint {.importc:"AG_WidgetFocus", libag_gui.}
proc AG_WidgetUnfocus*(a2: pointer) {.importc:"AG_WidgetUnfocus", libag_gui.}
proc AG_WidgetFindFocused*(a2: pointer): ptr AG_Widget {.importc:"AG_WidgetFindFocused", libag_gui.}
proc AG_WidgetFindPoint*(a2: cstring; a3: cint; a4: cint): pointer {.importc:"AG_WidgetFindPoint", libag_gui.}
proc AG_WidgetFindRect*(a2: cstring; a3: cint; a4: cint; a5: cint; a6: cint): pointer {.importc:"AG_WidgetFindRect", libag_gui.}
proc AG_WidgetUpdateCoords*(a2: pointer; a3: cint; a4: cint) {.importc:"AG_WidgetUpdateCoords", libag_gui.}
proc AG_WidgetMapSurface*(a2: pointer; a3: ptr AG_Surface): cint {.importc:"AG_WidgetMapSurface", libag_gui.}
proc AG_WidgetReplaceSurface*(a2: pointer; a3: cint; a4: ptr AG_Surface) {.importc:"AG_WidgetReplaceSurface", libag_gui.}
proc AG_WidgetBlitGL*(a2: pointer; a3: ptr AG_Surface; a4: cfloat; a5: cfloat) {.importc:"AG_WidgetBlitGL", libag_gui.}
proc AG_WidgetBlitSurfaceGL*(a2: pointer; a3: cint; a4: cfloat; a5: cfloat) {.importc:"AG_WidgetBlitSurfaceGL", libag_gui.}
proc AG_WidgetBlitSurfaceFlippedGL*(a2: pointer; a3: cint; a4: cfloat; a5: cfloat) {.importc:"AG_WidgetBlitSurfaceFlippedGL", libag_gui.}
proc AG_WidgetFreeResourcesGL*(a2: pointer) {.importc:"AG_WidgetFreeResourcesGL", libag_gui.}
proc AG_WidgetRegenResourcesGL*(a2: pointer) {.importc:"AG_WidgetRegenResourcesGL", libag_gui.}
proc AG_WidgetSensitive*(a2: pointer; a3: cint; a4: cint): cint {.importc:"AG_WidgetSensitive", libag_gui.}
proc AG_WidgetParseSizeSpec*(a2: cstring; a3: ptr cint): AG_SizeSpec {.importc:"AG_WidgetParseSizeSpec", libag_gui.}
proc AG_WidgetScrollDelta*(a2: ptr uint32): cint {.importc:"AG_WidgetScrollDelta", libag_gui.}
proc AG_WidgetFind*(a2: pointer; a3: cstring): pointer {.importc:"AG_WidgetFind", libag_gui.}
proc AG_WidgetShow*(a2: pointer) {.importc:"AG_WidgetShow", libag_gui.}
proc AG_WidgetHide*(a2: pointer) {.importc:"AG_WidgetHide", libag_gui.}
proc AG_WidgetShowAll*(a2: pointer) {.importc:"AG_WidgetShowAll", libag_gui.}
proc AG_WidgetHideAll*(a2: pointer) {.importc:"AG_WidgetHideAll", libag_gui.}
proc AG_WidgetEnableAll*(a2: pointer) {.importc:"AG_WidgetEnableAll", libag_gui.}
proc AG_WidgetDisabledAll*(a2: pointer) {.importc:"AG_WidgetDisabledAll", libag_gui.}
proc AG_WidgetInheritDraw*(a2: pointer) {.importc:"AG_WidgetInheritDraw", libag_gui.}
proc AG_WidgetInheritSizeRequest*(a2: pointer; a3: ptr AG_SizeReq) {.importc:"AG_WidgetInheritSizeRequest", libag_gui.}
proc AG_WidgetInheritSizeAllocate*(a2: pointer; a3: ptr AG_SizeAlloc): cint {.importc:"AG_WidgetInheritSizeAllocate", libag_gui.}
proc AG_WidgetSurface*(a2: pointer): ptr AG_Surface {.importc:"AG_WidgetSurface", libag_gui.}
proc AG_RedrawOnChange*(a2: pointer; a3: cint; a4: cstring) {.importc:"AG_RedrawOnChange", libag_gui.}
proc AG_RedrawOnTick*(a2: pointer; a3: cint) {.importc:"AG_RedrawOnTick", libag_gui.}
proc AG_WidgetStdKeyDown*(a2: ptr AG_Event) {.importc:"AG_WidgetStdKeyDown", libag_gui.}
proc AG_WidgetStdKeyUp*(a2: ptr AG_Event) {.importc:"AG_WidgetStdKeyUp", libag_gui.}
proc AG_WidgetStdMouseButtonDown*(a2: ptr AG_Event) {.importc:"AG_WidgetStdMouseButtonDown", libag_gui.}
proc AG_WidgetStdMouseButtonUp*(a2: ptr AG_Event) {.importc:"AG_WidgetStdMouseButtonUp", libag_gui.}
proc AG_ActionFn*(a2: pointer; a3: cstring; a4: AG_EventFn; a5: cstring): ptr AG_Action  {.importc:"AG_ActionFn", varargs, libag_gui.}
proc AG_ActionSetInt*(a2: pointer; a3: cstring; a4: ptr cint; a5: cint): ptr AG_Action {.importc:"AG_ActionSetInt", libag_gui.}
proc AG_ActionToggleInt*(a2: pointer; a3: cstring; a4: ptr cint): ptr AG_Action {.importc:"AG_ActionToggleInt", libag_gui.}
proc AG_ActionSetFlag*(a2: pointer; a3: cstring; a4: ptr cuint; a5: cuint; a6: cint): ptr AG_Action {.importc:"AG_ActionSetFlag", libag_gui.}
proc AG_ActionToggleFlag*(a2: pointer; a3: cstring; a4: ptr cuint; a5: cuint): ptr AG_Action {.importc:"AG_ActionToggleFlag", libag_gui.}
proc AG_ActionOnButtonDown*(a2: pointer; a3: cint; a4: cstring) {.importc:"AG_ActionOnButtonDown", libag_gui.}
proc AG_ActionOnButtonUp*(a2: pointer; a3: cint; a4: cstring) {.importc:"AG_ActionOnButtonUp", libag_gui.}
proc AG_ActionOnKey*(a2: pointer; a3: AG_KeySym; a4: AG_KeyMod; a5: cstring) {.importc:"AG_ActionOnKey", libag_gui.}
proc AG_ActionOnKeyDown*(a2: pointer; a3: AG_KeySym; a4: AG_KeyMod; a5: cstring) {.importc:"AG_ActionOnKeyDown", libag_gui.}
proc AG_ActionOnKeyUp*(a2: pointer; a3: AG_KeySym; a4: AG_KeyMod; a5: cstring) {.importc:"AG_ActionOnKeyUp", libag_gui.}
proc AG_ExecMouseAction*(a2: pointer; a3: AG_ActionEventType; a4: cint; a5: cint; a6: cint): cint {.importc:"AG_ExecMouseAction", libag_gui.}
proc AG_ExecKeyAction*(a2: pointer; a3: AG_ActionEventType; a4: AG_KeySym; a5: AG_KeyMod): cint {.importc:"AG_ExecKeyAction", libag_gui.}
proc AG_ExecAction*(a2: pointer; a3: ptr AG_Action): cint {.importc:"AG_ExecAction", libag_gui.}
proc AG_WidgetEnable*(a2: pointer) {.importc:"AG_WidgetEnable", libag_gui.}
proc AG_WidgetDisable*(a2: pointer) {.importc:"AG_WidgetDisable", libag_gui.}
proc AG_WidgetCompileStyle*(a2: pointer) {.importc:"AG_WidgetCompileStyle", libag_gui.}
proc AG_WidgetCopyStyle*(a2: pointer; a3: pointer) {.importc:"AG_WidgetCopyStyle", libag_gui.}
proc AG_WidgetFreeStyle*(a2: pointer) {.importc:"AG_WidgetFreeStyle", libag_gui.}
proc AG_SetFont*(a2: pointer; a3: ptr AG_Font) {.importc:"AG_SetFont", libag_gui.}
proc AG_SetStyle*(a2: pointer; a3: cstring; a4: cstring) {.importc:"AG_SetStyle", libag_gui.}
proc AG_InitWindowSystem*() {.importc:"AG_InitWindowSystem", libag_gui.}
proc AG_DestroyWindowSystem*() {.importc:"AG_DestroyWindowSystem", libag_gui.}
proc AG_WindowNew*(a2: cuint): ptr AG_Window {.importc:"AG_WindowNew", libag_gui.}
proc AG_WindowNewSw*(a2: pointer; a3: cuint): ptr AG_Window {.importc:"AG_WindowNewSw", libag_gui.}
proc AG_WindowNewNamedS*(a2: cuint; a3: cstring): ptr AG_Window {.importc:"AG_WindowNewNamedS", libag_gui.}
proc AG_WindowNewNamed*(a2: cuint; a3: cstring): ptr AG_Window  {.importc:"AG_WindowNewNamed", varargs, libag_gui.}
proc AG_WindowSetCaptionS*(a2: ptr AG_Window; a3: cstring) {.importc:"AG_WindowSetCaptionS", libag_gui.}
proc AG_WindowSetCaption*(a2: ptr AG_Window; a3: cstring)  {.importc:"AG_WindowSetCaption", varargs, libag_gui.}
proc AG_WindowUpdateCaption*(a2: ptr AG_Window) {.importc:"AG_WindowUpdateCaption", libag_gui.}
proc AG_WindowSetSpacing*(a2: ptr AG_Window; a3: cint) {.importc:"AG_WindowSetSpacing", libag_gui.}
proc AG_WindowSetPadding*(a2: ptr AG_Window; a3: cint; a4: cint; a5: cint; a6: cint) {.importc:"AG_WindowSetPadding", libag_gui.}
proc AG_WindowSetSideBorders*(a2: ptr AG_Window; a3: cint) {.importc:"AG_WindowSetSideBorders", libag_gui.}
proc AG_WindowSetBottomBorder*(a2: ptr AG_Window; a3: cint) {.importc:"AG_WindowSetBottomBorder", libag_gui.}
proc AG_WindowSetPosition*(a2: ptr AG_Window; a3: AG_WindowAlignment; a4: cint) {.importc:"AG_WindowSetPosition", libag_gui.}
proc AG_WindowSetCloseAction*(a2: ptr AG_Window; a3: AG_WindowCloseAction) {.importc:"AG_WindowSetCloseAction", libag_gui.}
proc AG_WindowSetMinSize*(a2: ptr AG_Window; a3: cint; a4: cint) {.importc:"AG_WindowSetMinSize", libag_gui.}
proc AG_WindowSetMinSizePct*(a2: ptr AG_Window; a3: cint) {.importc:"AG_WindowSetMinSizePct", libag_gui.}
proc AG_WindowSetGeometryRect*(a2: ptr AG_Window; a3: AG_Rect; a4: cint): cint {.importc:"AG_WindowSetGeometryRect", libag_gui.}
proc AG_WindowSetGeometryAligned*(a2: ptr AG_Window; a3: AG_WindowAlignment; a4: cint; a5: cint): cint {.importc:"AG_WindowSetGeometryAligned", libag_gui.}
proc AG_WindowSetGeometryAlignedPct*(a2: ptr AG_Window; a3: AG_WindowAlignment; a4: cint; a5: cint): cint {.importc:"AG_WindowSetGeometryAlignedPct", libag_gui.}
proc AG_WindowComputeAlignment*(a2: ptr AG_Window; a3: ptr AG_SizeAlloc) {.importc:"AG_WindowComputeAlignment", libag_gui.}
proc AG_WindowSetOpacity*(a2: ptr AG_Window; a3: cfloat): cint {.importc:"AG_WindowSetOpacity", libag_gui.}
proc AG_WindowSetFadeIn*(a2: ptr AG_Window; a3: cfloat; a4: cfloat) {.importc:"AG_WindowSetFadeIn", libag_gui.}
proc AG_WindowSetFadeOut*(a2: ptr AG_Window; a3: cfloat; a4: cfloat) {.importc:"AG_WindowSetFadeOut", libag_gui.}
proc AG_WindowSetZoom*(a2: ptr AG_Window; a3: cint) {.importc:"AG_WindowSetZoom", libag_gui.}
proc AG_WindowSaveGeometry*(a2: ptr AG_Window) {.importc:"AG_WindowSaveGeometry", libag_gui.}
proc AG_WindowRestoreGeometry*(a2: ptr AG_Window): cint {.importc:"AG_WindowRestoreGeometry", libag_gui.}
proc AG_WindowMaximize*(a2: ptr AG_Window) {.importc:"AG_WindowMaximize", libag_gui.}
proc AG_WindowUnmaximize*(a2: ptr AG_Window) {.importc:"AG_WindowUnmaximize", libag_gui.}
proc AG_WindowMinimize*(a2: ptr AG_Window) {.importc:"AG_WindowMinimize", libag_gui.}
proc AG_WindowUnminimize*(a2: ptr AG_Window) {.importc:"AG_WindowUnminimize", libag_gui.}
proc AG_WindowAttach*(a2: ptr AG_Window; a3: ptr AG_Window) {.importc:"AG_WindowAttach", libag_gui.}
proc AG_WindowDetach*(a2: ptr AG_Window; a3: ptr AG_Window) {.importc:"AG_WindowDetach", libag_gui.}
proc AG_WindowMakeTransient*(a2: ptr AG_Window; a3: ptr AG_Window) {.importc:"AG_WindowMakeTransient", libag_gui.}
proc AG_WindowPin*(a2: ptr AG_Window; a3: ptr AG_Window) {.importc:"AG_WindowPin", libag_gui.}
proc AG_WindowUnpin*(a2: ptr AG_Window) {.importc:"AG_WindowUnpin", libag_gui.}
proc AG_WindowMovePinned*(a2: ptr AG_Window; a3: cint; a4: cint) {.importc:"AG_WindowMovePinned", libag_gui.}
proc AG_WindowShow*(a2: ptr AG_Window) {.importc:"AG_WindowShow", libag_gui.}
proc AG_WindowHide*(a2: ptr AG_Window) {.importc:"AG_WindowHide", libag_gui.}
proc AG_WindowDrawQueued*() {.importc:"AG_WindowDrawQueued", libag_gui.}
proc AG_WindowResize*(a2: ptr AG_Window) {.importc:"AG_WindowResize", libag_gui.}
proc AG_WindowFocus*(a2: ptr AG_Window) {.importc:"AG_WindowFocus", libag_gui.}
proc AG_WindowFocusAtPos*(a2: ptr AG_DriverSw; a3: cint; a4: cint): cint {.importc:"AG_WindowFocusAtPos", libag_gui.}
proc AG_WindowFocusNamed*(a2: cstring): cint {.importc:"AG_WindowFocusNamed", libag_gui.}
proc AG_WindowCycleFocus*(a2: ptr AG_Window; a3: cint) {.importc:"AG_WindowCycleFocus", libag_gui.}
proc AG_WindowDetachGenEv*(a2: ptr AG_Event) {.importc:"AG_WindowDetachGenEv", libag_gui.}
proc AG_WindowHideGenEv*(a2: ptr AG_Event) {.importc:"AG_WindowHideGenEv", libag_gui.}
proc AG_WindowCloseGenEv*(a2: ptr AG_Event) {.importc:"AG_WindowCloseGenEv", libag_gui.}
proc AG_CloseFocusedWindow*() {.importc:"AG_CloseFocusedWindow", libag_gui.}
proc AG_WindowProcessFocusChange*() {.importc:"AG_WindowProcessFocusChange", libag_gui.}
proc AG_WindowProcessShowQueue*() {.importc:"AG_WindowProcessShowQueue", libag_gui.}
proc AG_WindowProcessHideQueue*() {.importc:"AG_WindowProcessHideQueue", libag_gui.}
proc AG_WindowProcessDetachQueue*() {.importc:"AG_WindowProcessDetachQueue", libag_gui.}
proc AG_MapCursor*(a2: pointer; a3: AG_Rect; a4: ptr AG_Cursor): ptr AG_CursorArea {.importc:"AG_MapCursor", libag_gui.}
proc AG_MapStockCursor*(a2: pointer; a3: AG_Rect; a4: cint): ptr AG_CursorArea {.importc:"AG_MapStockCursor", libag_gui.}
proc AG_UnmapCursor*(a2: pointer; a3: ptr AG_CursorArea) {.importc:"AG_UnmapCursor", libag_gui.}
proc AG_UnmapAllCursors*(a2: ptr AG_Window; a3: pointer) {.importc:"AG_UnmapAllCursors", libag_gui.}