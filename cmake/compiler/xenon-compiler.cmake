set(CXX_COMMON_FLAGS
    /W3             # Set warning level to 3
    /wd4996         # Ignore deprecation warnings
    /GF             # Enable read-only string pooling
    /GS-			# Enable buffer security checks
    /Gm             # Enable minimal rebuild
    /fp:fast		# Fast floating point (less predictable)
    /Os				# Favour small code
    /Gy             # Enable function level linking
    /Zc:wchar_t-    # Set wchar_t as an interal type
    /Zi             # Enable debug info
)

string(REPLACE ";" " " CXX_COMMON_FLAGS "${CXX_COMMON_FLAGS}")

set(CMAKE_CXX_FLAGS "${CXX_COMMON_FLAGS}")
set(CMAKE_CXX_FLAGS_DEBUG "${CXX_COMMON_FLAGS} /MTd")
set(CMAKE_CXX_FLAGS_RELEASE "${CXX_COMMON_FLAGS} /MT /Ox")

# MSVC Common linker flags
set(MSVC_LINKER_FLAGS "/NOLOGO /INCREMENTAL:NO /manifest:no")

set(CMAKE_STATIC_LINKER_FLAGS "${MSVC_LINKER_FLAGS}")
set(CMAKE_MODULE_LINKER_FLAGS "${MSVC_LINKER_FLAGS}")
set(CMAKE_SHARED_LINKER_FLAGS "${MSVC_LINKER_FLAGS}")
set(CMAKE_EXE_LINKER_FLAGS "${MSVC_LINKER_FLAGS}")
#
set(CMAKE_STATIC_LINKER_FLAGS_DEBUG "/DEBUG")
set(CMAKE_MODULE_LINKER_FLAGS_DEBUG "/DEBUG")
set(CMAKE_SHARED_LINKER_FLAGS_DEBUG "/DEBUG")
set(CMAKE_EXE_LINKER_FLAGS_DEBUG "/DEBUG")

set(CMAKE_STATIC_LINKER_FLAGS_RELEASE "")
set(CMAKE_MODULE_LINKER_FLAGS_RELEASE "")
set(CMAKE_SHARED_LINKER_FLAGS_RELEASE "")
set(CMAKE_EXE_LINKER_FLAGS_RELEASE "")

set(XBOX360_DEFINITIONS
    -D_XBOX
    -DXBOX
    -D_MBCS
)

string(REPLACE ";" " " XBOX360_DEFINITIONS "${XBOX360_DEFINITIONS}")

add_definitions(${XBOX360_DEFINITIONS})

set(CMAKE_CXX_STANDARD_LIBRARIES "")

set(STATIC_CRT_LIB "libcmt.lib")
set(XBOX360_LIBRARIES "xboxkrnl.lib")

set(CMAKE_CXX_STANDARD_LIBRARIES ${XBOX360_LIBRARIES})

set(XBOX360_INCLUDE_DIRS
    "${XENON_XDK_ROOT}/include/xbox"
)

include_directories(${XBOX360_INCLUDE_DIRS})

set(XBOX360_LIBRARY_DIRS
    "${XENON_XDK_ROOT}/lib/xbox"
)

link_directories(${XBOX360_LIBRARY_DIRS})