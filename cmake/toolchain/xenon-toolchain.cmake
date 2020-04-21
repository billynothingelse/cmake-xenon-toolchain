set(XENON_TOOLCHAIN 1)

# Get the XDK installation root
if(EXISTS "$ENV{XEDK}" AND IS_DIRECTORY "$ENV{XEDK}")
    string(REGEX REPLACE "\\\\" "/" XENON_XDK_ROOT $ENV{XEDK})
    string(REGEX REPLACE "//" "/" XENON_XDK_ROOT ${XENON_XDK_ROOT})
endif()

if(NOT XENON_XDK_ROOT)
    message(FATAL_ERROR "Invalid Xbox 360 XDK root. Please install the Xbox 360 XDK and try again.")
endif()

# Get tools path
set(XENON_XDK_COMPILER_DIR "${XENON_XDK_ROOT}/bin/win32")
if(NOT XENON_XDK_COMPILER_DIR)
    message(FATAL_ERROR "Unable to find Xbox 360 XDK compiler tools.")
endif()

set(CMAKE_SYSTEM_NAME Xbox360)
set(CMAKE_CROSSCOMPILING ON)
set(XENON true)

set(CMAKE_SYSROOT "${XENON_XDK_COMPILER_DIR}")

# Use the Xbox 360 XDK compilers
set(CMAKE_C_COMPILER "${XENON_XDK_COMPILER_DIR}/cl.exe")
set(CMAKE_CXX_COMPILER "${XENON_XDK_COMPILER_DIR}/cl.exe")
set(CMAKE_ASM_COMPILER "${XENON_XDK_COMPILER_DIR}/ml.exe")
set(CMAKE_LINKER "${XENON_XDK_COMPILER_DIR}/link.exe")

# Skip compiler detection info
set(CMAKE_C_COMPILER_FORCED true)
set(CMAKE_CXX_COMPILER_FORCED true)
set(CMAKE_ASM_COMPILER_FORCED true)

# Make the Xbox 360 XDK our only focus
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)