set(CMAKE_CXX_FLAGS "/MP /W3 /GR- /Gy /std:c++17 /wd4577 /wd4653 /wd4530")
set(CMAKE_CXX_FLAGS_DEBUG "/Zi /Zo /Od /MDd")
set(CMAKE_CXX_FLAGS_RELEASE "/Ox /GS- /MD /DNDEBUG /D_RELEASE")

set(CMAKE_C_FLAGS_DEBUG "/Zi /Zo /Gm /Od /MDd")
set(CMAKE_C_FLAGS_RELEASE "/Ox /GS- /MD /DNDEBUG /D_RELEASE")

set(MSVC_LINKER_FLAGS "/NOLOGO /DYNAMICBASE")

set(CMAKE_MODULE_LINKER_FLAGS "${MSVC_LINKER_FLAGS}")
set(CMAKE_SHARED_LINKER_FLAGS "${MSVC_LINKER_FLAGS}")
set(CMAKE_EXE_LINKER_FLAGS "${MSVC_LINKER_FLAGS}")

set(CMAKE_MODULE_LINKER_FLAGS_DEBUG "/DEBUG /INCREMENTAL")
set(CMAKE_SHARED_LINKER_FLAGS_DEBUG "/DEBUG")
set(CMAKE_EXE_LINKER_FLAGS_DEBUG "/DEBUG")

set(CMAKE_MODULE_LINKER_FLAGS_RELEASE "/OPT:REF /INCREMENTAL")
set(CMAKE_SHARED_LINKER_FLAGS_RELEASE "/OPT:REF")
set(CMAKE_EXE_LINKER_FLAGS_RELEASE "/OPT:REF")