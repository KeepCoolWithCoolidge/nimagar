import posix

when defined(windows):
  const LIBAG_CORE = "libag_core.dll"
elif defined(macosx):
  const LIBAG_CORE = "libag_core.dylib"
else:
  const LIBAG_CORE = "libag_core.so(|.0)"

{.pragma: libag_core, cdecl, dynlib: LIBAG_CORE.}

const
  AG_OBJECT_HIER_MAX* = 128
  AG_OBJECT_LIBS_MAX* = 64
  AG_OBJECT_NAME_MAX* = 64
  AG_OBJECT_TYPE_MAX* = 48
  AG_PATHNAME_MAX* = 1024
  AG_TIMER_NAME_MAX* = 16
  AG_STRING_POINTERS_MAX* = 32
  AG_VARIABLE_NAME_MAX* = 24
  AG_EVENT_NAME_MAX* = 32
  AG_EVENT_ARGS_MAX* = 8
  AG_EVENT_ASYNC* = 0x00000001
  AG_EVENT_PROPAGATE* = 0x00000002

type
  AG_ObjectClassSpec* {.bycopy.} = object
    hier*: array[AG_OBJECT_HIER_MAX, char] ##  Inheritance hierarchy
    libs*: array[AG_OBJECT_LIBS_MAX, char] ##  Library list
    spec*: array[AG_OBJECT_HIER_MAX, char] ##  Full class specification
    name*: array[AG_OBJECT_NAME_MAX, char] ##  Short name

  AG_Namespace* {.bycopy.} = object
    name*: cstring             ##  Name string
    pfx*: cstring              ##  Prefix string
    url*: cstring              ##  URL of package

  AG_ByteOrder* = enum
    AG_BYTEORDER_BE,          ##  Big-endian
    AG_BYTEORDER_LE           ##  Little-endian

  AG_VariableType* = enum
    AG_VARIABLE_NULL,         
    AG_VARIABLE_UINT,         
    AG_VARIABLE_P_UINT,       
    AG_VARIABLE_INT,          
    AG_VARIABLE_P_INT,        
    AG_VARIABLE_ULONG,        
    AG_VARIABLE_P_ULONG,      
    AG_VARIABLE_LONG,         
    AG_VARIABLE_P_LONG,       
    AG_VARIABLE_UINT8,        
    AG_VARIABLE_P_UINT8,      
    AG_VARIABLE_SINT8,        
    AG_VARIABLE_P_SINT8,      
    AG_VARIABLE_UINT16,       
    AG_VARIABLE_P_UINT16,     
    AG_VARIABLE_SINT16,       
    AG_VARIABLE_P_SINT16,     
    AG_VARIABLE_UINT32,       
    AG_VARIABLE_P_UINT32,     
    AG_VARIABLE_SINT32,       
    AG_VARIABLE_P_SINT32,     
    AG_VARIABLE_UINT64,       
    AG_VARIABLE_P_UINT64,     
    AG_VARIABLE_SINT64,       
    AG_VARIABLE_P_SINT64,     
    AG_VARIABLE_FLOAT,        
    AG_VARIABLE_P_FLOAT,      
    AG_VARIABLE_DOUBLE,       
    AG_VARIABLE_P_DOUBLE,     
    AG_VARIABLE_LONG_DOUBLE,  
    AG_VARIABLE_P_LONG_DOUBLE, 
    AG_VARIABLE_STRING,       
    AG_VARIABLE_P_STRING,     
    AG_VARIABLE_POINTER,      
    AG_VARIABLE_P_POINTER,    
    AG_VARIABLE_P_FLAG,       
    AG_VARIABLE_P_FLAG8,      
    AG_VARIABLE_P_FLAG16,     
    AG_VARIABLE_P_FLAG32,     
    AG_VARIABLE_P_OBJECT,     
    AG_VARIABLE_P_VARIABLE,   
    AG_VARIABLE_TYPE_LAST
  
  AG_VariableData* {.bycopy.} = object {.union.}
    p*: pointer
    cp: pointer
    s*: cstring
    cs: cstring
    i*: cint
    u*: cuint
    li*: clong
    uli*: culong
    flt*: cfloat
    dbl*: cdouble
    ldbl*: array[16, uint8]
    u8*: uint8
    s8*: int8
    u16*: uint16
    s16*: int16
    u32*: uint32
    s32*: int32
    u64*: uint64
    s64*: int64

  AG_Mutex* = PthreadMutex 
  AG_MutexAttr* = PthreadMutexAttr
  AG_Thread* = Pthread
  AG_Cond* = PthreadCond
  AG_ThreadKey* = PthreadKey

  INNER_C_UNION_156421012* {.bycopy.} = object {.union.}
    bitmask*: uint32           
    size*: csize               
    varName*: cstring          
    objName*: cstring          
  
  AG_Variable* {.bycopy.} = object
    name*: array[AG_VARIABLE_NAME_MAX, char] 
    `type`*: AG_VariableType   
    mutex*: ptr AG_Mutex        
    info*: INNER_C_UNION_156421012
    fn*: AG_Function           
    data*: AG_VariableData    
    varsqe_next*: ptr AG_Variable
    varsqe_prev*: ptr ptr AG_Variable

  AG_Event* {.bycopy.} = object
    name*: array[AG_EVENT_NAME_MAX, char] 
    flags*: cuint
    fn*: AG_Function           
    argc*: cint
    argc0*: cint               
    argv*: array[AG_EVENT_ARGS_MAX, AG_Variable] 
    eventsqe_next*: ptr AG_Event
    eventsqe_prev*: ptr ptr AG_Event
  AG_SeekMode* = enum
    AG_SEEK_SET, AG_SEEK_CUR, AG_SEEK_END

  AG_VoidFn* = proc (a2: ptr AG_Event)
  AG_UintFn* = proc (a2: ptr AG_Event): cuint
  AG_IntFn* = proc (a2: ptr AG_Event): cint
  AG_UlongFn* = proc (a2: ptr AG_Event): culong
  AG_LongFn* = proc (a2: ptr AG_Event): clong
  AG_Uint8Fn* = proc (a2: ptr AG_Event): uint8
  AG_Sint8Fn* = proc (a2: ptr AG_Event): int8
  AG_Uint16Fn* = proc (a2: ptr AG_Event): uint16
  AG_Sint16Fn* = proc (a2: ptr AG_Event): int16
  AG_Uint32Fn* = proc (a2: ptr AG_Event): uint32
  AG_Sint32Fn* = proc (a2: ptr AG_Event): int32
  AG_Uint64Fn* = proc (a2: ptr AG_Event): uint64
  AG_Sint64Fn* = proc (a2: ptr AG_Event): int64
  AG_FloatFn* = proc (a2: ptr AG_Event): cfloat
  AG_DoubleFn* = proc (a2: ptr AG_Event): cdouble
  AG_StringFn* = proc (a2: ptr AG_Event; a3: cstring; a4: csize): csize
  AG_PointerFn* = proc (a2: ptr AG_Event): pointer

  AG_Function* {.bycopy.} = object {.union.}
    fnVoid*: AG_VoidFn
    fnUint*: AG_UintFn
    fnInt*: AG_IntFn
    fnUlong*: AG_UlongFn
    fnLong*: AG_LongFn
    fnUint8*: AG_Uint8Fn
    fnSint8*: AG_Sint8Fn
    fnUint16*: AG_Uint16Fn
    fnSint16*: AG_Sint16Fn
    fnUint32*: AG_Uint32Fn
    fnSint32*: AG_Sint32Fn
    fnUint64*: AG_Uint64Fn
    fnSint64*: AG_Sint64Fn
    fnFloat*: AG_FloatFn
    fnDouble*: AG_DoubleFn
    fnString*: AG_StringFn
    fnPointer*: AG_PointerFn

  AG_DataSource* {.bycopy.} = object
    lock*: AG_Mutex            ##  Lock on all operations
    debug*: cint
    errorFn*: ptr AG_Event      ##  Exception handler
    byte_order*: AG_ByteOrder ##  Byte order of source
    wrLast*: csize             ##  Last write count (bytes)
    rdLast*: csize             ##  Last read count (bytes)
    wrTotal*: csize            ##  Total write count (bytes)
    rdTotal*: csize            ##  Total read count (bytes)
    read*: proc (a2: ptr AG_DataSource; a3: pointer; a4: csize; a5: ptr csize): cint
    read_at*: proc (a2: ptr AG_DataSource; a3: pointer; a4: csize; a5: Off;
                  a6: ptr csize): cint
    write*: proc (a2: ptr AG_DataSource; a3: pointer; a4: csize; a5: ptr csize): cint
    write_at*: proc (a2: ptr AG_DataSource; a3: pointer; a4: csize; a5: Off;
                   a6: ptr csize): cint
    tell*: proc (a2: ptr AG_DataSource): Off
    seek*: proc (a2: ptr AG_DataSource; a3: Off; a4: AG_SeekMode): cint
    close*: proc (a2: ptr AG_DataSource)

  AG_Version* {.bycopy.} = object
    major*: uint32
    minor*: uint32

  AG_ObjectInitFn* = proc (a2: pointer)
  AG_ObjectResetFn* = proc (a2: pointer)
  AG_ObjectDestroyFn* = proc (a2: pointer)
  AG_ObjectLoadFn* = proc (a2: pointer; a3: ptr AG_DataSource; a4: ptr AG_Version): cint
  AG_ObjectSaveFn* = proc (a2: pointer; a3: ptr AG_DataSource): cint
  AG_ObjectEditFn* = proc (a2: pointer): pointer

type
  AG_ObjectClass* {.bycopy.} = object
    hier*: array[AG_OBJECT_HIER_MAX, char] ##  Inheritance hierarchy
    size*: csize               ##  Structure size
    ver*: AG_Version           ##  Data version
    init*: AG_ObjectInitFn     ##  Initialization routine
    reset*: AG_ObjectResetFn   ##  Reset state for load
    destroy*: AG_ObjectDestroyFn ##  Release data
    load*: AG_ObjectLoadFn     ##  Deserialize
    save*: AG_ObjectSaveFn     ##  Serialize
    edit*: AG_ObjectEditFn     ##  User-defined edit callback
    name*: array[AG_OBJECT_TYPE_MAX, char] ##  Short name of this class
    super*: ptr AG_ObjectClass ##  Direct superclass
    libs*: array[AG_OBJECT_LIBS_MAX, char] ##  List of required modules
    subqh_first*: ptr AG_ObjectClass
    subqh_last*: ptr ptr AG_ObjectClass
    subclassesqe_next*: ptr AG_ObjectClass
    subclassesqe_prev*: ptr ptr AG_ObjectClass 
  
type
  ArchitectureExtension* {.size: sizeof(cuint), pure.} = enum
    AG_EXT_CPUID = 0x00000001
    AG_EXT_MMX = 0x00000002
    AG_EXT_MMX_EXT = 0x00000004
    AG_EXT_3DNOW = 0x00000008
    AG_EXT_3DNOW_EXT = 0x00000010
    AG_EXT_ALTIVEC = 0x00000020
    AG_EXT_SSE = 0x00000040
    AG_EXT_SSE2 = 0x00000080
    AG_EXT_SSE3 = 0x00000100
    AG_EXT_LONG_MODE = 0x00000200
    AG_EXT_RDTSCP = 0x00000400
    AG_EXT_FXSR = 0x00000800
    AG_EXT_PAGE_NX = 0x00001000
    AG_EXT_SSE5A = 0x00002000
    AG_EXT_3DNOW_PREFETCH = 0x00004000
    AG_EXT_SSE_MISALIGNED = 0x00008000
    AG_EXT_SSE4A = 0x00010000
    AG_EXT_ONCHIP_FPU = 0x00020000
    AG_EXT_TSC = 0x00040000
    AG_EXT_CMOV = 0x00080000
    AG_EXT_CLFLUSH = 0x00100000
    AG_EXT_HTT = 0x00200000
    AG_EXT_MON = 0x00400000
    AG_EXT_VMX = 0x00800000
    AG_EXT_SSSE3 = 0x01000000
    AG_EXT_SSE41 = 0x02000000
    AG_EXT_SSE42 = 0x04000000

type
  AG_CPUInfo* {.bycopy.} = object
    arch*: cstring             ##  Architecture name
    vendorID*: array[13, char]  ##  CPU Vendor ID string
    ext*: ArchitectureExtension               ##  Architecture extensions (relevant to user-mode)

type
  AG_DataSourceType* = enum
    AG_SOURCE_UINT8 = 0x41470001, AG_SOURCE_SINT8 = 0x41470002,
    AG_SOURCE_UINT16 = 0x41470003, AG_SOURCE_SINT16 = 0x41470004,
    AG_SOURCE_UINT32 = 0x41470005, AG_SOURCE_SINT32 = 0x41470006,
    AG_SOURCE_UINT64 = 0x41470007, AG_SOURCE_SINT64 = 0x41470008,
    AG_SOURCE_FLOAT = 0x41470009, AG_SOURCE_DOUBLE = 0x4147000A,
    AG_SOURCE_LONG_DOUBLE = 0x4147000B, AG_SOURCE_STRING = 0x4147000C,
    AG_SOURCE_COLOR_RGBA = 0x4147000D, AG_SOURCE_STRING_PAD = 0x4147000E

type
  AG_FileSource* {.bycopy.} = object
    ds*: AG_DataSource
    path*: cstring             ##  Open file path (or NULL)
    file*: ptr FILE             ##  Opened file

type
  AG_CoreSource* {.bycopy.} = object
    ds*: AG_DataSource
    data*: ptr uint8            ##  Pointer to data
    size*: csize               ##  Current size
    offs*: Off               ##  Current position
  
type
  AG_ConstCoreSource* {.bycopy.} = object
    ds*: AG_DataSource
    data*: ptr uint8            ##  Pointer to data
    size*: csize               ##  Current size
    offs*: Off               ##  Current position

type
  AG_Dbt* {.bycopy.} = object
    data*: pointer
    size*: csize

  AG_DbIterateFn* = proc (key: ptr AG_Dbt; val: ptr AG_Dbt; arg: pointer): cint
  ag_db_key_mode* = enum
    AG_DB_KEY_DATA,           ##  Variable-length data
    AG_DB_KEY_NUMBER,         ##  Logical record number
    AG_DB_KEY_STRING          ##  Legal C string


type
  ag_db_record_mode* = enum
    AG_DB_REC_VARIABLE,       ##  Variable-length records
    AG_DB_REC_FIXED           ##  Fixed-length records


type
  AG_DbClass* {.bycopy.} = object
    inherit*: AG_ObjectClass
    name*: cstring             ##  Database method name
    descr*: cstring            ##  Short description
    keyMode*: ag_db_key_mode
    recMode*: ag_db_record_mode
    open*: proc (a2: pointer; a3: cstring; a4: cuint): cint
    close*: proc (a2: pointer)
    sync*: proc (a2: pointer): cint
    exists*: proc (a2: pointer; a3: ptr AG_Dbt): cint
    get*: proc (a2: pointer; a3: ptr AG_Dbt; a4: ptr AG_Dbt): cint
    put*: proc (a2: pointer; a3: ptr AG_Dbt; a4: ptr AG_Dbt): cint
    del*: proc (a2: pointer; a3: ptr AG_Dbt): cint
    iterate*: proc (a2: pointer; a3: AG_DbIterateFn; a4: pointer): cint

const
  AG_DB_OPEN_C* = 0x00000001
  AG_DB_READONLY* = 0x00000002

type
  AG_Dir* {.bycopy.} = object
    ents*: cstringArray
    nents*: cint

const
  AG_DSONAME_MAX* = 128

type
  AG_DSOSym* {.bycopy.} = object
    sym*: cstring
    p*: pointer                
    symsqe_next*: ptr AG_DSOSym
    symseq_prev*: ptr ptr AG_DSOSym
  
  AG_DSO* {.bycopy.} = object
    name*: array[AG_DSONAME_MAX, char] 
    path*: array[AG_PATHNAME_MAX, char] 
    refCount*: cuint            
    flags*: cuint 
    symsqh_first*: ptr AG_DSOSym
    symsqh_last*: ptr ptr AG_DSOSym
    dsosqe_next*: ptr AG_DSO
    dsosqe_prev*: ptr ptr AG_DSO  

  AG_DSOQ* {.bycopy.} = object
    ag_dsoqh_first*: ptr AG_DSO
    ag_dsoqh_last*: ptr ptr AG_DSO

type
  AG_ErrorCode* = enum
    AG_EUNDEFINED,            
    AG_EPERM,                 
    AG_ENOENT,                
    AG_EINTR,                 
    AG_EIO,                   
    AG_E2BIG,                 
    AG_EACCESS,               
    AG_EBUSY,                 
    AG_EEXIST,                
    AG_ENOTDIR,               
    AG_EISDIR,                
    AG_EMFILE,                
    AG_EFBIG,                 
    AG_ENOSPC,                
    AG_EROFS,                 
    AG_EAGAIN                 

type
  ag_event_sink_type* = enum
    AG_SINK_NONE, AG_SINK_PROLOGUE, 
    AG_SINK_EPILOGUE,         
    AG_SINK_SPINNER,          
    AG_SINK_TERMINATOR,       
    AG_SINK_TIMER,            
    AG_SINK_READ,             
    AG_SINK_WRITE,            
    AG_SINK_FSEVENT,          
    AG_SINK_PROCEVENT,        
    AG_SINK_LAST

const
  AG_FSEVENT_DELETE* = 0x00000001
  AG_FSEVENT_WRITE* = 0x00000002
  AG_FSEVENT_EXTEND* = 0x00000004
  AG_FSEVENT_ATTRIB* = 0x00000008
  AG_FSEVENT_LINK* = 0x00000010
  AG_FSEVENT_RENAME* = 0x00000020
  AG_FSEVENT_REVOKE* = 0x00000040
  AG_PROCEVENT_EXIT* = 0x00001000
  AG_PROCEVENT_FORK* = 0x00002000
  AG_PROCEVENT_EXEC* = 0x00004000

type
  AG_EventSinkFn* = proc (a2: ptr AG_EventSink; a3: ptr AG_Event): cint

  AG_EventSink* {.bycopy.} = object
    sink_type*: ag_event_sink_type 
    ident*: cint               
    flags*: cuint
    flagsMatched*: cuint
    fn*: AG_EventSinkFn        
    fnArgs*: AG_Event          
    sinksqe_next*: ptr AG_Event
    sinksqe_prev*: ptr ptr AG_Event

type
  AG_Timer_Pvt* {.bycopy.} = object
    timersqe_next*: ptr AG_Timer
    timersqe_prev*: ptr ptr AG_Timer
    changeqe_next*: ptr AG_Timer
    changeqe_prev*: ptr ptr AG_Timer

  AG_Timer* {.bycopy.} = object
    id*: cint                  
    obj*: pointer              
    flags*: cuint
    tSched*: uint32            
    ival*: uint32              
    fn*: proc (a2: ptr AG_Timer; a3: ptr AG_Event): uint32
    fnEvent*: AG_Event
    name*: array[AG_TIMER_NAME_MAX, char] 
    pvt*: AG_TimerPvt          
  
  AG_TimerFn* = proc (a2: ptr AG_Timer; a3: ptr AG_Event): uint32

  AG_TimeOps* {.bycopy.} = object
    name*: cstring
    init*: proc ()
    destroy*: proc ()
    getTicks*: proc (): uint32
    delay*: proc (a2: uint32)
  AG_EventSource* {.bycopy.} = object
    caps*: array[AG_SINK_LAST, cint] 
    flags*: cuint
    breakReq*: cint            
    returnCode*: cint          
    sinkFn*: proc (): cint
    addTimerFn*: proc (a2: ptr AG_Timer; a3: uint32; a4: cint): cint
    delTimerFn*: proc (a2: ptr AG_Timer)
    resetTimerFn*: proc (a2: ptr AG_Timer; a3: uint32; a4: cint): cint 
    prologuesqh_first*: ptr AG_EventSink
    prologuesqh_last*: ptr ptr AG_EventSink
    epiloguesqh_first*: ptr AG_EventSink
    epiloguesqh_last*: ptr ptr AG_EventSink
    spinnersqh_first*: ptr AG_EventSink
    spinnersqh_last*: ptr ptr AG_EventSink
    sinksqh_first*: ptr AG_EventSink
    sinksqh_last*: ptr ptr AG_EventSink

type
  AG_EventQ* {.bycopy.} = object
    nEvents*: cuint
    events*: ptr AG_Event

  AG_EventFn* = proc (a2: ptr AG_Event)

type
  ag_exec_wait_type* = enum
    AG_EXEC_WAIT_IMMEDIATE, AG_EXEC_WAIT_INFINITE

type
  ag_file_info_type* = enum
    AG_FILE_REGULAR, AG_FILE_DIRECTORY, AG_FILE_DEVICE, AG_FILE_FIFO,
    AG_FILE_SYMLINK, AG_FILE_SOCKET

type
  FileInfoPermissions* {.size: sizeof(cuint), pure.} = enum
    AG_FILE_READABLE = 0x00000001,
    AG_FILE_WRITEABLE = 0x00000002,
    AG_FILE_EXECUTABLE = 0x00000004
  
  FileInfoFlags* {.size: sizeof(cuint), pure.} = enum
    AG_FILE_SUID = 0x00000001,
    AG_FILE_SGID = 0x00000002,
    AG_FILE_ARCHIVE = 0x00000004,
    AG_FILE_HIDDEN = 0x00000020,
    AG_FILE_TEMPORARY = 0x00000100,
    AG_FILE_SYSTEM = 0x00000200

type
  AG_FileInfo* {.bycopy.} = object
    file_info_type*: ag_file_info_type
    perms*: FileInfoPermissions
    flags*: FileInfoFlags

  AG_FileExtMapping* {.bycopy.} = object
    ext*: cstring              
    descr*: cstring            
    cls*: pointer              
    editDirect*: cint          

type
  AG_List* {.bycopy.} = object
    n*: cint                   
    v*: ptr AG_Variable         

type
  ag_net_addr_family* = enum
    AG_NET_AF_NONE,           
    AG_NET_LOCAL,             
    AG_NET_INET4,             
    AG_NET_INET6              

type
  ag_net_socket_type* = enum
    AG_NET_SOCKET_NONE,       
    AG_NET_STREAM,            
    AG_NET_DGRAM,             
    AG_NET_RAW,               
    AG_NET_RDM,               
    AG_NET_SEQPACKET          

type
  AG_NetSocketOption* = enum
    AG_NET_SO_NONE,           
    AG_NET_DEBUG,             
    AG_NET_REUSEADDR,         
    AG_NET_KEEPALIVE,         
    AG_NET_DONTROUTE,         
    AG_NET_BROADCAST,         
    AG_NET_BINDANY,           
    AG_NET_SNDBUF,            
    AG_NET_RCVBUF,            
    AG_NET_SNDLOWAT,          
    AG_NET_RCVLOWAT,          
    AG_NET_SNDTIMEO,          
    AG_NET_RCVTIMEO,          
    AG_NET_BACKLOG,                          
    AG_NET_OOBINLINE,         
    AG_NET_REUSEPORT,         
    AG_NET_TIMESTAMP,         
    AG_NET_NOSIGPIPE,         
    AG_NET_LINGER,            
    AG_NET_ACCEPTFILTER_E,      
    AG_NET_LAST

type
  AG_NetAcceptFilter* {.bycopy.} = object
    name*: array[16, char]      
    arg*: array[240, char]      

const
  AG_NET_ADDRCONFIG* = 0x00000001
  AG_NET_NUMERIC_HOST* = 0x00000002
  AG_NET_NUMERIC_PORT* = 0x00000002

type
  INNER_C_UNION_3794802373* {.bycopy.} = object {.union.}
    local*: cstring
    inet4*: uint32
    inet6*: array[16, uint8]

  AG_NetAddr* {.bycopy.} = object
    family*: ag_net_addr_family 
    port*: cint                
    data*: INNER_C_UNION_3794802373
    sNum*: cstring             
    sName*: cstring
    addrsqe_next*: ptr AG_NetAddr
    addrsqe_prev*: ptr ptr AG_NetAddr

  AG_NetAddrList* {.bycopy.} = object
    listqh_first*: ptr AG_NetAddr
    listqh_last*: ptr ptr AG_NetAddr

const
  AG_NET_SOCKET_BOUND* = 0x00000001
  AG_NET_SOCKET_CONNECTED* = 0x00000002

const
  AG_NET_POLL_READ* = 0x00000001
  AG_NET_POLL_WRITE* = 0x00000002
  AG_NET_POLL_EXCEPTIONS* = 0x00000004

type
  AG_NetSocket* {.bycopy.} = object
    family*: ag_net_addr_family 
    socket_type*: ag_net_socket_type 
    proto*: cint               
    lock*: AG_Mutex
    flags*: cuint
    poll*: cuint
    addrLocal*: ptr AG_NetAddr  
    addrRemote*: ptr AG_NetAddr 
    fd*: cint                  
    listenBacklog*: cint       
    p*: pointer 
    socketsqe_next*: ptr AG_NetSocket
    socketsqe_prev*: ptr ptr AG_NetSocket
    readqe_next*: ptr AG_NetSocket  
    readqe_prev*: ptr ptr AG_NetSocket 
    writeqe_next*: ptr AG_NetSocket  
    writeqe_prev*: ptr ptr AG_NetSocket
    exceptqe_next*: ptr AG_NetSocket  
    exceptqe_prev*: ptr ptr AG_NetSocket

when not defined(windows):
  type
    AG_ProcessID* {.bycopy.} = Pid
else:
  type
    AG_ProcessID* {.bycopy.} = int

type
  AG_NetSocketSource* {.bycopy.} = object
    ds*: AG_DataSource
    sock*: ptr AG_NetSocket    ##  Network socket
  
  AG_NetSocketSet* {.bycopy.} = object
    ag_net_socketqh_first*: ptr AG_NetSocket
    ag_net_socketqh_last*: ptr ptr AG_NetSocket
  
  AG_NetOps* {.bycopy.} = object
    name*: cstring
    init*: proc (): cint
    destroy*: proc ()
    getIfConfig*: proc (a2: ptr AG_NetAddrList): cint
    resolve*: proc (a2: ptr AG_NetAddrList; a3: cstring; a4: cstring; a5: cuint): cint
    getAddrNumerical*: proc (a2: ptr AG_NetAddr): cstring
    initSocket*: proc (a2: ptr AG_NetSocket): cint
    destroySocket*: proc (a2: ptr AG_NetSocket)
    connect*: proc (a2: ptr AG_NetSocket; a3: ptr AG_NetAddr): cint
    `bind`*: proc (a2: ptr AG_NetSocket; a3: ptr AG_NetAddr): cint
    getOption*: proc (a2: ptr AG_NetSocket; a3: AG_NetSocketOption; a4: pointer): cint
    setOption*: proc (a2: ptr AG_NetSocket; a3: AG_NetSocketOption; a4: pointer): cint
    poll*: proc (a2: ptr AG_NetSocketSet; a3: ptr AG_NetSocketSet;
               a4: ptr AG_NetSocketSet; a5: ptr AG_NetSocketSet; a6: uint32): cint
    accept*: proc (a2: ptr AG_NetSocket): ptr AG_NetSocket
    read*: proc (a2: ptr AG_NetSocket; a3: pointer; a4: csize; a5: ptr csize): cint
    write*: proc (a2: ptr AG_NetSocket; a3: pointer; a4: csize; a5: ptr csize): cint
    close*: proc (a2: ptr AG_NetSocket)
  
const
  AG_OBJECT_FLOATING_VARS* = 0x00000001
  AG_OBJECT_NON_PERSISTENT* = 0x00000002
  AG_OBJECT_INDESTRUCTIBLE* = 0x00000004
  AG_OBJECT_RESIDENT* = 0x00000008
  AG_OBJECT_PRESERVE_DEPS* = 0x00000010
  AG_OBJECT_STATIC* = 0x00000020
  AG_OBJECT_READONLY* = 0x00000040
  AG_OBJECT_WAS_RESIDENT* = 0x00000080
  AG_OBJECT_REOPEN_ONLOAD* = 0x00000200
  AG_OBJECT_REMAIN_DATA* = 0x00000400
  AG_OBJECT_DEBUG* = 0x00000800
  AG_OBJECT_NAME_ONATTACH* = 0x00001000
  AG_OBJECT_CHLD_AUTOSAVE* = 0x00002000
  AG_OBJECT_DEBUG_DATA* = 0x00004000
  AG_OBJECT_INATTACH* = 0x00008000
  AG_OBJECT_INDETACH* = 0x00010000
  AG_OBJECT_BOUND_EVENTS* = 0x00020000
  AG_OBJECT_SAVED_FLAGS* = (AG_OBJECT_FLOATING_VARS or AG_OBJECT_INDESTRUCTIBLE or
      AG_OBJECT_PRESERVE_DEPS or AG_OBJECT_READONLY or AG_OBJECT_REOPEN_ONLOAD or
      AG_OBJECT_REMAIN_DATA or AG_OBJECT_DEBUG or AG_OBJECT_BOUND_EVENTS)

type
  AG_Object* {.bycopy.} = object
    name*: array[AG_OBJECT_NAME_MAX, char] 
    archivePath*: cstring      
    save_pfx*: cstring         
    cls*: ptr AG_ObjectClass    
    flags*: cuint 
    eventsqh_first*: ptr AG_Object
    eventsqh_last*: ptr ptr AG_Object
    timersqh_first*: ptr AG_Timer
    timersqh_last*: ptr ptr AG_Timer
    varsqh_first*: ptr AG_Variable
    varsqh_last*: ptr ptr AG_Variable
    depsqh_first*: ptr AG_ObjectDep
    depsqh_last*: ptr ptr AG_ObjectDep
    children*: AG_ObjectQ      
    cobsqe_next*: ptr AG_Object
    cobsqe_prev*: ptr ptr AG_Object
    parent*: pointer           
    root*: pointer             
    attachFn*: ptr AG_Event 
    tobjsqe_next*: ptr AG_Object
    tobjsqe_prev*: ptr ptr AG_Object
    detachFn*: ptr AG_Event     
    lock*: AG_Mutex 

  AG_ObjectQ* {.bycopy.} = object
    ag_objectqh_first*: ptr AG_Object
    ag_objectqh_last*: ptr ptr AG_Object

  AG_ObjectDep* {.bycopy.} = object
    persistent*: cint          
    path*: cstring             
    obj*: ptr AG_Object         
    count*: uint32             
    depsqe_next*: ptr AG_ObjectDep
    depsqe_prev*: ptr ptr AG_ObjectDep

  AG_Db* {.bycopy.} = object
    inherit*: AG_Object
    flags*: cuint

  AG_DbObject* {.bycopy.} = object
    obj*: AG_Object

  AG_ObjectHeader* {.bycopy.} = object
    cs*: AG_ObjectClassSpec    
    dataOffs*: uint32          
    ver*: AG_Version           
    flags*: cuint              

  AG_FmtString* {.bycopy.} = object
    s*: cstring                
    p*: array[AG_STRING_POINTERS_MAX, pointer] 
    mu*: array[AG_STRING_POINTERS_MAX, ptr AG_Mutex] 
    n*: cuint
    curArg*: cint              

  AG_FmtStringExtFn* = proc (a2: ptr AG_FmtString; a3: cstring; a4: csize): csize
  AG_FmtStringExt* {.bycopy.} = object
    fmt*: cstring
    fmtLen*: csize
    fn*: AG_FmtStringExtFn

const
  AG_TBL_DUPLICATES* = 0x00000001

type
  AG_TblBucket* {.bycopy.} = object
    keys*: cstringArray
    ents*: ptr AG_Variable
    nEnts*: cuint
  AG_Tbl* {.bycopy.} = object
    flags*: cuint
    buckets*: ptr AG_TblBucket  
    nBuckets*: cuint            
  AG_Language* = enum
    AG_LANG_NONE,             
    AG_LANG_AA,               
    AG_LANG_AB,               
    AG_LANG_AF,               
    AG_LANG_AM,               
    AG_LANG_AR,               
    AG_LANG_AS,               
    AG_LANG_AY,               
    AG_LANG_AZ,               
    AG_LANG_BA,               
    AG_LANG_BE,               
    AG_LANG_BG,               
    AG_LANG_BH,               
    AG_LANG_BI,               
    AG_LANG_BN,               
    AG_LANG_BO,               
    AG_LANG_BR,               
    AG_LANG_CA,               
    AG_LANG_CO,               
    AG_LANG_CS,               
    AG_LANG_CY,               
    AG_LANG_DA,               
    AG_LANG_DE,               
    AG_LANG_DZ,               
    AG_LANG_EL,               
    AG_LANG_EN,               
    AG_LANG_EO,               
    AG_LANG_ES,               
    AG_LANG_ET,               
    AG_LANG_EU,               
    AG_LANG_FA,               
    AG_LANG_FI,               
    AG_LANG_FJ,               
    AG_LANG_FO,               
    AG_LANG_FR,               
    AG_LANG_FY,               
    AG_LANG_GA,               
    AG_LANG_GD,               
    AG_LANG_GL,               
    AG_LANG_GN,               
    AG_LANG_GU,               
    AG_LANG_HA,               
    AG_LANG_HE,               
    AG_LANG_HI,               
    AG_LANG_HR,               
    AG_LANG_HU,               
    AG_LANG_HY,               
    AG_LANG_IA,               
    AG_LANG_ID,               
    AG_LANG_IE,               
    AG_LANG_IK,               
    AG_LANG_IS,               
    AG_LANG_IT,               
    AG_LANG_IU,               
    AG_LANG_JA,               
    AG_LANG_JW,               
    AG_LANG_KA,               
    AG_LANG_KK,               
    AG_LANG_KL,               
    AG_LANG_KM,               
    AG_LANG_KN,               
    AG_LANG_KO,               
    AG_LANG_KS,               
    AG_LANG_KU,               
    AG_LANG_KY,               
    AG_LANG_LA,               
    AG_LANG_LN,               
    AG_LANG_LO,               
    AG_LANG_LT,               
    AG_LANG_LV,               
    AG_LANG_MG,               
    AG_LANG_MI,               
    AG_LANG_MK,               
    AG_LANG_ML,               
    AG_LANG_MN,               
    AG_LANG_MO,               
    AG_LANG_MR,               
    AG_LANG_MS,               
    AG_LANG_MT,               
    AG_LANG_MY,               
    AG_LANG_NA,               
    AG_LANG_NE,               
    AG_LANG_NL,               
    AG_LANG_NO,               
    AG_LANG_OC,               
    AG_LANG_OM,               
    AG_LANG_OR,               
    AG_LANG_PA,               
    AG_LANG_PL,               
    AG_LANG_PS,               
    AG_LANG_PT,               
    AG_LANG_QU,               
    AG_LANG_RM,               
    AG_LANG_RN,               
    AG_LANG_RO,               
    AG_LANG_RU,               
    AG_LANG_RW,               
    AG_LANG_SA,               
    AG_LANG_SD,               
    AG_LANG_SG,               
    AG_LANG_SH,               
    AG_LANG_SI,               
    AG_LANG_SK,               
    AG_LANG_SL,               
    AG_LANG_SM,               
    AG_LANG_SN,               
    AG_LANG_SO,               
    AG_LANG_SQ,               
    AG_LANG_SR,               
    AG_LANG_SS,               
    AG_LANG_ST,               
    AG_LANG_SU,               
    AG_LANG_SV,               
    AG_LANG_SW,               
    AG_LANG_TA,               
    AG_LANG_TE,               
    AG_LANG_TG,               
    AG_LANG_TH,               
    AG_LANG_TI,               
    AG_LANG_TK,               
    AG_LANG_TL,               
    AG_LANG_TN,               
    AG_LANG_TO,               
    AG_LANG_TR,               
    AG_LANG_TS,               
    AG_LANG_TT,               
    AG_LANG_TW,               
    AG_LANG_UG,               
    AG_LANG_UK,               
    AG_LANG_UR,               
    AG_LANG_UZ,               
    AG_LANG_VI,               
    AG_LANG_VO,               
    AG_LANG_WO,               
    AG_LANG_XH,               
    AG_LANG_YI,               
    AG_LANG_YO,               
    AG_LANG_ZA,               
    AG_LANG_ZH,               
    AG_LANG_ZU,               
    AG_LANG_LAST
  AG_TextEnt* {.bycopy.} = object
    buf*: cstring              
    maxLen*: csize             
    len*: csize                

const
  AG_TEXT_SAVED_FLAGS* = 0

type
  AG_Text* {.bycopy.} = object
    lock*: AG_Mutex
    ent*: array[AG_LANG_LAST, AG_TextEnt] 
    lang*: AG_Language         
    maxLen*: csize             
    flags*: cuint
  AG_TextElement* {.bycopy.} = object
    lock*: AG_Mutex
    ent*: array[AG_LANG_LAST, AG_TextEnt] 
    lang*: AG_Language         
    maxLen*: csize             
    flags*: cuint

const
  AG_TIMER_SURVIVE_DETACH* = 0x00000001
  AG_TIMER_AUTO_FREE* = 0x00000002
  AG_TIMER_EXECD* = 0x00000004
  AG_TIMER_RESTART* = 0x00000008

type
  AG_TreeItem* {.bycopy.} = object
    p*: pointer                
    privData*: pointer         
    privDataSize*: csize       
    chldItems*: AG_TreeItemQ #  Child items
    treeqe_next*: ptr AG_TreeItem
    treeqe_prev*: ptr ptr AG_TreeItem
    listqe_next*: ptr AG_TreeItem
    listqe_prev*: ptr ptr AG_TreeItem
    parentTree*: ptr AG_Tree    
    parentItem*: ptr AG_TreeItem 
  
  AG_TreeItemQ* {.bycopy.} = object
    itemsqh_first*: ptr AG_TreeItem
    itemsqh_last*: ptr ptr AG_TreeItem

  AG_Tree* {.bycopy.} = object
    root*: ptr AG_TreeItem
    list*: AG_TreeItemQ

const
  AG_USER_NO_ACCOUNT* = 0x00000001
  AG_USER_NAME_MAX* = 73

type
  AG_User* {.bycopy.} = object
    name*: array[AG_USER_NAME_MAX, char] 
    flags*: cuint
    passwd*: cstring           
    uid*: uint32               
    gid*: uint32               
    loginClass*: cstring       
    gecos*: cstring            
    home*: cstring             
    shell*: cstring            
    tmp*: cstring
    usersqe_next*: ptr AG_User
    usersqe_prev*: ptr ptr AG_User
  AG_UserList* {.bycopy.} = object
    userqh_first*: ptr AG_User
    userqh_last*: ptr ptr AG_User
  AG_UserOps* {.bycopy.} = object
    name*: cstring
    init*: proc ()
    destroy*: proc ()
    getUserByName*: proc (a2: ptr AG_User; a3: cstring): cint
    getUserByUID*: proc (a2: ptr AG_User; a3: uint32): cint
    getRealUser*: proc (a2: ptr AG_User): cint
    getEffectiveUser*: proc (a2: ptr AG_User): cint
  AG_VariableTypeInfo* {.bycopy.} = object
    variable_type*: AG_VariableType  
    indirLvl*: cint            
    name*: cstring             
    typeTgt*: AG_VariableType 
    code*: int32              
    size*: csize               
  AG_AgarVersion* {.bycopy.} = object
    major*: cint
    minor*: cint
    patch*: cint
    release*: cstring

when defined(ag_web):
  const
    WEB_COMPAT_APACHE* = true     

  const
    HAVE_SETPROCTITLE* = true
    WEB_FRONTEND_RDBUFSIZE* = 16384
    WEB_DATA_BUFSIZE* = 65536
    WEB_DATA_COMPRESS_MIN* = 8192
    WEB_DATA_COMPRESS_LVL* = 6
    WEB_FORMDATA_MAX* = (8 * 1024 * 1024) 
    WEB_HTTP_REQ_TIMEOUT* = 30
    WEB_WORKER_RESP_TIMEOUT* = 15
    WEB_EVENT_READ_TIMEOUT* = 10
    WEB_EVENT_INACT_TIMEOUT* = 3600
    WEB_EVENT_MAXRETRY* = 10
    WEB_EVENT_PING_IVAL* = 15
    WEB_HTTP_HEADER_MIN* = 14
    WEB_HTTP_PER_HEADER_MAX* = 256
    WEB_HTTP_HEADER_MAX* = 1024
    WEB_HTTP_MAXHEADERS* = 32
    WEB_QUERY_MAX* = 4096
    WEB_MAXHTTPSOCKETS* = 5
    WEB_MAXWORKERSOCKETS* = 30
    WEB_MAX_ARGS* = 256
    WEB_MAX_COOKIES* = 32
    WEB_ARG_KEY_MAX* = 64
    WEB_ARG_LENGTH_MAX* = 100000000
    WEB_LANGS_MAX* = 64
    WEB_LANG_CODE_MAX* = 6
    WEB_URL_MAX* = 768
    WEB_ERROR_MAX* = 1024
    WEB_USERAGENT_MAX* = 512
    WEB_EVENT_MAX* = 4096
    WEB_RANGE_STRING_MAX* = 32
    WEB_RANGE_MAXRANGES* = 8
    WEB_OPNAME_MAX* = 32
    WEB_USERNAME_MAX* = 64
    WEB_PASSWORD_MAX* = 128
    WEB_EMAIL_MAX* = 128
    WEB_INT_RANGE_MAX* = 21
    WEB_HELP_TOPIC_MAX* = 80
    WEB_SESSID_MAX* = 11
    WEB_SESSION_VAR_KEY_MAX* = 32
    WEB_SESSION_VAR_VALUE_MAX* = 1024
    WEB_SESSION_VARIABLES_MAX* = 100
    WEB_SESSION_DATA_MAX* = 4096
    WEB_SESSION_DATA_MAGIC* = 0x50657243
    WEB_COOKIE_NAME_MAX* = 48
    WEB_COOKIE_VALUE_MAX* = 3807
    WEB_COOKIE_EXPIRE_MAX* = 64
    WEB_COOKIE_DOMAIN_MAX* = 48
    WEB_COOKIE_PATH_MAX* = 128
    WEB_COOKIE_SET_MAX* = 128
    WEB_VAR_NAME_MAX* = 32
    WEB_VAR_BUF_INIT* = 128
    WEB_VAR_BUF_GROW* = 1024

  when not defined(WEB_GLYPHICON):
    template WEB_GLYPHICON*(x: untyped): untyped =
      "<span class=\'glyphicons glyphicons-"

  type
    WEB_Method* = enum
      WEB_METHOD_GET, WEB_METHOD_HEAD, WEB_METHOD_POST, WEB_METHOD_OPTIONS,
      WEB_METHOD_PUT, WEB_METHOD_DELETE, WEB_METHOD_TRACE, WEB_METHOD_CONNECT,
      WEB_METHOD_LAST

  type
    WEB_Variable* {.bycopy.} = object
      key*: array[WEB_VAR_NAME_MAX, char] 
      value*: cstring            
      len*: csize                
      bufSize*: csize            
      global*: cint
      varsqe_next*: ptr WEB_Variable
      varsqe_prev*: ptr ptr WEB_Variable

    WEB_VariableQ* {.bycopy.} = object
      varqh_first*: ptr WEB_Variable
      varqh_last*: ptr ptr WEB_Variable

  type
    WEB_ArgumentType* = enum
      WEB_GET_ARGUMENT,         
      WEB_POST_ARGUMENT,        
      WEB_ARGUMENT_LAST

  type
    WEB_Argument* {.bycopy.} = object
      web_type*: WEB_ArgumentType
      key*: array[WEB_ARG_KEY_MAX, char] 
      value*: cstring            
      len*: csize                
      contentType*: array[32, char] 
      argsqe_next*: ptr WEB_Argument
      argsqe_prev*: ptr ptr WEB_Argument  

  const
    WEB_COOKIE_SECURE* = 0x00000001

  type
    WEB_Cookie* {.bycopy.} = object
      name*: array[WEB_COOKIE_NAME_MAX, char] 
      
      value*: array[WEB_COOKIE_VALUE_MAX, char] 
                                            
      expires*: array[WEB_COOKIE_EXPIRE_MAX, char] 
      domain*: array[WEB_COOKIE_DOMAIN_MAX, char] 
      path*: array[WEB_COOKIE_PATH_MAX, char] 
      flags*: cuint
      cookiesqe_next*: ptr WEB_Cookie
      cookiesqe_prev*: ptr ptr WEB_Cookie  



  type
    WEB_RangeReq* {.bycopy.} = object
      first*: array[WEB_RANGE_MAXRANGES, csize] 
      last*: array[WEB_RANGE_MAXRANGES, csize] 
      nRanges*: cuint

  const
    WEB_QUERY_CONTENT_READ* = 0x00000001
    WEB_QUERY_KEEPALIVE* = 0x00000002
    WEB_QUERY_DEFLATE* = 0x00000004
    WEB_QUERY_NOCOMPRESSION* = 0x00000008
    WEB_QUERY_RANGE* = 0x00000010
    WEB_QUERY_PROXIED* = 0x00000020

  type
    WEB_Query* {.bycopy.} = object
      `method`*: WEB_Method      
      flags*: cuint
      compressLvl*: cint         
      acceptLangs*: array[WEB_LANGS_MAX, array[WEB_LANG_CODE_MAX, char]] 
      nAcceptLangs*: cuint        
      argsqh_first*: ptr WEB_Argument
      argsqh_last*: ptr ptr WEB_Argument
      nArgs*: cuint               
      cookiesqh_first*: ptr WEB_Cookie
      cookiesqh_last*: ptr ptr WEB_Cookie
      nCookies*: cuint
      contentType*: array[128, char] 
      contentLength*: csize      
      rangeFrom*: cint
      rangeTo*: cint             
      userIP*: array[64, char]    
      userHost*: array[256, char] 
      userAgent*: array[WEB_USERAGENT_MAX, char] 
      code*: array[64, char]      
      head*: array[WEB_HTTP_HEADER_MAX, char] ##  HTTP response headers
      headLine*: array[WEB_HTTP_MAXHEADERS, cuint] ##  Line start offsets
      headLineCount*: cuint
      headLen*: csize
      data*: ptr cuchar            ##  Raw response entity-body
      dataSize*: csize
      dataLen*: csize
      lang*: array[4, char]       ##  Negotiated language
      sess*: pointer             ##  Session object (or NULL)
      `mod`*: pointer            ##  WEB_Module executing op (or NULL)
      sock*: cint                ##  Client socket (or -1)
      date*: array[32, char]      ##  HTTP time
    

  ##  Control command sent to running Frontend process.

  const
    WEB_CONTROL_CMD_SYNC* = 0x00000001

  type
    WEB_ControlType* = enum
      WEB_CONTROL_NOOP, WEB_CONTROL_SHUTDOWN, ##  Perform graceful exit
      WEB_CONTROL_WORKER_CHLD   ##  Report Worker process exit


  type
    INNER_C_STRUCT_416251850* {.bycopy.} = object
      reason*: array[16, char]    ##  Reason for shutdown
    
    INNER_C_STRUCT_441036366* {.bycopy.} = object
      pid*: Pid                ##  Worker PID
      status*: cint              ##  Reported exit status
    
    INNER_C_UNION_4004985493* {.bycopy.} = object {.union.}
      shutdown*: INNER_C_STRUCT_416251850
      workerQuit*: INNER_C_STRUCT_441036366

    WEB_ControlCmd* {.bycopy.} = object
      flags*: cuint
      web_control_type*: WEB_ControlType
      data*: INNER_C_UNION_4004985493


  ##  Description of user-provided option flags

  type
    WEB_FlagDescr* {.bycopy.} = object
      bitmask*: cuint
      name*: cstring
      permsRD*: cstring
      permsWR*: cstring
      descr*: cstring


  ##  Log levels; sync with webLogLvlNames[]

  type
    WEB_LogLvl* {.pure.} = enum
      WEB_LOG_EMERG, WEB_LOG_ALERT, WEB_LOG_CRIT, WEB_LOG_ERR, WEB_LOG_WARNING,
      WEB_LOG_NOTICE, WEB_LOG_INFO, WEB_LOG_DEBUG, WEB_LOG_QUERY, WEB_LOG_WORKER,
      WEB_LOG_EVENT

  type
    WEB_CommandFn* = proc (q: ptr WEB_Query): cint

  ##  Map an URL-specified op to a module method

  type
    WEB_Command* {.bycopy.} = object
      name*: cstring             ##  Command name
      fn*: WEB_CommandFn         ##  Function
      `type`*: cstring           ##  Content-type (or NULL)
      flags*: cstring            ##  Flags ("P"=public, "i"=index)
    

  ##  Map URL to operation (pre-auth)

  type
    WEB_CommandPreAuth* {.bycopy.} = object
      name*: cstring             ##  Op name
      fn*: proc (q: ptr WEB_Query)  ##  Function
      `type`*: cstring           ##  Default Content-type or NULL
    

  ##  Entry in per-module menu section table.

  type
    WEB_MenuSection* {.bycopy.} = object
      name*: cstring             ##  Display name (translated)
      cmd*: cstring              ##  Target op
    

  ##  Application server module

  type
    WEB_ModuleClass* {.bycopy.} = object
      inherit*: AG_Object_Class
      name*: cstring             ##  Short name
      icon*: cstring             ##  Icon HTML
      lname*: cstring            ##  Long name (HTML ok)
      desc*: cstring             ##  Description (HTML ok)
      workerInit*: proc (`mod`: pointer; sess: pointer): cint
      workerDestroy*: proc (`mod`: pointer)
      sessOpen*: proc (`mod`: pointer; sess: pointer): cint
      sessClose*: proc (`mod`: pointer; sess: pointer)
      menu*: proc (`mod`: pointer; q: ptr WEB_Query; V: ptr WEB_Variable)
      menuSections*: ptr WEB_MenuSection
      commands*: ptr WEB_Command

    WEB_Module* {.bycopy.} = object
      inherit*: AG_Object       ##  AG_Object -> WEB_Module
    

  ##  Session manager interface

  const
    WEB_SESSION_PREFORK_AUTH* = 0x00000001

  type
    FdSet* {.bycopy.} = object
    WEB_SessionOps* {.bycopy.} = object
      name*: cstring             ##  Session class name
      size*: csize               ##  Structure size
      flags*: cuint
      sessTimeout*: Time       ##  Session inactivity timeout (s)
      workerTimeout*: Time     ##  Worker inactivity timeout (s)
      init*: proc (a2: pointer)
      destroy*: proc (a2: pointer)
      load*: proc (a2: pointer; a3: ptr AG_DataSource): cint
      save*: proc (a2: pointer; a3: ptr AG_DataSource)
      auth*: proc (a2: pointer; u: cstring; p: cstring): cint
      preAuthCmds*: array[10, WEB_CommandPreAuth]
      sessOpen*: proc (s: pointer; user: cstring): cint
      sessRestored*: proc (s: pointer; user: cstring)
      sessClose*: proc (s: pointer)
      sessExpired*: proc (s: pointer)
      beginFrontQuery*: proc (q: ptr WEB_Query; op: cstring)
      loginPage*: proc (q: ptr WEB_Query)
      logout*: proc (q: ptr WEB_Query)
      addSelectFDs*: proc (s: pointer; rd: ptr FdSet; wr: ptr FdSet; maxfds: ptr cint)
      procSelectFDs*: proc (s: pointer; rd: ptr FdSet; wr: ptr FdSet)

  type
    WEB_MethodOps* {.bycopy.} = object
      name*: cstring
      fn*: proc (sock: cint; url: cstring; header: cstring; rdBuf: pointer; rdBufLen: csize;
              Sops: ptr WEB_SessionOps): cint

  type
    WEB_SessionVar* {.bycopy.} = object
      key*: array[WEB_SESSION_VAR_KEY_MAX, char] ##  Variable name
      value*: array[WEB_SESSION_VAR_VALUE_MAX, char] ##  Variable value
      varsqe_next*: ptr WEB_SessionVar
      varsqe_prev*: ptr ptr WEB_SessionVar
    

  ##  Open socket between a Frontend and a running Worker.

  type
    WEB_SessionSocket* {.bycopy.} = object
      sessID*: array[WEB_SESSID_MAX, char] ##  Open session ID
      fd*: cint                  ##  Socket
      workerPID*: Pid          ##  Worker process PID
      workerIsMyChld*: cint      ##  Worker is my child
                          ## AG_TAILQ_ENTRY(web_session_socket) sockets;
    
    WEB_SessionSocketQ* {.bycopy.} = object
      socket_first*: ptr WEB_SessionSocket
      socket_last*: ptr ptr WEB_SessionSocket
  ##  Session Instance

  type
    WEB_Session* {.bycopy.} = object
      ops*: ptr WEB_SessionOps    ##  Operations
      id*: array[WEB_SESSID_MAX, char] ##  Session identifier
      varsqh_first*: ptr WEB_Session
      varsqh_last*: ptr ptr WEB_Session
      sessionsqe_next*: ptr WEB_Session
      sessionsqe_prev*: ptr ptr WEB_Session
      nVars*: cuint
      pp*: array[2, cint]         ##  Status pipe
      nEvents*: cuint             ##  Event counter
    
    WEB_LanguageFn* = proc (lang: cstring; arg: pointer): cint
    WEB_MenuFn* = proc (q: ptr WEB_Query; `var`: ptr WEB_Variable; arg: pointer)
    WEB_DestroyFn* = proc ()
    WEB_LogFn* = proc (a2: WEB_LogLvl; s: cstring)
    WEB_EventFilterFn* = proc (sessID: cstring; user: cstring; langCode: cstring;
                            arg: pointer): cint


# proc AG_InitClass*(c: AG_ObjectClass, hier: cstring, libs: cstring) {.importc:"AG_InitClass", libag_core.}
proc AG_InitClassTbl*() {.importc:"AG_InitClassTbl", libag_core.}
proc AG_DestroyClassTbl*() {.importc:"AG_DestroyClassTbl", libag_core.}
proc AG_LoadClass*(classSpec: cstring): ptr AG_ObjectClass {.importc:"AG_LoadClass", libag_core.}
proc AG_LookupClass*(classSpec: cstring): ptr AG_ObjectClass {.importc:"AG_LookupClass", libag_core.}
proc AG_UnloadClass*(a2: ptr AG_ObjectClass) {.importc:"AG_UnloadClass", libag_core.}
proc AG_RegisterNamespace*(name: cstring; pfx: cstring; url: cstring): ptr AG_Namespace {.importc:"AG_RegisterNamespace", libag_core.}
proc AG_UnregisterNamespace*(name: cstring) {.importc:"AG_UnregisterNamespace", libag_core.}
proc AG_RegisterModuleDirectory*(path: cstring) {.importc:"AG_RegisterModuleDirectory", libag_core.}
proc AG_UnregisterModuleDirectory*(path: cstring) {.importc:"AG_UnregisterModuleDirectory", libag_core.}
proc AG_RegisterClass*(p: pointer) {.importc:"AG_RegisterClass", libag_core.}
proc AG_UnregisterClass*(p: pointer) {.importc:"AG_UnregisterClass", libag_core.}
proc AG_CreateClass*(hier: cstring; objectSize: csize; classSize: csize; major: cuint; minor: cuint): pointer {.importc:"AG_CreateClass", libag_core.}
proc AG_ClassSetInit*(class: pointer; function: AG_ObjectInitFn): AG_ObjectInitFn {.importc:"AG_ClassSetInit", libag_core.}
proc AG_ClassSetReset*(class: pointer; function: AG_ObjectResetFn): AG_ObjectResetFn {.importc:"AG_ClassSetReset", libag_core.}
proc AG_ClassSetDestroy*(class: pointer; function: AG_ObjectDestroyFn): AG_ObjectDestroyFn {.importc:"AG_ClassSetDestroy", libag_core.}
proc AG_ClassSetLoad*(class: pointer; function: AG_ObjectLoadFn): AG_ObjectLoadFn {.importc:"AG_ClassSetLoad", libag_core.}
proc AG_ClassSetSave*(class: pointer; function: AG_ObjectSaveFn): AG_ObjectSaveFn {.importc:"AG_ClassSetSave", libag_core.}
proc AG_ClassSetEdit*(class: pointer; function: AG_ObjectEditFn): AG_ObjectEditFn {.importc:"AG_ClassSetEdit", libag_core.}
proc AG_DestroyClass*(class: pointer) {.importc:"AG_DestroyClass", libag_core.}
proc AG_ParseClassSpec*(cs: ptr AG_ObjectClassSpec; spec: cstring): cint {.importc:"AG_ParseClassSpec", libag_core.}
#proc AG_OfClassGeneral*(a2: ptr AG_Object; a3: cstring): cint {.importc:"AG_OfClassGeneral", libag_core.}
proc AG_ClassIsNamedGeneral*(class: ptr AG_ObjectClass; className: cstring): cint {.importc:"AG_ClassIsNamedGeneral", libag_core.}
proc AG_ObjectGetInheritHier*(obj: pointer; hier: ptr ptr ptr AG_ObjectClass; nHier: ptr cint): cint {.importc:"AG_ObjectGetInheritHier", libag_core.}
proc AG_InitCore*(a2: cstring; a3: cuint): cint {.importc:"AG_InitCore", libag_core.}
proc AG_AtExitFunc*(a2: proc ()) {.importc:"AG_AtExitFunc", libag_core.}
proc AG_AtExitFuncEv*(a2: proc (a2: ptr AG_Event)) {.importc:"AG_AtExitFuncEv", libag_core.}
proc AG_Quit*() {.importc:"AG_Quit", libag_core.}
proc AG_Destroy*() {.importc:"AG_Destroy", libag_core.}
proc AG_GetCPUInfo*(a2: ptr AG_CPUInfo) {.importc:"AG_GetCPUInfo", libag_core.}
proc AG_DataSourceInitSubsystem*() {.importc:"AG_DataSourceInitSubsystem", libag_core.}
proc AG_DataSourceDestroySubsystem*() {.importc:"AG_DataSourceDestroySubsystem", libag_core.}
proc AG_DataSourceInit*(a2: ptr AG_DataSource) {.importc:"AG_DataSourceInit", libag_core.}
proc AG_DataSourceSetDebug*(a2: ptr AG_DataSource; a3: cint) {.importc:"AG_DataSourceSetDebug", libag_core.}
proc AG_DataSourceSetErrorFn*(a2: ptr AG_DataSource; a3: proc (a2: ptr AG_Event); a4: cstring) {.importc:"AG_DataSourceSetErrorFn", varargs, libag_core.}
proc AG_DataSourceError*(a2: ptr AG_DataSource; a3: cstring) {.importc:"AG_DataSourceError", varargs, libag_core.}
proc AG_SetByteOrder*(a2: ptr AG_DataSource; a3: AG_ByteOrder) {.importc:"AG_SetByteOrder", libag_core.}
proc AG_SetSourceDebug*(a2: ptr AG_DataSource; a3: cint) {.importc:"AG_SetSourceDebug", libag_core.}
proc AG_OpenFile*(a2: cstring; a3: cstring): ptr AG_DataSource {.importc:"AG_OpenFile", libag_core.}
proc AG_OpenFileHandle*(a2: ptr File): ptr AG_DataSource {.importc:"AG_OpenFileHandle", libag_core.}
proc AG_OpenCore*(a2: pointer; a3: csize): ptr AG_DataSource {.importc:"AG_OpenCore", libag_core.}
proc AG_OpenConstCore*(a2: pointer; a3: csize): ptr AG_DataSource {.importc:"AG_OpenConstCore", libag_core.}
proc AG_OpenAutoCore*(): ptr AG_DataSource {.importc:"AG_OpenAutoCore", libag_core.}
# proc AG_OpenNetSocket*(a2: ptr AG_NetSocket): ptr AG_DataSource {.importc:"AG_OpenNetSocket", libag_core.}
proc AG_Read*(ds: ptr AG_DataSource; a3: pointer; size: csize): cint {.importc:"AG_Read", libag_core.}
proc AG_ReadP*(ds: ptr AG_DataSource; a3: pointer; size: csize; nRead: ptr csize): cint {.importc:"AG_ReadP", libag_core.}
proc AG_ReadAt*(ds: ptr AG_DataSource; a3: pointer; size: csize; pos: Off): cint {.importc:"AG_ReadAt", libag_core.}
proc AG_ReadAtP*(ds: ptr AG_DataSource; a3: pointer; size: csize; pos: Off; a6: ptr csize): cint {.importc:"AG_ReadAtP", libag_core.}
proc AG_Write*(ds: ptr AG_DataSource; a3: pointer; size: csize): cint {.importc:"AG_Write", libag_core.}
proc AG_WriteP*(ds: ptr AG_DataSource; a3: pointer; size: csize; nWrite: ptr csize): cint {.importc:"AG_WriteP", libag_core.}
proc AG_WriteAt*(ds: ptr AG_DataSource; a3: pointer; size: csize; pos: Off): cint {.importc:"AG_WriteAt", libag_core.}
proc AG_WriteAtP*(ds: ptr AG_DataSource; a3: pointer; size: csize; pos: Off; a6: ptr csize): cint {.importc:"AG_WriteAtP", libag_core.}
proc AG_CloseFileHandle*(ds: ptr AG_DataSource) {.importc:"AG_CloseFileHandle", libag_core.}
proc AG_CloseCore*(ds: ptr AG_DataSource) {.importc:"AG_CloseCore", libag_core.}
proc AG_CloseAutoCore*(ds: ptr AG_DataSource) {.importc:"AG_CloseAutoCore", libag_core.}
# proc AG_CloseNetSocket*(ds: ptr AG_DataSource) {.importc:"AG_CloseNetSocket", libag_core.}
proc AG_WriteTypeCode*(ds: ptr AG_DataSource; `type`: AG_DataSourceType) {.importc:"AG_WriteTypeCode", libag_core.}
proc AG_WriteTypeCodeAt*(ds: ptr AG_DataSource; `type`: AG_DataSourceType; offset: Off) {.importc:"AG_WriteTypeCodeAt", libag_core.}
proc AG_WriteTypeCodeE*(ds: ptr AG_DataSource; `type`: AG_DataSourceType): cint {.importc:"AG_WriteTypeCodeE", libag_core.}
proc AG_CheckTypeCode*(ds: ptr AG_DataSource; `type`: AG_DataSourceType): cint {.importc:"AG_CheckTypeCode", libag_core.}
proc AG_DbNew*(backend: cstring): ptr AG_Db {.importc:"AG_DbNew", libag_core.}
proc AG_DbOpen*(db: ptr AG_Db; path: cstring; flags: cuint): cint {.importc:"AG_DbOpen", libag_core.}
proc AG_DbClose*(db: ptr AG_Db) {.importc:"AG_DbClose", libag_core.}
proc AG_DbSync*(db: ptr AG_Db): cint {.importc:"AG_DbSync", libag_core.}
# proc AG_DbObjectNew*(): ptr AG_DbObject {.importc:"AG_DbObjectNew", libag_core.}
# proc AG_DbObjectList*(db: ptr AG_Db): ptr AG_List {.importc:"AG_DbObjectList", libag_core.}
# proc AG_DbObjectLoad*(obj: pointer; db: ptr AG_Db; key: cstring): cint {.importc:"AG_DbObjectLoad", libag_core.}
# proc AG_DbObjectSave*(pDbo: pointer; db: ptr AG_Db): cint {.importc:"AG_DbObjectSave", libag_core.}
# proc AG_DbObjectInsert*(db: ptr AG_Db; pDbo: pointer): cint {.importc:"AG_DbObjectInsert", libag_core.}
# proc AG_DbObjectDelete*(db: ptr AG_Db; name: cstring): cint {.importc:"AG_DbObjectDelete", libag_core.}
proc AG_MkDir*(dir: cstring): cint {.importc:"AG_MkDir", libag_core.}
proc AG_RmDir*(dir: cstring): cint {.importc:"AG_RmDir", libag_core.}
proc AG_ChDir*(dir: cstring): cint {.importc:"AG_ChDir", libag_core.}
proc AG_OpenDir*(path: cstring): ptr AG_Dir {.importc:"AG_OpenDir", libag_core.}
proc AG_CloseDir*(dir: ptr AG_Dir) {.importc:"AG_CloseDir", libag_core.}
proc AG_MkPath*(path: cstring): cint {.importc:"AG_MkPath", libag_core.}
proc AG_GetCWD*(buf: cstring; len: csize): cint {.importc:"AG_GetCWD", libag_core.}
proc AG_LookupDSO*(name: cstring): ptr AG_DSO {.importc:"AG_LookupDSO", libag_core.}
proc AG_LoadDSO*(name: cstring; flags: cuint): ptr AG_DSO {.importc:"AG_LoadDSO", libag_core.}
proc AG_SymDSO*(dso: ptr AG_DSO; sym: cstring; p: ptr pointer): cint {.importc:"AG_SymDSO", libag_core.}
proc AG_UnloadDSO*(dso: ptr AG_DSO): cint {.importc:"AG_UnloadDSO", libag_core.}
proc AG_GetDSOList*(count: ptr cuint): cstringArray {.importc:"AG_GetDSOList", libag_core.}
proc AG_FreeDSOList*(list: cstringArray; count: cuint) {.importc:"AG_FreeDSOList", libag_core.}
proc AG_InitErrorSubsystem*(): cint {.importc:"AG_InitErrorSubsystem", libag_core.}
proc AG_DestroyErrorSubsystem*() {.importc:"AG_DestroyErrorSubsystem", libag_core.}
proc AG_GetErrorCode*(): AG_ErrorCode {.importc:"AG_GetErrorCode", libag_core.}
proc AG_GetError*(): cstring {.importc:"AG_GetError", libag_core.}
proc AG_SetErrorCode*(a2: AG_ErrorCode) {.importc:"AG_SetErrorCode", libag_core.}
proc AG_Strerror*(a2: cint): cstring {.importc:"AG_Strerror", libag_core.}
proc AG_SetError*(a2: cstring) {.importc:"AG_SetError", varargs, libag_core.}
proc AG_SetErrorS*(a2: cstring) {.importc:"AG_SetErrorS", libag_core.}
proc AG_FatalError*(a2: cstring) {.importc:"AG_FatalError", libag_core.}
proc AG_SetFatalCallback*(callback: proc (a2: cstring)) {.importc:"AG_SetFatalCallback", libag_core.}
proc AG_SetVerboseCallback*(callback: proc (a2: cstring): cint) {.importc:"AG_SetVerboseCallback", libag_core.}
proc AG_SetDebugCallback*(callback: proc (a2: cstring): cint) {.importc:"AG_SetDebugCallback", libag_core.}
proc AG_Debug*(a2: pointer; a3: cstring) {.importc:"AG_Debug", varargs, libag_core.}
proc AG_Verbose*(a2: cstring) {.importc:"AG_Verbose", varargs, libag_core.}
proc AG_InitEventSubsystem*(a2: cuint): cint {.importc:"AG_InitEventSubsystem", libag_core.}
proc AG_DestroyEventSubsystem*() {.importc:"AG_DestroyEventSubsystem", libag_core.}
proc AG_EventInit*(a2: ptr AG_Event) {.importc:"AG_EventInit", libag_core.}
proc AG_EventArgs*(a2: ptr AG_Event; a3: cstring) {.importc:"AG_EventArgs", varargs, libag_core.}
proc AG_SetEvent*(a2: pointer; a3: cstring; a4: AG_EventFn; a5: cstring): ptr AG_Event {.importc:"AG_SetEvent", varargs, libag_core.}
proc AG_AddEvent*(a2: pointer; a3: cstring; a4: AG_EventFn; a5: cstring): ptr AG_Event {.importc:"AG_AddEvent", varargs, libag_core.}
proc AG_SetVoidFn*(a2: pointer; a3: cstring; a4: AG_VoidFn; a5: cstring): ptr AG_Function {.importc:"AG_SetVoidFn", varargs, libag_core.}
proc AG_SetIntFn*(a2: pointer; a3: cstring; a4: AG_IntFn; a5: cstring): ptr AG_Function {.importc:"AG_SetIntFn", varargs, libag_core.}
# proc AG_SetUintFn*(a2: pointer; a3: cstring; a4: AG_UintFn; a5: cstring): ptr AG_Function {.importc:"AG_SetUintFn", varargs, libag_core.}
# proc AG_SetLongFn*(a2: pointer; a3: cstring; a4: AG_LongFn; a5: cstring): ptr AG_Function {.importc:"AG_SetLongFn", varargs, libag_core.}
# proc AG_SetUlongFn*(a2: pointer; a3: cstring; a4: AG_UlongFn; a5: cstring): ptr AG_Function {.importc:"AG_SetUlongFn", varargs, libag_core.}
proc AG_SetUint8Fn*(a2: pointer; a3: cstring; a4: AG_Uint8Fn; a5: cstring): ptr AG_Function {.importc:"AG_SetUint8Fn", varargs, libag_core.}
proc AG_SetSint8Fn*(a2: pointer; a3: cstring; a4: AG_Sint8Fn; a5: cstring): ptr AG_Function {.importc:"AG_SetSint8Fn", varargs, libag_core.}
proc AG_SetUint16Fn*(a2: pointer; a3: cstring; a4: AG_Uint16Fn; a5: cstring): ptr AG_Function {.importc:"AG_SetUint16Fn", varargs, libag_core.}
proc AG_SetSint16Fn*(a2: pointer; a3: cstring; a4: AG_Sint16Fn; a5: cstring): ptr AG_Function {.importc:"AG_SetSint16Fn", varargs, libag_core.}
proc AG_SetUint32Fn*(a2: pointer; a3: cstring; a4: AG_Uint32Fn; a5: cstring): ptr AG_Function {.importc:"AG_SetUint32Fn", varargs, libag_core.}
proc AG_SetSint32Fn*(a2: pointer; a3: cstring; a4: AG_Sint32Fn; a5: cstring): ptr AG_Function {.importc:"AG_SetSint32Fn", varargs, libag_core.}
proc AG_SetUint64Fn*(a2: pointer; a3: cstring; a4: AG_Uint64Fn; a5: cstring): ptr AG_Function {.importc:"AG_SetUint64Fn", varargs, libag_core.}
proc AG_SetSint64Fn*(a2: pointer; a3: cstring; a4: AG_Sint64Fn; a5: cstring): ptr AG_Function {.importc:"AG_SetSint64Fn", varargs, libag_core.}
proc AG_SetFloatFn*(a2: pointer; a3: cstring; a4: AG_FloatFn; a5: cstring): ptr AG_Function {.importc:"AG_SetFloatFn", varargs, libag_core.}
proc AG_SetDoubleFn*(a2: pointer; a3: cstring; a4: AG_DoubleFn; a5: cstring): ptr AG_Function {.importc:"AG_SetDoubleFn", varargs, libag_core.}
proc AG_SetStringFn*(a2: pointer; a3: cstring; a4: AG_StringFn; a5: cstring): ptr AG_Function {.importc:"AG_SetStringFn", varargs, libag_core.}
proc AG_SetPointerFn*(a2: pointer; a3: cstring; a4: AG_PointerFn; a5: cstring): ptr AG_Function {.importc:"AG_SetPointerFn", varargs, libag_core.}
proc AG_UnsetEvent*(a2: pointer; a3: cstring) {.importc:"AG_UnsetEvent", libag_core.}
proc AG_PostEvent*(a2: pointer; a3: pointer; a4: cstring; a5: cstring) {.importc:"AG_PostEvent", varargs, libag_core.}
proc AG_PostEventByPtr*(a2: pointer; a3: pointer; a4: ptr AG_Event; a5: cstring) {.importc:"AG_PostEventByPtr", varargs, libag_core.}
proc AG_FindEventHandler*(a2: pointer; a3: cstring): ptr AG_Event {.importc:"AG_FindEventHandler", libag_core.}
proc AG_InitEventQ*(a2: ptr AG_EventQ) {.importc:"AG_InitEventQ", libag_core.}
proc AG_FreeEventQ*(a2: ptr AG_EventQ) {.importc:"AG_FreeEventQ", libag_core.}
proc AG_QueueEvent*(a2: ptr AG_EventQ; a3: cstring; a4: cstring) {.importc:"AG_QueueEvent", varargs, libag_core.}
proc AG_SchedEvent*(a2: pointer; a3: pointer; a4: uint32; a5: cstring; a6: cstring): cint {.importc:"AG_SchedEvent", varargs, libag_core.}
proc AG_ForwardEvent*(a2: pointer; a3: pointer; a4: ptr AG_Event) {.importc:"AG_ForwardEvent", libag_core.}
proc AG_GetEventSource*(): ptr AG_EventSource {.importc:"AG_GetEventSource", libag_core.}
proc AG_AddEventPrologue*(a2: AG_EventSinkFn; a3: cstring): ptr AG_EventSink {.importc:"AG_AddEventPrologue", varargs, libag_core.}
proc AG_AddEventEpilogue*(a2: AG_EventSinkFn; a3: cstring): ptr AG_EventSink {.importc:"AG_AddEventEpilogue", varargs, libag_core.}
proc AG_AddEventSpinner*(a2: AG_EventSinkFn; a3: cstring): ptr AG_EventSink {.importc:"AG_AddEventSpinner", varargs, libag_core.}
proc AG_AddEventSink*(a2: ag_event_sink_type; a3: cint; a4: cuint; a5: AG_EventSinkFn; a6: cstring): ptr AG_EventSink {.importc:"AG_AddEventSink", varargs, libag_core.}
proc AG_EventLoop*(): cint {.importc:"AG_EventLoop", libag_core.}
proc AG_DelEventPrologue*(a2: ptr AG_EventSink) {.importc:"AG_DelEventPrologue", libag_core.}
proc AG_DelEventEpilogue*(a2: ptr AG_EventSink) {.importc:"AG_DelEventEpilogue", libag_core.}
proc AG_DelEventSpinner*(a2: ptr AG_EventSink) {.importc:"AG_DelEventSpinner", libag_core.}
proc AG_DelEventSink*(a2: ptr AG_EventSink) {.importc:"AG_DelEventSink", libag_core.}
proc AG_DelEventSinksByIdent*(a2: ag_event_sink_type; a3: cint; a4: cuint) {.importc:"AG_DelEventSinksByIdent", libag_core.}
proc AG_Terminate*(a2: cint) {.importc:"AG_Terminate", libag_core.}
proc AG_TerminateEv*(a2: ptr AG_Event) {.importc:"AG_TerminateEv", libag_core.}
proc AG_AddTimerKQUEUE*(a2: ptr AG_Timer; a3: uint32; a4: cint): cint {.importc:"AG_AddTimerKQUEUE", libag_core.}
proc AG_DelTimerKQUEUE*(a2: ptr AG_Timer) {.importc:"AG_DelTimerKQUEUE", libag_core.}
# proc AG_AddTimerTIMERFD*(a2: ptr AG_Timer; a3: uint32; a4: cint): cint {.importc:"AG_AddTimerTIMERFD", libag_core.}
# proc AG_DelTimerTIMERFD*(a2: ptr AG_Timer) {.importc:"AG_DelTimerTIMERFD", libag_core.}
proc AG_EventSinkKQUEUE*(): cint {.importc:"AG_EventSinkKQUEUE", libag_core.}
# proc AG_EventSinkTIMERFD*(): cint {.importc:"AG_EventSinkTIMERFD", libag_core.}
# proc AG_EventSinkTIMEDSELECT*(): cint {.importc:"AG_EventSinkTIMEDSELECT", libag_core.}
proc AG_EventSinkSELECT*(): cint {.importc:"AG_EventSinkSELECT", libag_core.}
proc AG_EventSinkSPINNER*(): cint {.importc:"AG_EventSinkSPINNER", libag_core.}
proc AG_Execute*(a2: cstring; a3: cstringArray): AG_ProcessID {.importc:"AG_Execute", libag_core.}
proc AG_WaitOnProcess*(a2: AG_ProcessID; a3: ag_exec_wait_type): AG_ProcessID {.importc:"AG_WaitOnProcess", libag_core.}
proc AG_Kill*(a2: AG_ProcessID): cint {.importc:"AG_Kill", libag_core.}
proc AG_GetFileInfo*(a2: cstring; a3: ptr AG_FileInfo): cint {.importc:"AG_GetFileInfo", libag_core.}
proc AG_GetSystemTempDir*(a2: cstring; a3: csize): cint {.importc:"AG_GetSystemTempDir", libag_core.}
proc AG_FileExists*(a2: cstring): cint {.importc:"AG_FileExists", libag_core.}
proc AG_FileDelete*(a2: cstring): cint {.importc:"AG_FileDelete", libag_core.}
proc AG_ShortFilename*(a2: cstring): cstring {.importc:"AG_ShortFilename", libag_core.}
proc AG_RegisterFileExtMappings*(a2: ptr AG_FileExtMapping; a3: cuint) {.importc:"AG_RegisterFileExtMappings", libag_core.}
proc AG_Getopt*(a2: cint; a3: ptr cstring; a4: cstring; a5: cstringArray; a6: ptr cint): cint {.importc:"AG_Getopt", libag_core.}
proc AG_ReadStringLen*(a2: ptr AG_DataSource; a3: csize): cstring {.importc:"AG_ReadStringLen", libag_core.}
proc AG_ReadStringPadded*(a2: ptr AG_DataSource; a3: csize): cstring {.importc:"AG_ReadStringPadded", libag_core.}
proc AG_ReadNulStringLen*(a2: ptr AG_DataSource; a3: csize): cstring {.importc:"AG_ReadNulStringLen", libag_core.}
proc AG_WriteString*(a2: ptr AG_DataSource; a3: cstring) {.importc:"AG_WriteString", libag_core.}
proc AG_WriteStringPadded*(a2: ptr AG_DataSource; a3: cstring; a4: csize) {.importc:"AG_WriteStringPadded", libag_core.}
proc AG_CopyString*(a2: cstring; a3: ptr AG_DataSource; a4: csize): csize {.importc:"AG_CopyString", libag_core.}
proc AG_CopyStringPadded*(a2: cstring; a3: ptr AG_DataSource; a4: csize): csize {.importc:"AG_CopyStringPadded", libag_core.}
proc AG_CopyNulString*(a2: cstring; a3: ptr AG_DataSource; a4: csize): csize {.importc:"AG_CopyNulString", libag_core.}
proc AG_SkipString*(a2: ptr AG_DataSource) {.importc:"AG_SkipString", libag_core.}
proc AG_SkipStringPadded*(a2: ptr AG_DataSource) {.importc:"AG_SkipStringPadded", libag_core.}
proc AG_ReadVersion*(a2: ptr AG_DataSource; a3: cstring; a4: ptr AG_Version; a5: ptr AG_Version): cint {.importc:"AG_ReadVersion", libag_core.}
proc AG_WriteVersion*(a2: ptr AG_DataSource; a3: cstring; a4: ptr AG_Version): cint {.importc:"AG_WriteVersion", libag_core.}
proc AG_ReadObjectVersion*(a2: ptr AG_DataSource; a3: pointer; a4: ptr AG_Version): cint {.importc:"AG_ReadObjectVersion", libag_core.}
proc AG_WriteObjectVersion*(a2: ptr AG_DataSource; a3: pointer) {.importc:"AG_WriteObjectVersion", libag_core.}
proc AG_InitNetworkSubsystem*(a2: ptr AG_NetOps): cint {.importc:"AG_InitNetworkSubsystem", libag_core.}
proc AG_NetSocketNew*(a2: ag_net_addr_family; a3: ag_net_socket_type; a4: cint): ptr AG_NetSocket {.importc:"AG_NetSocketNew", libag_core.}
proc AG_NetSocketFree*(a2: ptr AG_NetSocket) {.importc:"AG_NetSocketFree", libag_core.}
proc AG_NetSocketSetInit*(a2: ptr AG_NetSocketSet) {.importc:"AG_NetSocketSetInit", libag_core.}
proc AG_NetSocketSetClear*(a2: ptr AG_NetSocketSet) {.importc:"AG_NetSocketSetClear", libag_core.}
proc AG_NetAddrNew*(): ptr AG_NetAddr {.importc:"AG_NetAddrNew", libag_core.}
proc AG_NetAddrDup*(a2: ptr AG_NetAddr): ptr AG_NetAddr {.importc:"AG_NetAddrDup", libag_core.}
proc AG_NetAddrCompare*(a2: ptr AG_NetAddr; a3: ptr AG_NetAddr): cint {.importc:"AG_NetAddrCompare", libag_core.}
proc AG_NetAddrIsAny*(a2: ptr AG_NetAddr): cint {.importc:"AG_NetAddrIsAny", libag_core.}
proc AG_NetAddrFree*(a2: ptr AG_NetAddr) {.importc:"AG_NetAddrFree", libag_core.}
proc AG_NetAddrNumerical*(a2: ptr AG_NetAddr): cstring {.importc:"AG_NetAddrNumerical", libag_core.}
proc AG_NetAddrListNew*(): ptr AG_NetAddrList {.importc:"AG_NetAddrListNew", libag_core.}
proc AG_NetAddrListClear*(a2: ptr AG_NetAddrList) {.importc:"AG_NetAddrListClear", libag_core.}
proc AG_NetAddrListFree*(a2: ptr AG_NetAddrList) {.importc:"AG_NetAddrListFree", libag_core.}
proc AG_NetResolve*(a2: cstring; a3: cstring; a4: cuint): ptr AG_NetAddrList {.importc:"AG_NetResolve", libag_core.}
proc AG_NetGetIfConfig*(): ptr AG_NetAddrList {.importc:"AG_NetGetIfConfig", libag_core.}
proc AG_NetConnect*(a2: ptr AG_NetSocket; a3: ptr AG_NetAddrList): cint {.importc:"AG_NetConnect", libag_core.}
proc AG_NetBind*(a2: ptr AG_NetSocket; a3: ptr AG_NetAddr): cint {.importc:"AG_NetBind", libag_core.}
proc AG_NetGetOption*(a2: ptr AG_NetSocket; a3: AG_NetSocketOption; a4: pointer): cint {.importc:"AG_NetGetOption", libag_core.}
proc AG_NetGetOptionInt*(a2: ptr AG_NetSocket; a3: AG_NetSocketOption; a4: ptr cint): cint {.importc:"AG_NetGetOptionInt", libag_core.}
proc AG_NetSetOption*(a2: ptr AG_NetSocket; a3: AG_NetSocketOption; a4: pointer): cint {.importc:"AG_NetSetOption", libag_core.}
proc AG_NetSetOptionInt*(a2: ptr AG_NetSocket; a3: AG_NetSocketOption; a4: cint): cint {.importc:"AG_NetSetOptionInt", libag_core.}
proc AG_NetPoll*(a2: ptr AG_NetSocketSet; a3: ptr AG_NetSocketSet; a4: ptr AG_NetSocketSet; a5: ptr AG_NetSocketSet; a6: uint32): cint {.importc:"AG_NetPoll", libag_core.}
proc AG_NetAccept*(a2: ptr AG_NetSocket): ptr AG_NetSocket {.importc:"AG_NetAccept", libag_core.}
proc AG_NetRead*(a2: ptr AG_NetSocket; a3: pointer; a4: csize; a5: ptr csize): cint {.importc:"AG_NetRead", libag_core.}
proc AG_NetWrite*(a2: ptr AG_NetSocket; a3: pointer; a4: csize; a5: ptr csize): cint {.importc:"AG_NetWrite", libag_core.}
proc AG_NetClose*(a2: ptr AG_NetSocket) {.importc:"AG_NetClose", libag_core.}
proc AG_ObjectNew*(a2: pointer; a3: cstring; a4: ptr AG_ObjectClass): pointer {.importc:"AG_ObjectNew", libag_core.}
proc AG_ObjectAttach*(a2: pointer; a3: pointer) {.importc:"AG_ObjectAttach", libag_core.}
proc AG_ObjectAttachToNamed*(a2: pointer; a3: cstring; a4: pointer): cint {.importc:"AG_ObjectAttachToNamed", libag_core.}
proc AG_ObjectDetach*(a2: pointer) {.importc:"AG_ObjectDetach", libag_core.}
proc AG_ObjectInit*(a2: pointer; a3: pointer) {.importc:"AG_ObjectInit", libag_core.}
proc AG_ObjectInitStatic*(a2: pointer; a3: pointer) {.importc:"AG_ObjectInitStatic", libag_core.}
proc AG_ObjectInitNamed*(a2: pointer; a3: pointer; a4: cstring) {.importc:"AG_ObjectInitNamed", libag_core.}
proc AG_ObjectReset*(a2: pointer) {.importc:"AG_ObjectReset", libag_core.}
proc AG_ObjectRemain*(a2: pointer; a3: cuint) {.importc:"AG_ObjectRemain", libag_core.}
proc AG_ObjectGetName*(a2: pointer): cstring {.importc:"AG_ObjectGetName", libag_core.}
proc AG_ObjectCopyName*(a2: pointer; a3: cstring; a4: csize): cint {.importc:"AG_ObjectCopyName", libag_core.}
proc AG_ObjectCopyDirname*(a2: pointer; a3: cstring; a4: csize): cint {.importc:"AG_ObjectCopyDirname", libag_core.}
proc AG_ObjectCopyFilename*(a2: pointer; a3: cstring; a4: csize): cint {.importc:"AG_ObjectCopyFilename", libag_core.}
proc AG_ObjectChanged*(a2: pointer): cint {.importc:"AG_ObjectChanged", libag_core.}
proc AG_ObjectChangedAll*(a2: pointer): cint {.importc:"AG_ObjectChangedAll", libag_core.}
proc AG_ObjectFindS*(a2: pointer; a3: cstring): pointer {.importc:"AG_ObjectFindS", libag_core.}
proc AG_ObjectFind*(a2: pointer; a3: cstring): pointer {.importc:"AG_ObjectFind", varargs, libag_core.}
proc AG_ObjectFindParent*(a2: pointer; a3: cstring; a4: cstring): pointer {.importc:"AG_ObjectFindParent", libag_core.}
proc AG_ObjectInUse*(a2: pointer): cint {.importc:"AG_ObjectInUse", libag_core.}
proc AG_ObjectSetName*(a2: pointer; a3: cstring) {.importc:"AG_ObjectSetName", varargs, libag_core.}
proc AG_ObjectSetNameS*(a2: pointer; a3: cstring) {.importc:"AG_ObjectSetNameS", libag_core.}
proc AG_ObjectSetArchivePath*(a2: pointer; a3: cstring) {.importc:"AG_ObjectSetArchivePath", libag_core.}
proc AG_ObjectGetArchivePath*(a2: pointer; a3: cstring; a4: csize) {.importc:"AG_ObjectGetArchivePath", libag_core.}
proc AG_ObjectSetClass*(a2: pointer; a3: pointer) {.importc:"AG_ObjectSetClass", libag_core.}
proc AG_ObjectSetAttachFn*(a2: pointer; fn: proc (a2: ptr AG_Event); a4: cstring) {.importc:"AG_ObjectSetAttachFn", varargs, libag_core.}
proc AG_ObjectSetDetachFn*(a2: pointer; fn: proc (a2: ptr AG_Event); a4: cstring) {.importc:"AG_ObjectSetDetachFn", varargs, libag_core.}
proc AG_ObjectMoveUp*(a2: pointer) {.importc:"AG_ObjectMoveUp", libag_core.}
proc AG_ObjectMoveDown*(a2: pointer) {.importc:"AG_ObjectMoveDown", libag_core.}
proc AG_ObjectMoveToHead*(a2: pointer) {.importc:"AG_ObjectMoveToHead", libag_core.}
proc AG_ObjectMoveToTail*(a2: pointer) {.importc:"AG_ObjectMoveToTail", libag_core.}
proc AG_ObjectDestroy*(a2: pointer) {.importc:"AG_ObjectDestroy", libag_core.}
proc AG_ObjectUnlinkDatafiles*(a2: pointer) {.importc:"AG_ObjectUnlinkDatafiles", libag_core.}
proc AG_ObjectSetSavePfx*(a2: pointer; a3: cstring) {.importc:"AG_ObjectSetSavePfx", libag_core.}
proc AG_ObjectFreeVariables*(a2: pointer) {.importc:"AG_ObjectFreeVariables", libag_core.}
proc AG_ObjectFreeChildren*(a2: pointer) {.importc:"AG_ObjectFreeChildren", libag_core.}
proc AG_ObjectFreeEvents*(a2: ptr AG_Object) {.importc:"AG_ObjectFreeEvents", libag_core.}
proc AG_ObjectFreeDeps*(a2: ptr AG_Object) {.importc:"AG_ObjectFreeDeps", libag_core.}
proc AG_ObjectFreeDummyDeps*(a2: ptr AG_Object) {.importc:"AG_ObjectFreeDummyDeps", libag_core.}
proc AG_ObjectPageIn*(a2: pointer): cint {.importc:"AG_ObjectPageIn", libag_core.}
proc AG_ObjectPageOut*(a2: pointer): cint {.importc:"AG_ObjectPageOut", libag_core.}
proc AG_ObjectSerialize*(a2: pointer; a3: ptr AG_DataSource): cint {.importc:"AG_ObjectSerialize", libag_core.}
proc AG_ObjectUnserialize*(a2: pointer; a3: ptr AG_DataSource): cint {.importc:"AG_ObjectUnserialize", libag_core.}
proc AG_ObjectSave*(a2: pointer): cint {.importc:"AG_ObjectSave", libag_core.}
proc AG_ObjectSaveToFile*(a2: pointer; a3: cstring): cint {.importc:"AG_ObjectSaveToFile", libag_core.}
proc AG_ObjectSaveAll*(a2: pointer): cint {.importc:"AG_ObjectSaveAll", libag_core.}
proc AG_ObjectSaveVariables*(a2: pointer; a3: ptr AG_DataSource) {.importc:"AG_ObjectSaveVariables", libag_core.}
proc AG_ObjectLoadFromDB*(a2: pointer; a3: ptr AG_Db; a4: ptr AG_Dbt): cint {.importc:"AG_ObjectLoadFromDB", libag_core.}
proc AG_ObjectSaveToDB*(a2: pointer; a3: ptr AG_Db; a4: ptr AG_Dbt): cint {.importc:"AG_ObjectSaveToDB", libag_core.}
proc AG_ObjectLoad*(a2: pointer): cint {.importc:"AG_ObjectLoad", libag_core.}
proc AG_ObjectLoadFromFile*(a2: pointer; a3: cstring): cint {.importc:"AG_ObjectLoadFromFile", libag_core.}
proc AG_ObjectLoadData*(a2: pointer; a3: ptr cint): cint {.importc:"AG_ObjectLoadData", libag_core.}
proc AG_ObjectLoadDataFromFile*(a2: pointer; a3: ptr cint; a4: cstring): cint {.importc:"AG_ObjectLoadDataFromFile", libag_core.}
proc AG_ObjectLoadGeneric*(a2: pointer): cint {.importc:"AG_ObjectLoadGeneric", libag_core.}
proc AG_ObjectLoadGenericFromFile*(a2: pointer; a3: cstring): cint {.importc:"AG_ObjectLoadGenericFromFile", libag_core.}
proc AG_ObjectResolveDeps*(a2: pointer): cint {.importc:"AG_ObjectResolveDeps", libag_core.}
proc AG_ObjectReadHeader*(a2: ptr AG_DataSource; a3: ptr AG_ObjectHeader): cint {.importc:"AG_ObjectReadHeader", libag_core.}
proc AG_ObjectLoadVariables*(a2: pointer; a3: ptr AG_DataSource): cint {.importc:"AG_ObjectLoadVariables", libag_core.}
proc AG_ObjectAddDep*(a2: pointer; a3: pointer; a4: cint): ptr AG_ObjectDep {.importc:"AG_ObjectAddDep", libag_core.}
proc AG_ObjectFindDep*(a2: pointer; a3: uint32; a4: ptr pointer): cint {.importc:"AG_ObjectFindDep", libag_core.}
proc AG_ObjectDelDep*(a2: pointer; a3: pointer) {.importc:"AG_ObjectDelDep", libag_core.}
proc AG_ObjectEncodeName*(a2: pointer; a3: pointer): uint32 {.importc:"AG_ObjectEncodeName", libag_core.}
# proc AG_ObjectEdit*(a2: pointer): pointer {.importc:"AG_ObjectEdit", libag_core.}
proc AG_ObjectGenName*(a2: pointer; a3: ptr AG_ObjectClass; a4: cstring; a5: csize) {.importc:"AG_ObjectGenName", libag_core.}
proc AG_ObjectGenNamePfx*(a2: pointer; a3: cstring; a4: cstring; a5: csize) {.importc:"AG_ObjectGenNamePfx", libag_core.}
# proc AG_Snprintf*(a2: cstring; a3: csize; a4: cstring): csize {.importc:"AG_Snprintf", varargs, libag_core.}
proc AG_Printf*(a2: cstring): cstring {.importc:"AG_Printf", varargs, libag_core.}
proc AG_PrintfN*(a2: cuint; a3: cstring): cstring {.importc:"AG_PrintfN", varargs, libag_core.}
proc AG_PrintfP*(a2: cstring): ptr AG_FmtString {.importc:"AG_PrintfP", varargs, libag_core.}
proc AG_RegisterFmtStringExt*(a2: cstring; a3: AG_FmtStringExtFn) {.importc:"AG_RegisterFmtStringExt", libag_core.}
proc AG_UnregisterFmtStringExt*(a2: cstring) {.importc:"AG_UnregisterFmtStringExt", libag_core.}
proc AG_ProcessFmtString*(a2: ptr AG_FmtString; a3: cstring; a4: csize): csize {.importc:"AG_ProcessFmtString", libag_core.}
proc AG_FreeFmtString*(a2: ptr AG_FmtString) {.importc:"AG_FreeFmtString", libag_core.}
proc AG_Strsep*(a2: cstringArray; a3: cstring): cstring {.importc:"AG_Strsep", libag_core.}
proc AG_Strdup*(a2: cstring): cstring {.importc:"AG_Strdup", libag_core.}
proc AG_TryStrdup*(a2: cstring): cstring {.importc:"AG_TryStrdup", libag_core.}
proc AG_Strlcpy*(a2: cstring; a3: cstring; a4: csize): csize {.importc:"AG_Strlcpy", libag_core.}
proc AG_Strlcat*(a2: cstring; a3: cstring; a4: csize): csize {.importc:"AG_Strlcat", libag_core.}
proc AG_StrlcpyInt*(a2: cstring; a3: cint; a4: csize): csize {.importc:"AG_StrlcpyInt", libag_core.}
proc AG_StrlcatInt*(a2: cstring; a3: cint; a4: csize): csize {.importc:"AG_StrlcatInt", libag_core.}
proc AG_StrlcpyUint*(a2: cstring; a3: cuint; a4: csize): csize {.importc:"AG_StrlcpyUint", libag_core.}
proc AG_StrlcatUint*(a2: cstring; a3: cuint; a4: csize): csize {.importc:"AG_StrlcatUint", libag_core.}
proc AG_Strcasestr*(a2: cstring; a3: cstring): cstring {.importc:"AG_Strcasestr", libag_core.}
proc AG_StrReverse*(a2: cstring) {.importc:"AG_StrReverse", libag_core.}
proc AG_ImportUnicode*(a2: cstring; a3: cstring; a4: ptr csize; a5: ptr csize): ptr uint32 {.importc:"AG_ImportUnicode", libag_core.}
proc AG_ExportUnicode*(a2: cstring; a3: cstring; a4: ptr uint32; a5: csize): cint {.importc:"AG_ExportUnicode", libag_core.}
proc AG_InitStringSubsystem*(): cint {.importc:"AG_InitStringSubsystem", libag_core.}
proc AG_DestroyStringSubsystem*() {.importc:"AG_DestroyStringSubsystem", libag_core.}
proc AG_TblNew*(a2: cuint; a3: cuint): ptr AG_Tbl {.importc:"AG_TblNew", libag_core.}
proc AG_TblInit*(a2: ptr AG_Tbl; a3: cuint; a4: cuint): cint {.importc:"AG_TblInit", libag_core.}
proc AG_TblDestroy*(a2: ptr AG_Tbl) {.importc:"AG_TblDestroy", libag_core.}
proc AG_TblLookupHash*(a2: ptr AG_Tbl; a3: cuint; a4: cstring): ptr AG_Variable {.importc:"AG_TblLookupHash", libag_core.}
proc AG_TblExistsHash*(a2: ptr AG_Tbl; a3: cuint; a4: cstring): cint {.importc:"AG_TblExistsHash", libag_core.}
proc AG_TblInsertHash*(a2: ptr AG_Tbl; a3: cuint; a4: cstring; a5: ptr AG_Variable): cint {.importc:"AG_TblInsertHash", libag_core.}
proc AG_TblDeleteHash*(a2: ptr AG_Tbl; a3: cuint; a4: cstring): cint {.importc:"AG_TblDeleteHash", libag_core.}
proc AG_TextNew*(a2: csize): ptr AG_Text {.importc:"AG_TextNew", libag_core.}
proc AG_TextInit*(a2: ptr AG_Text; a3: csize) {.importc:"AG_TextInit", libag_core.}
proc AG_TextDestroy*(a2: ptr AG_Text) {.importc:"AG_TextDestroy", libag_core.}
proc AG_TextClear*(a2: ptr AG_Text) {.importc:"AG_TextClear", libag_core.}
proc AG_TextSet*(a2: ptr AG_Text; a3: cstring): cint {.importc:"AG_TextSet", varargs, libag_core.}
proc AG_TextSetEnt*(a2: ptr AG_Text; a3: AG_Language; a4: cstring): cint {.importc:"AG_TextSetEnt", varargs, libag_core.}
proc AG_TextSetEntS*(a2: ptr AG_Text; a3: AG_Language; a4: cstring): cint {.importc:"AG_TextSetEntS", libag_core.}
proc AG_TextSetLangISO*(a2: ptr AG_Text; a3: cstring): cint {.importc:"AG_TextSetLangISO", libag_core.}
proc AG_TextGetLangISO*(a2: ptr AG_Text): cstring {.importc:"AG_TextGetLangISO", libag_core.}
proc AG_TextDup*(a2: ptr AG_Text): ptr AG_Text {.importc:"AG_TextDup", libag_core.}
proc AG_TextLoad*(a2: ptr AG_Text; a3: ptr AG_DataSource): cint {.importc:"AG_TextLoad", libag_core.}
proc AG_TextSave*(a2: ptr AG_DataSource; a3: ptr AG_Text) {.importc:"AG_TextSave", libag_core.}
proc AG_SetTimeOps*(a2: ptr AG_TimeOps) {.importc:"AG_SetTimeOps", libag_core.}
proc AG_InitTimers*() {.importc:"AG_InitTimers", libag_core.}
proc AG_DestroyTimers*() {.importc:"AG_DestroyTimers", libag_core.}
proc AG_InitTimer*(a2: ptr AG_Timer; a3: cstring; a4: cuint) {.importc:"AG_InitTimer", libag_core.}
proc AG_AddTimer*(a2: pointer; a3: ptr AG_Timer; a4: uint32; a5: AG_TimerFn; a6: cstring): cint {.importc:"AG_AddTimer", varargs, libag_core.}
proc AG_AddTimerAuto*(a2: pointer; a3: uint32; a4: AG_TimerFn; a5: cstring): ptr AG_Timer {.importc:"AG_AddTimerAuto", varargs, libag_core.}
proc AG_DelTimer*(a2: pointer; a3: ptr AG_Timer) {.importc:"AG_DelTimer", libag_core.}
proc AG_DelTimers*(a2: pointer) {.importc:"AG_DelTimers", libag_core.}
proc AG_ResetTimer*(a2: pointer; a3: ptr AG_Timer; a4: uint32): cint {.importc:"AG_ResetTimer", libag_core.}
proc AG_TimerIsRunning*(a2: pointer; a3: ptr AG_Timer): cint {.importc:"AG_TimerIsRunning", libag_core.}
proc AG_TimerWait*(a2: pointer; a3: ptr AG_Timer; a4: uint32): cint {.importc:"AG_TimerWait", libag_core.}
proc AG_ProcessTimeouts*(a2: uint32) {.importc:"AG_ProcessTimeouts", libag_core.}
proc AG_TreeNew*(): ptr AG_Tree {.importc:"AG_TreeNew", libag_core.}
proc AG_TreeDestroy*(a2: ptr AG_Tree) {.importc:"AG_TreeDestroy", libag_core.}
proc AG_UserNew*(): ptr AG_User {.importc:"AG_UserNew", libag_core.}
proc AG_UserFree*(a2: ptr AG_User) {.importc:"AG_UserFree", libag_core.}
proc AG_SetUserOps*(a2: ptr AG_UserOps) {.importc:"AG_SetUserOps", libag_core.}
proc AG_EvalVariable*(a2: pointer; a3: ptr AG_Variable): cint {.importc:"AG_EvalVariable", libag_core.}
proc AG_PrintVariable*(a2: cstring; a3: csize; a4: ptr AG_Variable) {.importc:"AG_PrintVariable", libag_core.}
proc AG_GetVariableVFS*(a2: pointer; a3: cstring): ptr AG_Variable {.importc:"AG_GetVariableVFS", libag_core.}
proc AG_GetVariable*(a2: pointer; a3: cstring): ptr AG_Variable {.importc:"AG_GetVariable", varargs, libag_core.}
proc AG_CopyVariable*(a2: ptr AG_Variable; a3: ptr AG_Variable): cint {.importc:"AG_CopyVariable", libag_core.}
proc AG_DerefVariable*(a2: ptr AG_Variable; a3: ptr AG_Variable): cint {.importc:"AG_DerefVariable", libag_core.}
proc AG_CompareVariables*(a2: ptr AG_Variable; a3: ptr AG_Variable): cint {.importc:"AG_CompareVariables", libag_core.}
proc AG_Unset*(a2: pointer; a3: cstring) {.importc:"AG_Unset", libag_core.}
proc AG_VariableSubst*(a2: pointer; a3: cstring; a4: cstring; a5: csize) {.importc:"AG_VariableSubst", libag_core.}
proc AG_GetUint*(a2: pointer; a3: cstring): cuint {.importc:"AG_GetUint", libag_core.}
proc AG_InitUint*(a2: ptr AG_Variable; a3: cuint) {.importc:"AG_InitUint", libag_core.}
proc AG_SetUint*(a2: pointer; a3: cstring; a4: cuint): ptr AG_Variable {.importc:"AG_SetUint", libag_core.}
proc AG_BindUint*(a2: pointer; a3: cstring; a4: ptr cuint): ptr AG_Variable {.importc:"AG_BindUint", libag_core.}
proc AG_BindUintFn*(a2: pointer; a3: cstring; a4: AG_UintFn; a5: cstring): ptr AG_Variable {.importc:"AG_BindUintFn", varargs, libag_core.}
proc AG_BindUintMp*(a2: pointer; a3: cstring; a4: ptr cuint; a5: ptr AG_Mutex): ptr AG_Variable {.importc:"AG_BindUintMp", libag_core.}
proc AG_GetInt*(a2: pointer; a3: cstring): cint {.importc:"AG_GetInt", libag_core.}
proc AG_SetInt*(a2: pointer; a3: cstring; a4: cint): ptr AG_Variable {.importc:"AG_SetInt", libag_core.}
proc AG_InitInt*(a2: ptr AG_Variable; a3: cint) {.importc:"AG_InitInt", libag_core.}
proc AG_BindInt*(a2: pointer; a3: cstring; a4: ptr cint): ptr AG_Variable {.importc:"AG_BindInt", libag_core.}
proc AG_BindIntFn*(a2: pointer; a3: cstring; a4: AG_IntFn; a5: cstring): ptr AG_Variable {.importc:"AG_BindIntFn", varargs, libag_core.}
proc AG_BindIntMp*(a2: pointer; a3: cstring; a4: ptr cint; a5: ptr AG_Mutex): ptr AG_Variable {.importc:"AG_BindIntMp", libag_core.}
proc AG_GetUlong*(a2: pointer; a3: cstring): culong {.importc:"AG_GetUlong", libag_core.}
proc AG_InitUlong*(a2: ptr AG_Variable; a3: culong) {.importc:"AG_InitUlong", libag_core.}
proc AG_SetUlong*(a2: pointer; a3: cstring; a4: culong): ptr AG_Variable {.importc:"AG_SetUlong", libag_core.}
proc AG_BindUlong*(a2: pointer; a3: cstring; a4: ptr culong): ptr AG_Variable {.importc:"AG_BindUlong", libag_core.}
proc AG_BindUlongFn*(a2: pointer; a3: cstring; a4: AG_UlongFn; a5: cstring): ptr AG_Variable {.importc:"AG_BindUlongFn", varargs, libag_core.}
proc AG_BindUlongMp*(a2: pointer; a3: cstring; a4: ptr culong; a5: ptr AG_Mutex): ptr AG_Variable {.importc:"AG_BindUlongMp", libag_core.}
proc AG_GetLong*(a2: pointer; a3: cstring): clong {.importc:"AG_GetLong", libag_core.}
proc AG_SetLong*(a2: pointer; a3: cstring; a4: clong): ptr AG_Variable {.importc:"AG_SetLong", libag_core.}
proc AG_InitLong*(a2: ptr AG_Variable; a3: clong) {.importc:"AG_InitLong", libag_core.}
proc AG_BindLong*(a2: pointer; a3: cstring; a4: ptr clong): ptr AG_Variable {.importc:"AG_BindLong", libag_core.}
proc AG_BindLongFn*(a2: pointer; a3: cstring; a4: AG_LongFn; a5: cstring): ptr AG_Variable {.importc:"AG_BindLongFn", varargs, libag_core.}
proc AG_BindLongMp*(a2: pointer; a3: cstring; a4: ptr clong; a5: ptr AG_Mutex): ptr AG_Variable {.importc:"AG_BindLongMp", libag_core.}
proc AG_GetUint8*(a2: pointer; a3: cstring): uint8 {.importc:"AG_GetUint8", libag_core.}
proc AG_SetUint8*(a2: pointer; a3: cstring; a4: uint8): ptr AG_Variable {.importc:"AG_SetUint8", libag_core.}
proc AG_InitUint8*(a2: ptr AG_Variable; a3: uint8) {.importc:"AG_InitUint8", libag_core.}
proc AG_BindUint8*(a2: pointer; a3: cstring; a4: ptr uint8): ptr AG_Variable {.importc:"AG_BindUint8", libag_core.}
proc AG_BindUint8Fn*(a2: pointer; a3: cstring; a4: AG_Uint8Fn; a5: cstring): ptr AG_Variable {.importc:"AG_BindUint8Fn", varargs, libag_core.}
proc AG_BindUint8Mp*(a2: pointer; a3: cstring; a4: ptr uint8; a5: ptr AG_Mutex): ptr AG_Variable {.importc:"AG_BindUint8Mp", libag_core.}
proc AG_GetSint8*(a2: pointer; a3: cstring): int8 {.importc:"AG_GetSint8", libag_core.}
proc AG_SetSint8*(a2: pointer; a3: cstring; a4: int8): ptr AG_Variable {.importc:"AG_SetSint8", libag_core.}
proc AG_InitSint8*(a2: ptr AG_Variable; a3: int8) {.importc:"AG_InitSint8", libag_core.}
proc AG_BindSint8*(a2: pointer; a3: cstring; a4: ptr int8): ptr AG_Variable {.importc:"AG_BindSint8", libag_core.}
proc AG_BindSint8Fn*(a2: pointer; a3: cstring; a4: AG_Sint8Fn; a5: cstring): ptr AG_Variable {.importc:"AG_BindSint8Fn", varargs, libag_core.}
proc AG_BindSint8Mp*(a2: pointer; a3: cstring; a4: ptr int8; a5: ptr AG_Mutex): ptr AG_Variable {.importc:"AG_BindSint8Mp", libag_core.}
proc AG_GetUint16*(a2: pointer; a3: cstring): uint16 {.importc:"AG_GetUint16", libag_core.}
proc AG_SetUint16*(a2: pointer; a3: cstring; a4: uint16): ptr AG_Variable {.importc:"AG_SetUint16", libag_core.}
proc AG_InitUint16*(a2: ptr AG_Variable; a3: uint16) {.importc:"AG_InitUint16", libag_core.}
proc AG_BindUint16*(a2: pointer; a3: cstring; a4: ptr uint16): ptr AG_Variable {.importc:"AG_BindUint16", libag_core.}
proc AG_BindUint16Fn*(a2: pointer; a3: cstring; a4: AG_Uint16Fn; a5: cstring): ptr AG_Variable {.importc:"AG_BindUint16Fn", varargs, libag_core.}
proc AG_BindUint16Mp*(a2: pointer; a3: cstring; a4: ptr uint16; a5: ptr AG_Mutex): ptr AG_Variable {.importc:"AG_BindUint16Mp", libag_core.}
proc AG_GetSint16*(a2: pointer; a3: cstring): int16 {.importc:"AG_GetSint16", libag_core.}
proc AG_SetSint16*(a2: pointer; a3: cstring; a4: int16): ptr AG_Variable {.importc:"AG_SetSint16", libag_core.}
proc AG_InitSint16*(a2: ptr AG_Variable; a3: int16) {.importc:"AG_InitSint16", libag_core.}
proc AG_BindSint16Fn*(a2: pointer; a3: cstring; a4: AG_Sint16Fn; a5: cstring): ptr AG_Variable {.importc:"AG_BindSint16Fn", varargs, libag_core.}
proc AG_BindSint16*(a2: pointer; a3: cstring; a4: ptr int16): ptr AG_Variable {.importc:"AG_BindSint16", libag_core.}
proc AG_BindSint16Mp*(a2: pointer; a3: cstring; a4: ptr int16; a5: ptr AG_Mutex): ptr AG_Variable {.importc:"AG_BindSint16Mp", libag_core.}
proc AG_GetUint32*(a2: pointer; a3: cstring): uint32 {.importc:"AG_GetUint32", libag_core.}
proc AG_SetUint32*(a2: pointer; a3: cstring; a4: uint32): ptr AG_Variable {.importc:"AG_SetUint32", libag_core.}
proc AG_InitUint32*(a2: ptr AG_Variable; a3: uint32) {.importc:"AG_InitUint32", libag_core.}
proc AG_BindUint32Fn*(a2: pointer; a3: cstring; a4: AG_Uint32Fn; a5: cstring): ptr AG_Variable {.importc:"AG_BindUint32Fn", varargs, libag_core.}
proc AG_BindUint32*(a2: pointer; a3: cstring; a4: ptr uint32): ptr AG_Variable {.importc:"AG_BindUint32", libag_core.}
proc AG_BindUint32Mp*(a2: pointer; a3: cstring; a4: ptr uint32; a5: ptr AG_Mutex): ptr AG_Variable {.importc:"AG_BindUint32Mp", libag_core.}
proc AG_GetSint32*(a2: pointer; a3: cstring): int32 {.importc:"AG_GetSint32", libag_core.}
proc AG_SetSint32*(a2: pointer; a3: cstring; a4: int32): ptr AG_Variable {.importc:"AG_SetSint32", libag_core.}
proc AG_InitSint32*(a2: ptr AG_Variable; a3: int32) {.importc:"AG_InitSint32", libag_core.}
proc AG_BindSint32Fn*(a2: pointer; a3: cstring; a4: AG_Sint32Fn; a5: cstring): ptr AG_Variable {.importc:"AG_BindSint32Fn", varargs, libag_core.}
proc AG_BindSint32*(a2: pointer; a3: cstring; a4: ptr int32): ptr AG_Variable {.importc:"AG_BindSint32", libag_core.}
proc AG_BindSint32Mp*(a2: pointer; a3: cstring; a4: ptr int32; a5: ptr AG_Mutex): ptr AG_Variable {.importc:"AG_BindSint32Mp", libag_core.}
proc AG_GetUint64*(a2: pointer; a3: cstring): uint64 {.importc:"AG_GetUint64", libag_core.}
proc AG_SetUint64*(a2: pointer; a3: cstring; a4: uint64): ptr AG_Variable {.importc:"AG_SetUint64", libag_core.}
proc AG_InitUint64*(a2: ptr AG_Variable; a3: uint64) {.importc:"AG_InitUint64", libag_core.}
proc AG_BindUint64Fn*(a2: pointer; a3: cstring; a4: AG_Uint64Fn; a5: cstring): ptr AG_Variable {.importc:"AG_BindUint64Fn", varargs, libag_core.}
proc AG_BindUint64*(a2: pointer; a3: cstring; a4: ptr uint64): ptr AG_Variable {.importc:"AG_BindUint64", libag_core.}
proc AG_BindUint64Mp*(a2: pointer; a3: cstring; a4: ptr uint64; a5: ptr AG_Mutex): ptr AG_Variable {.importc:"AG_BindUint64Mp", libag_core.}
proc AG_GetSint64*(a2: pointer; a3: cstring): int64 {.importc:"AG_GetSint64", libag_core.}
proc AG_SetSint64*(a2: pointer; a3: cstring; a4: int64): ptr AG_Variable {.importc:"AG_SetSint64", libag_core.}
proc AG_InitSint64*(a2: ptr AG_Variable; a3: int64) {.importc:"AG_InitSint64", libag_core.}
proc AG_BindSint64Fn*(a2: pointer; a3: cstring; a4: AG_Sint64Fn; a5: cstring): ptr AG_Variable {.importc:"AG_BindSint64Fn", varargs, libag_core.}
proc AG_BindSint64*(a2: pointer; a3: cstring; a4: ptr int64): ptr AG_Variable {.importc:"AG_BindSint64", libag_core.}
proc AG_BindSint64Mp*(a2: pointer; a3: cstring; a4: ptr int64; a5: ptr AG_Mutex): ptr AG_Variable {.importc:"AG_BindSint64Mp", libag_core.}
proc AG_GetFloat*(a2: pointer; a3: cstring): cfloat {.importc:"AG_GetFloat", libag_core.}
proc AG_SetFloat*(a2: pointer; a3: cstring; a4: cfloat): ptr AG_Variable {.importc:"AG_SetFloat", libag_core.}
proc AG_InitFloat*(a2: ptr AG_Variable; a3: cfloat) {.importc:"AG_InitFloat", libag_core.}
proc AG_BindFloatFn*(a2: pointer; a3: cstring; a4: AG_FloatFn; a5: cstring): ptr AG_Variable {.importc:"AG_BindFloatFn", varargs, libag_core.}
proc AG_BindFloat*(a2: pointer; a3: cstring; a4: ptr cfloat): ptr AG_Variable {.importc:"AG_BindFloat", libag_core.}
proc AG_BindFloatMp*(a2: pointer; a3: cstring; a4: ptr cfloat; a5: ptr AG_Mutex): ptr AG_Variable {.importc:"AG_BindFloatMp", libag_core.}
proc AG_GetDouble*(a2: pointer; a3: cstring): cdouble {.importc:"AG_GetDouble", libag_core.}
proc AG_SetDouble*(a2: pointer; a3: cstring; a4: cdouble): ptr AG_Variable {.importc:"AG_SetDouble", libag_core.}
proc AG_InitDouble*(a2: ptr AG_Variable; a3: cdouble) {.importc:"AG_InitDouble", libag_core.}
proc AG_BindDoubleFn*(a2: pointer; a3: cstring; a4: AG_DoubleFn; a5: cstring): ptr AG_Variable {.importc:"AG_BindDoubleFn", varargs, libag_core.}
proc AG_BindDouble*(a2: pointer; a3: cstring; a4: ptr cdouble): ptr AG_Variable {.importc:"AG_BindDouble", libag_core.}
proc AG_BindDoubleMp*(a2: pointer; a3: cstring; a4: ptr cdouble; a5: ptr AG_Mutex): ptr AG_Variable {.importc:"AG_BindDoubleMp", libag_core.}
proc AG_GetString*(a2: pointer; a3: cstring; a4: cstring; a5: csize): csize {.importc:"AG_GetString", libag_core.}
proc AG_GetStringDup*(a2: pointer; a3: cstring): cstring {.importc:"AG_GetStringDup", libag_core.}
proc AG_GetStringP*(a2: pointer; a3: cstring): cstring {.importc:"AG_GetStringP", libag_core.}
proc AG_SetString*(a2: pointer; a3: cstring; a4: cstring): ptr AG_Variable {.importc:"AG_SetString", libag_core.}
proc AG_SetStringNODUP*(a2: pointer; a3: cstring; a4: cstring): ptr AG_Variable {.importc:"AG_SetStringNODUP", libag_core.}
proc AG_InitString*(a2: ptr AG_Variable; a3: cstring) {.importc:"AG_InitString", libag_core.}
proc AG_InitStringNODUP*(a2: ptr AG_Variable; a3: cstring) {.importc:"AG_InitStringNODUP", libag_core.}
proc AG_PrtString*(a2: pointer; a3: cstring; a4: cstring): ptr AG_Variable {.importc:"AG_PrtString", varargs, libag_core.}
proc AG_BindString*(a2: pointer; a3: cstring; a4: cstring; a5: csize): ptr AG_Variable {.importc:"AG_BindString", libag_core.}
proc AG_BindStringFn*(a2: pointer; a3: cstring; a4: AG_StringFn; a5: cstring): ptr AG_Variable {.importc:"AG_BindStringFn", varargs, libag_core.}
proc AG_BindStringMp*(a2: pointer; a3: cstring; a4: cstring; a5: csize; a6: ptr AG_Mutex): ptr AG_Variable {.importc:"AG_BindStringMp", libag_core.}
proc AG_GetPointer*(a2: pointer; a3: cstring): pointer {.importc:"AG_GetPointer", libag_core.}
proc AG_SetPointer*(a2: pointer; a3: cstring; a4: pointer): ptr AG_Variable {.importc:"AG_SetPointer", libag_core.}
proc AG_InitPointer*(a2: ptr AG_Variable; a3: pointer) {.importc:"AG_InitPointer", libag_core.}
proc AG_BindPointer*(a2: pointer; a3: cstring; a4: ptr pointer): ptr AG_Variable {.importc:"AG_BindPointer", libag_core.}
proc AG_BindPointerFn*(a2: pointer; a3: cstring; a4: AG_PointerFn; a5: cstring): ptr AG_Variable {.importc:"AG_BindPointerFn", varargs, libag_core.}
proc AG_BindPointerMp*(a2: pointer; a3: cstring; a4: ptr pointer; a5: ptr AG_Mutex): ptr AG_Variable {.importc:"AG_BindPointerMp", libag_core.}
proc AG_BindFlag*(a2: pointer; a3: cstring; a4: ptr cuint; a5: cuint): ptr AG_Variable {.importc:"AG_BindFlag", libag_core.}
proc AG_BindFlagMp*(a2: pointer; a3: cstring; a4: ptr cuint; a5: cuint; a6: ptr AG_Mutex): ptr AG_Variable {.importc:"AG_BindFlagMp", libag_core.}
proc AG_BindFlag8*(a2: pointer; a3: cstring; a4: ptr uint8; a5: uint8): ptr AG_Variable {.importc:"AG_BindFlag8", libag_core.}
proc AG_BindFlag8Mp*(a2: pointer; a3: cstring; a4: ptr uint8; a5: uint8; a6: ptr AG_Mutex): ptr AG_Variable {.importc:"AG_BindFlag8Mp", libag_core.}
proc AG_BindFlag16*(a2: pointer; a3: cstring; a4: ptr uint16; a5: uint16): ptr AG_Variable {.importc:"AG_BindFlag16", libag_core.}
proc AG_BindFlag16Mp*(a2: pointer; a3: cstring; a4: ptr uint16; a5: uint16; a6: ptr AG_Mutex): ptr AG_Variable {.importc:"AG_BindFlag16Mp", libag_core.}
proc AG_BindFlag32*(a2: pointer; a3: cstring; a4: ptr uint32; a5: uint32): ptr AG_Variable {.importc:"AG_BindFlag32", libag_core.}
proc AG_BindFlag32Mp*(a2: pointer; a3: cstring; a4: ptr uint32; a5: uint32; a6: ptr AG_Mutex): ptr AG_Variable {.importc:"AG_BindFlag32Mp", libag_core.}
proc AG_BindObject*(a2: pointer; a3: cstring; a4: pointer): ptr AG_Variable {.importc:"AG_BindObject", libag_core.}
proc AG_BindVariable*(a2: pointer; a3: cstring; a4: pointer; a5: cstring): ptr AG_Variable {.importc:"AG_BindVariable", libag_core.}
proc AG_GetVersion*(a2: ptr AG_AgarVersion) {.importc:"AG_GetVersion", libag_core.}
when defined(ag_web):
  proc WEB_Init*(a2: cuint; a3: cint) {.importc:"WEB_Init", libag_core.}
  proc WEB_Destroy*() {.importc:"WEB_Destroy", libag_core.}
  proc WEB_CheckSignals*() {.importc:"WEB_CheckSignals", libag_core.}
  proc WEB_RegisterModule*(a2: ptr WEB_ModuleClass) {.importc:"WEB_RegisterModule", libag_core.}
  proc WEB_SetLogFile*(a2: cstring) {.importc:"WEB_SetLogFile", libag_core.}
  proc WEB_SetLogFn*(a2: WEB_LogFn) {.importc:"WEB_SetLogFn", libag_core.}
  proc WEB_Exit*(a2: cint; a3: cstring) {.importc:"WEB_Exit", varargs, libag_core.}
  proc WEB_SetLanguageFn*(a2: WEB_LanguageFn; a3: pointer) {.importc:"WEB_SetLanguageFn", libag_core.}
  proc WEB_SetMenuFn*(a2: WEB_MenuFn; a3: pointer) {.importc:"WEB_SetMenuFn", libag_core.}
  proc WEB_SetDestroyFn*(a2: WEB_DestroyFn) {.importc:"WEB_SetDestroyFn", libag_core.}
  proc WEB_WorkerMain*(a2: ptr WEB_SessionOps; a3: ptr WEB_Query; a4: cstring; a5: cstring; a6: cstring; a7: array[2, cint]; a8: cint): cint {.importc:"WEB_WorkerMain", libag_core.}
  proc WEB_QueryLoop*(a2: cstring; a3: cstring; a4: ptr WEB_SessionOps) {.importc:"WEB_QueryLoop", libag_core.}
  proc WEB_ControlCommand*(a2: cuint; a3: ptr WEB_ControlCmd): cint {.importc:"WEB_ControlCommand", libag_core.}
  proc WEB_ControlCommandS*(a2: cuint; a3: cstring): cint {.importc:"WEB_ControlCommandS", libag_core.}
  proc WEB_QueryInit*(a2: ptr WEB_Query; a3: cstring) {.importc:"WEB_QueryInit", libag_core.}
  proc WEB_QueryDestroy*(a2: ptr WEB_Query) {.importc:"WEB_QueryDestroy", libag_core.}
  proc WEB_QueryLoad*(a2: ptr WEB_Query; a3: pointer; a4: csize): cint {.importc:"WEB_QueryLoad", libag_core.}
  proc WEB_QuerySave*(a2: cint; a3: ptr WEB_Query): cint {.importc:"WEB_QuerySave", libag_core.}
  proc WEB_QueryReadHTTP*(a2: ptr WEB_Query): cint {.importc:"WEB_QueryReadHTTP", libag_core.}
  proc WEB_BeginFrontQuery*(a2: ptr WEB_Query; a3: cstring; a4: ptr WEB_SessionOps) {.importc:"WEB_BeginFrontQuery", libag_core.}
  proc WEB_BeginWorkerQuery*(a2: ptr WEB_Query) {.importc:"WEB_BeginWorkerQuery", libag_core.}
  proc WEB_ExecWorkerQuery*(a2: ptr WEB_Query; a3: ptr WEB_SessionOps): cint {.importc:"WEB_ExecWorkerQuery", libag_core.}
  proc WEB_FlushQuery*(a2: ptr WEB_Query) {.importc:"WEB_FlushQuery", libag_core.}
  proc WEB_ProcessQuery*(a2: ptr WEB_Query; a3: ptr WEB_SessionOps; a4: pointer; a5: csize): cint {.importc:"WEB_ProcessQuery", libag_core.}
  proc WEB_EditHeader*(a2: ptr WEB_Query; a3: cstring; a4: cstring) {.importc:"WEB_EditHeader", libag_core.}
  proc WEB_SetCookie*(a2: ptr WEB_Query; a3: cstring; a4: cstring): ptr WEB_Cookie {.importc:"WEB_SetCookie", varargs, libag_core.}
  proc WEB_SetCookieS*(a2: ptr WEB_Query; a3: cstring; a4: cstring): ptr WEB_Cookie {.importc:"WEB_SetCookieS", libag_core.}
  proc WEB_DelCookie*(a2: ptr WEB_Query; a3: cstring) {.importc:"WEB_DelCookie", libag_core.}
  proc WEB_ParseFormUrlEncoded*(a2: ptr WEB_Query; a3: cstring; a4: WEB_ArgumentType): cint {.importc:"WEB_ParseFormUrlEncoded", libag_core.}
  proc WEB_ReadFormData*(a2: ptr WEB_Query; a3: cint): cint {.importc:"WEB_ReadFormData", libag_core.}
  proc WEB_Get*(a2: ptr WEB_Query; a3: cstring; a4: csize): cstring {.importc:"WEB_Get", libag_core.}
  proc WEB_GetTrim*(a2: ptr WEB_Query; a3: cstring; a4: csize): cstring {.importc:"WEB_GetTrim", libag_core.}
  proc WEB_GetInt*(a2: ptr WEB_Query; a3: cstring; a4: ptr cint): cint {.importc:"WEB_GetInt", libag_core.}
  proc WEB_GetUint*(a2: ptr WEB_Query; a3: cstring; a4: ptr cuint): cint {.importc:"WEB_GetUint", libag_core.}
  proc WEB_GetIntR*(a2: ptr WEB_Query; a3: cstring; a4: ptr cint; a5: cint; a6: cint): cint {.importc:"WEB_GetIntR", libag_core.}
  proc WEB_GetUintR*(a2: ptr WEB_Query; a3: cstring; a4: ptr cuint; a5: cuint; a6: cuint): cint {.importc:"WEB_GetUintR", libag_core.}
  proc WEB_GetIntRange*(a2: ptr WEB_Query; a3: cstring; a4: ptr cint; a5: cstring; a6: ptr cint): cint {.importc:"WEB_GetIntRange", libag_core.}
  proc WEB_GetUint64*(a2: ptr WEB_Query; a3: cstring; a4: ptr uint64): cint {.importc:"WEB_GetUint64", libag_core.}
  proc WEB_GetSint64*(a2: ptr WEB_Query; a3: cstring; a4: ptr int64): cint {.importc:"WEB_GetSint64", libag_core.}
  proc WEB_GetEnum*(a2: ptr WEB_Query; a3: cstring; a4: ptr cuint; a5: cuint): cint {.importc:"WEB_GetEnum", libag_core.}
  proc WEB_GetFloat*(a2: ptr WEB_Query; a3: cstring; a4: ptr cfloat): cint {.importc:"WEB_GetFloat", libag_core.}
  proc WEB_GetDouble*(a2: ptr WEB_Query; a3: cstring; a4: ptr cdouble): cint {.importc:"WEB_GetDouble", libag_core.}
  proc WEB_GetBool*(a2: ptr WEB_Query; a3: cstring): cint {.importc:"WEB_GetBool", libag_core.}
  proc WEB_Set*(a2: ptr WEB_Query; a3: cstring; a4: cstring) {.importc:"WEB_Set", varargs, libag_core.}
  proc WEB_SetS*(a2: ptr WEB_Query; a3: cstring; a4: cstring) {.importc:"WEB_SetS", libag_core.}
  proc WEB_Unset*(a2: ptr WEB_Query; a3: cstring): cint {.importc:"WEB_Unset", libag_core.}
  proc WEB_EscapeURL*(a2: ptr WEB_Query; a3: cstring): cstring {.importc:"WEB_EscapeURL", libag_core.}
  proc WEB_UnescapeURL*(a2: ptr WEB_Query; a3: cstring): cstring {.importc:"WEB_UnescapeURL", libag_core.}
  proc WEB_Log*(a2: WEB_LogLvl; a3: cstring) {.importc:"WEB_Log", varargs, libag_core.}
  proc WEB_LogS*(a2: WEB_LogLvl; a3: cstring) {.importc:"WEB_LogS", libag_core.}
  proc WEB_LogErr*(a2: cstring) {.importc:"WEB_LogErr", varargs, libag_core.}
  proc WEB_LogWarn*(a2: cstring) {.importc:"WEB_LogWarn", varargs, libag_core.}
  proc WEB_LogInfo*(a2: cstring) {.importc:"WEB_LogInfo", varargs, libag_core.}
  proc WEB_LogNotice*(a2: cstring) {.importc:"WEB_LogNotice", varargs, libag_core.}
  proc WEB_LogDebug*(a2: cstring) {.importc:"WEB_LogDebug", varargs, libag_core.}
  proc WEB_LogWorker*(a2: cstring) {.importc:"WEB_LogWorker", varargs, libag_core.}
  proc WEB_LogEvent*(a2: cstring) {.importc:"WEB_LogEvent", varargs, libag_core.}
  proc WEB_Printf*(a2: ptr WEB_Query; a3: cstring) {.importc:"WEB_Printf", varargs, libag_core.}
  proc WEB_PutJSON*(a2: ptr WEB_Query; a3: cstring; a4: cstring) {.importc:"WEB_PutJSON", varargs, libag_core.}
  proc WEB_PutJSON_HTML*(a2: ptr WEB_Query; a3: cstring; a4: cstring): cint {.importc:"WEB_PutJSON_HTML", libag_core.}
  proc WEB_VAR_FilterDocument*(a2: ptr WEB_Query; a3: cstring; a4: csize) {.importc:"WEB_VAR_FilterDocument", libag_core.}
  proc WEB_VAR_FilterFragment*(a2: ptr WEB_Query; a3: cstring; a4: csize) {.importc:"WEB_VAR_FilterFragment", libag_core.}
  proc WEB_VAR_Set*(a2: cstring; a3: cstring): ptr WEB_Variable {.importc:"WEB_VAR_Set", varargs, libag_core.}
  proc WEB_VAR_SetS*(a2: cstring; a3: cstring): ptr WEB_Variable {.importc:"WEB_VAR_SetS", libag_core.}
  proc WEB_VAR_SetS_NODUP*(a2: cstring; a3: cstring): ptr WEB_Variable {.importc:"WEB_VAR_SetS_NODUP", libag_core.}
  proc WEB_VAR_SetGlobal*(a2: cstring; a3: cstring): ptr WEB_Variable {.importc:"WEB_VAR_SetGlobal", varargs, libag_core.}
  proc WEB_VAR_SetGlobalS*(a2: cstring; a3: cstring): ptr WEB_Variable {.importc:"WEB_VAR_SetGlobalS", libag_core.}
  proc WEB_VAR_Cat*(a2: ptr WEB_Variable; a3: cstring) {.importc:"WEB_VAR_Cat", varargs, libag_core.}
  proc WEB_VAR_Unset*(a2: cstring) {.importc:"WEB_VAR_Unset", libag_core.}
  proc WEB_VAR_Wipe*(a2: cstring) {.importc:"WEB_VAR_Wipe", libag_core.}
  proc WEB_VAR_Defined*(a2: cstring): cint {.importc:"WEB_VAR_Defined", libag_core.}
  proc WEB_VAR_Free*(a2: ptr WEB_Variable) {.importc:"WEB_VAR_Free", libag_core.}
  proc WEB_OutputHTML*(a2: ptr WEB_Query; a3: cstring): cint {.importc:"WEB_OutputHTML", libag_core.}
  proc WEB_OutputError*(a2: ptr WEB_Query; a3: cstring) {.importc:"WEB_OutputError", libag_core.}
  proc WEB_SetError*(a2: cstring) {.importc:"WEB_SetError", varargs, libag_core.}
  proc WEB_SetErrorS*(a2: cstring) {.importc:"WEB_SetErrorS", libag_core.}
  proc WEB_SetSuccess*(a2: cstring) {.importc:"WEB_SetSuccess", varargs, libag_core.}
  proc WEB_SessionInit*(a2: ptr WEB_Session; a3: ptr WEB_SessionOps) {.importc:"WEB_SessionInit", libag_core.}
  proc WEB_SessionDestroy*(a2: ptr WEB_Session) {.importc:"WEB_SessionDestroy", libag_core.}
  proc WEB_CloseSession*(a2: ptr WEB_Session) {.importc:"WEB_CloseSession", libag_core.}
  proc WEB_SessionLoad*(a2: pointer; a3: cstring): cint {.importc:"WEB_SessionLoad", libag_core.}
  proc WEB_SessionSaveToFD*(a2: pointer; a3: cint): cint {.importc:"WEB_SessionSaveToFD", libag_core.}
  proc WEB_SetSV_ALL*(a2: ptr WEB_SessionOps; a3: cstring; a4: cstring; a5: cstring): cint {.importc:"WEB_SetSV_ALL", libag_core.}
  proc WEB_SetSV*(a2: pointer; a3: cstring; a4: cstring) {.importc:"WEB_SetSV", varargs, libag_core.}
  proc WEB_SetSV_S*(a2: pointer; a3: cstring; a4: cstring) {.importc:"WEB_SetSV_S", libag_core.}
  proc WEB_SetProcTitle*(a2: cstring) {.importc:"WEB_SetProcTitle", varargs, libag_core.}
  proc WEB_PostEventS*(a2: cstring; a3: WEB_EventFilterFn; a4: pointer; a5: cstring; a6: cstring): cint {.importc:"WEB_PostEventS", libag_core.}
  proc WEB_PostEvent*(a2: cstring; a3: WEB_EventFilterFn; a4: pointer; a5: cstring; a6: cstring): cint {.importc:"WEB_PostEvent", varargs, libag_core.}

func AG_Swap16*(x: uint16): uint16 {.inline.} =
  (x shl 8) or (x shr 8) 

func AG_Swap32*(x: uint32): uint32 {.inline.} =
  (x shl 24) or ((x shl 8) and 0x00ff0000) or ((x shr 8) and 0x0000ff00) or (x shr 24)

func AG_Swap64*(x: uint64): uint64 {.inline.} =
  var local_x = x
  let lo = cast[uint32](local_x and 0xffffffffu64)
  local_x = local_x shr 32
  let hi = cast[uint32](x and 0xffffffffu64)
  local_x = AG_Swap32(lo)
  local_x = local_x shl 32
  local_x = local_x or AG_Swap32(hi)
  local_x

func AG_SwapFLT*(v: float32): float32 {.inline.} =
  type
    u = object {.union.}
      i: uint32
      v: float32
  var num: u
  num.v = v
  num.i = AG_Swap32(num.i)
  result = cast[float32](num)

func AG_SwapDBL*(v: float64): float64 {.inline.} =
  type
    u = object {.union.}
      i: uint64
      v: float64
  var num: u
  num.v = v
  num.i = AG_Swap64(num.i)
  result = cast[float64](num)

when cpuEndian == bigEndian:
  template AG_SwapLE(x: uint16): untyped = AG_Swap16(x)
  template AG_SwapLE(x: uint32): untyped = AG_Swap32(x)
  template AG_SwapLE(x: uint64): untyped = AG_Swap64(x)
  template AG_SwapLE(x: float32): untyped = AG_SwapFLT(x)
  template AG_SwapLE(x: float64): untyped = AG_SwapDBL(x)
  template AG_SwapBE(x: uint16): untyped = x
  template AG_SwapBE(x: uint32): untyped = x
  template AG_SwapBE(x: uint64): untyped = x
  template AG_SwapBE(x: float32): untyped = x
  template AG_SwapBE(x: float64): untyped = x
else:
  template AG_SwapBE(x: uint16): untyped = AG_Swap16(x)
  template AG_SwapBE(x: uint32): untyped = AG_Swap32(x)
  template AG_SwapBE(x: uint64): untyped = AG_Swap64(x)
  template AG_SwapBE(x: float32): untyped = AG_SwapFLT(x)
  template AG_SwapBE(x: float64): untyped = AG_SwapDBL(x)
  template AG_SwapLE(x: uint16): untyped = x
  template AG_SwapLE(x: uint32): untyped = x
  template AG_SwapLE(x: uint64): untyped = x
  template AG_SwapLE(x: float32): untyped = x
  template AG_SwapLE(x: float64): untyped = x

template AG_WRITEAT_DEBUGOFFS(ds, pos: untyped): untyped =
  if ds.debug.bool: pos + sizeof(uint32) else: pos

proc AG_ReadUint8*(ds: ptr AG_DataSource): uint8 =
  var i: uint8
  if ds.debug.bool and AG_CheckTypeCode(ds, AG_SOURCE_UINT8) == -1:
    return 0
  if AG_Read(ds, addr(i), sizeof((i))) != 0:
    AG_DataSourceError(ds, nil)
    return 0
  return i

proc AG_ReadUint8v*(ds: ptr AG_DataSource; v: var uint8): cint =
  var i: uint8
  if ds.debug.bool and AG_CheckTypeCode(ds, AG_SOURCE_UINT8) == -1:
    return -1
  if AG_Read(ds, addr(i), sizeof((i))) != 0:
    return -1
  v = i
  return 0

proc AG_WriteUint8*(ds: ptr AG_DataSource; i: uint8) =
  var local_i = i
  if ds.debug.bool:
    AG_WriteTypeCode(ds, AG_SOURCE_UINT8)
  if AG_Write(ds, addr(local_i), sizeof((i))) != 0: AG_DataSourceError(ds, nil)

proc AG_WriteUint8v*(ds: ptr AG_DataSource; i: ptr uint8): cint =
  if ds.debug.bool and AG_WriteTypeCodeE(ds, AG_SOURCE_UINT8) == -1:
    return -1
  return AG_Write(ds, i, sizeof((uint8)))

proc AG_WriteUint8At*(ds: ptr AG_DataSource; i: uint8; pos: Off) =
  var local_i = i
  if ds.debug.bool:
    AG_WriteTypeCodeAt(ds, AG_SOURCE_UINT8, pos)
  if AG_WriteAt(ds, addr(local_i), sizeof((i)), AG_WRITEAT_DEBUGOFFS(ds, pos)) != 0:
    AG_DataSourceError(ds, nil)

proc AG_ReadUint16*(ds: ptr AG_DataSource): uint16 =
  var i: uint16
  if ds.debug.bool and AG_CheckTypeCode(ds, AG_SOURCE_UINT16) == -1:
    return 0
  if AG_Read(ds, addr(i), sizeof((i))) != 0:
    AG_DataSourceError(ds, nil)
    return 0
  return if (ds.byte_order == AG_BYTEORDER_BE): AG_SwapBE(i) else: AG_SwapLE(i)

proc AG_ReadUint16v*(ds: ptr AG_DataSource; v: var uint16): cint =
  var i: uint16
  if ds.debug.bool and AG_CheckTypeCode(ds, AG_SOURCE_UINT16) == -1:
    return -1
  if AG_Read(ds, addr(i), sizeof((i))) != 0:
    return -1
  v = if (ds.byte_order == AG_BYTEORDER_BE): AG_SwapBE(i) else: AG_SwapLE(i)
  return 0

proc AG_WriteUint16*(ds: ptr AG_DataSource; u16: uint16) =
  var i: uint16 = if (ds.byte_order == AG_BYTEORDER_BE): AG_SwapBE(u16) else: AG_SwapLE(u16)
  if ds.debug.bool:
    AG_WriteTypeCode(ds, AG_SOURCE_UINT16)
  if AG_Write(ds, addr(i), sizeof((i))) != 0: AG_DataSourceError(ds, nil)
  
proc AG_WriteUint16v*(ds: ptr AG_DataSource; u16: ptr uint16): cint =
  var i: uint16 = if (ds.byte_order == AG_BYTEORDER_BE): AG_SwapBE(u16[]) else: AG_SwapLE(u16[])
  if ds.debug.bool and AG_WriteTypeCodeE(ds, AG_SOURCE_UINT16) == -1:
    return -1
  return AG_Write(ds, addr(i), sizeof((i)))

proc AG_WriteUint16At*(ds: ptr AG_DataSource; u16: uint16; pos: Off) =
  var i: uint16 = if (ds.byte_order == AG_BYTEORDER_BE): AG_SwapBE(u16) else: AG_SwapLE(u16)
  if ds.debug.bool:
    AG_WriteTypeCodeAt(ds, AG_SOURCE_UINT16, pos)
  if AG_WriteAt(ds, addr(i), sizeof((i)), AG_WRITEAT_DEBUGOFFS(ds, pos)) != 0:
    AG_DataSourceError(ds, nil)

proc AG_ReadUint32*(ds: ptr AG_DataSource): uint32 =
  var i: uint32
  if ds.debug.bool and AG_CheckTypeCode(ds, AG_SOURCE_UINT32) == -1:
    return 0
  if AG_Read(ds, addr(i), sizeof((i))) != 0:
    AG_DataSourceError(ds, nil)
    return 0
  return if (ds.byte_order == AG_BYTEORDER_BE): AG_SwapBE(i) else: AG_SwapLE(i)

proc AG_ReadUint32v*(ds: ptr AG_DataSource; v: var uint32): cint =
  var i: uint32
  if ds.debug.bool and AG_CheckTypeCode(ds, AG_SOURCE_UINT32) == -1:
    return -1
  if AG_Read(ds, addr(i), sizeof((i))) != 0:
    return -1
  v = if (ds.byte_order == AG_BYTEORDER_BE): AG_SwapBE(i) else: AG_SwapLE(i)
  return 0

proc AG_WriteUint32*(ds: ptr AG_DataSource; u32: uint32) =
  var i: uint32 = if (ds.byte_order == AG_BYTEORDER_BE): AG_SwapBE(u32) else: AG_SwapLE(u32)
  if ds.debug.bool:
    AG_WriteTypeCode(ds, AG_SOURCE_UINT32)
  if AG_Write(ds, addr(i), sizeof((i))) != 0: AG_DataSourceError(ds, nil)
  
proc AG_WriteUint32v*(ds: ptr AG_DataSource; u32: var uint32): cint =
  var i: uint32 = if (ds.byte_order == AG_BYTEORDER_BE): AG_SwapBE(u32) else: AG_SwapLE(u32)
  if ds.debug.bool and AG_WriteTypeCodeE(ds, AG_SOURCE_UINT32) == -1:
    return -1
  return AG_Write(ds, addr(i), sizeof((i)))

proc AG_WriteUint32At*(ds: ptr AG_DataSource; u32: uint32; pos: Off) =
  var i: uint32 = if (ds.byte_order == AG_BYTEORDER_BE): AG_SwapBE(u32) else: AG_SwapLE(u32)
  if ds.debug.bool:
    AG_WriteTypeCodeAt(ds, AG_SOURCE_UINT32, pos)
  if AG_WriteAt(ds, addr(i), sizeof((i)), AG_WRITEAT_DEBUGOFFS(ds, pos)) != 0:
    AG_DataSourceError(ds, nil)

proc AG_ReadUint64*(ds: ptr AG_DataSource): uint64 =
  var i: uint64
  if ds.debug.bool and AG_CheckTypeCode(ds, AG_SOURCE_UINT64) == -1:
    return 0
  if AG_Read(ds, addr(i), sizeof((i))) != 0:
    AG_DataSourceError(ds, nil)
    return 0
  return if (ds.byte_order == AG_BYTEORDER_BE): AG_SwapBE(i) else: AG_SwapLE(i)

proc AG_ReadUint64v*(ds: ptr AG_DataSource; v: var uint64): cint =
  var i: uint64
  if ds.debug.bool and AG_CheckTypeCode(ds, AG_SOURCE_UINT64) == -1:
    return -1
  if AG_Read(ds, addr(i), sizeof((i))) != 0:
    return -1
  v = if (ds.byte_order == AG_BYTEORDER_BE): AG_SwapBE(i) else: AG_SwapLE(i)
  return 0

proc AG_WriteUint64*(ds: ptr AG_DataSource; u64: uint64) =
  var i: uint64 = if (ds.byte_order == AG_BYTEORDER_BE): AG_SwapBE(u64) else: AG_SwapLE(u64)
  if ds.debug.bool:
    AG_WriteTypeCode(ds, AG_SOURCE_UINT64)
  if AG_Write(ds, addr(i), sizeof((i))) != 0: AG_DataSourceError(ds, nil)
  
proc AG_WriteUint64v*(ds: ptr AG_DataSource; u64: var uint64): cint =
  var i: uint64 = if (ds.byte_order == AG_BYTEORDER_BE): AG_SwapBE(u64) else: AG_SwapLE(u64)
  if ds.debug.bool and AG_WriteTypeCodeE(ds, AG_SOURCE_UINT64) == -1:
    return -1
  return AG_Write(ds, addr(i), sizeof((i)))

proc AG_WriteUint64At*(ds: ptr AG_DataSource; u64: uint64; pos: Off) =
  var i: uint64 = if (ds.byte_order == AG_BYTEORDER_BE): AG_SwapBE(u64) else: AG_SwapLE(u64)
  if ds.debug.bool:
    AG_WriteTypeCodeAt(ds, AG_SOURCE_UINT64, pos)
  if AG_WriteAt(ds, addr(i), sizeof((i)), AG_WRITEAT_DEBUGOFFS(ds, pos)) != 0:
    AG_DataSourceError(ds, nil)

#[template AG_Readint8*(ds: untyped): untyped =
  (cast[int8](AG_ReadUint8(ds)))

template AG_Readint8v*(ds, v: untyped): untyped =
  AG_ReadUint8v(ds, cast[ptr int8]((v)))

template AG_Writeint8*(ds, v: untyped): untyped =
  AG_WriteUint8((ds), (Uint8)(v))

template AG_Writeint8v*(ds, v: untyped): untyped =
  AG_WriteUint8v((ds), cast[ptr Uint8]((v)))

template AG_Writeint8At*(ds, v, o: untyped): untyped =
  AG_WriteUint8At((ds), (Uint8)(v), (o))

template AG_ReadSint16*(ds: untyped): untyped =
  (cast[Sint16](AG_ReadUint16(ds)))

template AG_ReadSint16v*(ds, v: untyped): untyped =
  AG_ReadUint16v(ds, cast[ptr Sint16]((v)))

template AG_WriteSint16*(ds, v: untyped): untyped =
  AG_WriteUint16((ds), (Uint16)(v))

template AG_WriteSint16v*(ds, v: untyped): untyped =
  AG_WriteUint16v((ds), cast[ptr Uint16]((v)))

template AG_WriteSint16At*(ds, v, o: untyped): untyped =
  AG_WriteUint16At((ds), (Uint16)(v), (o))

template AG_ReadSint32*(ds: untyped): untyped =
  (cast[Sint32](AG_ReadUint32(ds)))

template AG_ReadSint32v*(ds, v: untyped): untyped =
  AG_ReadUint32v(ds, cast[ptr Sint32]((v)))

template AG_WriteSint32*(ds, v: untyped): untyped =
  AG_WriteUint32((ds), (Uint32)(v))

template AG_WriteSint32v*(ds, v: untyped): untyped =
  AG_WriteUint32v((ds), cast[ptr Uint32]((v)))

template AG_WriteSint32At*(ds, v, o: untyped): untyped =
  AG_WriteUint32At((ds), (Uint32)(v), (o))

template AG_ReadSint64*(ds: untyped): untyped =
  (cast[Sint64](AG_ReadUint64(ds)))

template AG_ReadSint64v*(ds, v: untyped): untyped =
  AG_ReadUint64v(ds, cast[ptr Sint64]((v)))

template AG_WriteSint64*(ds, v: untyped): untyped =
  AG_WriteUint64((ds), (Uint64)(v))

template AG_WriteSint64v*(ds, v: untyped): untyped =
  AG_WriteUint64v((ds), cast[ptr Uint64]((v)))

template AG_WriteSint64At*(ds, v, o: untyped): untyped =
  AG_WriteUint64At((ds), (Uint64)(v), (o))

proc AG_MutexInit*(m: ptr AG_Mutex) =
  if pthread_mutex_init(m, nil) != 0: AG_FatalError("pthread_mutex_init")
  
proc AG_MutexTryInit*(m: ptr AG_Mutex): cint =
  var rv: cint = pthread_mutex_init(m, nil)
  if rv != 0:
    AG_SetError("%s", AG_Strerror(rv))
    return -1
  return 0

proc AG_MutexLock*(m: ptr AG_Mutex) =
  if pthread_mutex_lock(m) != 0: AG_FatalError("pthread_mutex_lock")
  
proc AG_MutexUnlock*(m: ptr AG_Mutex) =
  if pthread_mutex_unlock(m) != 0: AG_FatalError("pthread_mutex_unlock")
  
proc AG_MutexDestroy*(m: ptr AG_Mutex) =
  if pthread_mutex_destroy(m) != 0: AG_FatalError("pthread_mutex_destroy")

proc AG_CondInit*(cd: ptr AG_Cond) =
  if pthread_cond_init(cd, nil) != 0: AG_FatalError("pthread_cond_init")
  
proc AG_CondTryInit*(cd: ptr AG_Cond): cint =
  var rv: cint = pthread_cond_init(cd, nil)
  if rv != 0:
    AG_SetError("%s", AG_Strerror(rv))
    return -1
  return 0

proc AG_CondDestroy*(cd: ptr AG_Cond) =
  if pthread_cond_destroy(cd) != 0: AG_FatalError("pthread_cond_destroy")
  
proc AG_CondBroadcast*(cd: ptr AG_Cond) =
  if pthread_cond_broadcast(cd) != 0: AG_FatalError("pthread_cond_broadcast")
  
proc AG_CondSignal*(cd: ptr AG_Cond) =
  if pthread_cond_signal(cd) != 0: AG_FatalError("pthread_cond_signal")

proc AG_ThreadKeyDelete*(k: AG_ThreadKey) =
  if pthread_key_delete(k) != 0: AG_FatalError("pthread_key_delete")
  
proc AG_ThreadKeyTryDelete*(k: AG_ThreadKey): cint =
  var rv: cint = pthread_key_delete(k)
  if rv != 0:
    AG_SetError("%s", AG_Strerror(rv))
    return -1
  return 0

proc AG_ThreadKeySet*(k: AG_ThreadKey; p: pointer) =
  if pthread_setspecific(k, p) != 0: AG_FatalError("pthread_setspecific")
  
proc AG_ThreadKeyTrySet*(k: AG_ThreadKey; p: pointer): cint =
  var rv: cint = pthread_setspecific(k, p)
  if rv != 0:
    AG_SetError("%s", AG_Strerror(rv))
    return -1
  return 0

proc AG_Malloc*(len: csize): pointer =
  var p: pointer = alloc0(len)
  if p.isNil:
    AG_FatalError("malloc")
  return p

proc AG_TryMalloc*(len: csize): pointer =
  var p: pointer = alloc0(len)
  if p.isNil:
    AG_SetErrorS("Out of memory")
    return nil
  return p

proc AG_Realloc*(pOld: pointer; len: csize): pointer =
  var p: pointer = realloc(pOld, len)
  if p.isNil:
    AG_FatalError("realloc")
  return p

proc AG_TryRealloc*(pOld: pointer; len: csize): pointer =
  var p: pointer = realloc(pOld, len)
  if p.isNil:
    AG_SetErrorS("Out of memory")
  return p

template AG_Free*(p: pointer): untyped =
  dealloc(p)

proc AG_DataSourceRealloc*(obj: pointer; size: csize): cint =
  var cs: ptr AG_CoreSource = cast[ptr AG_CoreSource](obj)
  var dataNew: ptr uint8 = cast[ptr uint8](AG_TryRealloc(cs.data, size))
  if dataNew.isNil:
    return -1
  cs.data = dataNew
  cs.size = size
  return 0

proc AG_Tell*(ds: ptr AG_DataSource): Off =
  var pos: Off
  AG_MutexLock(addr(ds.lock))
  pos = if (ds.tell != nil): ds.tell(ds) else: 0
  AG_MutexUnlock(addr(ds.lock))
  return pos

proc AG_Seek*(ds: ptr AG_DataSource; pos: Off; mode: AG_SeekMode): cint =
  var rv: cint
  AG_MutexLock(addr(ds.lock))
  rv = ds.seek(ds, pos, mode)
  AG_MutexUnlock(addr(ds.lock))
  return rv

proc AG_CloseDataSource*(ds: ptr AG_DataSource) =
  ds.close(ds)

proc AG_DataSourceDestroy*(ds: ptr AG_DataSource) =
  AG_MutexDestroy(addr(ds.lock))
  AG_Free(ds)

template AGOBJECTCAST*(ob: untyped): untyped =
  cast[ptr AG_Object](ob)

template AGOBJECT_CLASSCAST*(obj: untyped): untyped =
  cast[ptr AG_ObjectClass](AGOBJECTCAST(obj).cls)

template AGCLASS*(obj: untyped): untyped =
  cast[ptr AG_ObjectClass](obj)

template AG_ObjectRoot*(ob: untyped): untyped =
  (AGOBJECTCAST(ob).root)

template AG_ObjectParent*(ob: untyped): untyped =
  (AGOBJECTCAST(ob).parent)

template AG_OfClass*(obj, cspec: untyped): untyped =
  AG_ClassIsNamed(AGOBJECTCAST(obj).cls, (cspec))

template AGDB_CLASSCAST*(db: ptr AG_Db): untyped =
  cast[ptr AG_DbClass](AGOBJECTCAST(db).cls)

template AG_ObjectLock*(ob: untyped): untyped =
  when defined(AG_THREADS):
    AG_MutexLock(addr(AGOBJECTCAST(ob).lock))
  else:
    discard

template AG_ObjectUnlock*(ob: untyped): untyped =
  when defined(AG_THREADS):
    AG_MutexUnlock(addr(AGOBJECTCAST(ob).lock))
  else:
    discard

template AG_LockVFS*(ob: untyped): untyped =
  when defined(AG_THREADS):
    AG_ObjectLock(AGOBJECTCAST(ob).root)
  else:
    discard

template AG_UnlockVFS*(ob: untyped): untyped =
  when defined(AG_THREADS):
    AG_ObjectUnlock(AGOBJECTCAST(ob).root)
  else:
    discard

##  Test for existence of a key.

proc AG_DbExists*(db: ptr AG_Db; key: ptr AG_Dbt): cint =
  var dbc: ptr AG_DbClass = AGDB_CLASSCAST(db)
  var rv: cint

  AG_ObjectLock(db)
  rv = dbc.exists(db, key)
  AG_ObjectUnlock(db)
  return rv

##  Retrieve a database entry.

proc AG_DbGet*(db: ptr AG_Db; key: ptr AG_Dbt; val: ptr AG_Dbt): cint =
  var dbc: ptr AG_DbClass = AGDB_CLASSCAST(db)
  var rv: cint

  AG_ObjectLock(db)
  rv = dbc.get(db, key, val)
  AG_ObjectUnlock(db)
  return rv

##  Write a database entry.

proc AG_DbPut*(db: ptr AG_Db; key: ptr AG_Dbt; val: ptr AG_Dbt): cint =
  var dbc: ptr AG_DbClass = AGDB_CLASSCAST(db)
  var rv: cint

  AG_ObjectLock(db)
  rv = dbc.put(db, key, val)
  AG_ObjectUnlock(db)
  return rv

##  Delete a database entry.

proc AG_DbDel*(db: ptr AG_Db; key: ptr AG_Dbt): cint =
  var dbc: ptr AG_DbClass = AGDB_CLASSCAST(db)
  var rv: cint

  AG_ObjectLock(db)
  rv = dbc.del(db, key)
  AG_ObjectUnlock(db)
  return rv]#