cmake_minimum_required(VERSION 3.8)

################################
## Compiler flags
################################

if(PLATFORM_WIN)
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
endif()

if(PLATFORM_XENON)
	set(CXX_COMMON_FLAGS
		/TP				# Enable C++
    	/W3             # Set warning level to 3
    	/wd4996         # Ignore deprecation warnings
		/GF             # Enable read-only string pooling
		/GS-			# Enable buffer security checks
		/Gm-             # Enable minimal rebuild
		/fp:fast		# Fast floating point (less predictable)
		/Os				# Favour small code
		/Gy             # Enable function level linking
		/Zc:wchar_t-    # Set wchar_t as an interal type
	)

	string(REPLACE ";" " " CXX_COMMON_FLAGS "${CXX_COMMON_FLAGS}")

	set(CMAKE_CXX_FLAGS "${CXX_COMMON_FLAGS}")
	set(CMAKE_CXX_FLAGS_DEBUG "/MTd")
	set(CMAKE_CXX_FLAGS_RELEASE "/MT /Ox")

	# MSVC Common linker flags
	set(MSVC_LINKER_FLAGS "/NOLOGO /INCREMENTAL:NO /manifest:no")

	set(CMAKE_MODULE_LINKER_FLAGS "${MSVC_LINKER_FLAGS}")
	set(CMAKE_SHARED_LINKER_FLAGS "${MSVC_LINKER_FLAGS} /dll /ALIGN:128,4096")
	set(CMAKE_EXE_LINKER_FLAGS "${MSVC_LINKER_FLAGS}")

	set(CMAKE_MODULE_LINKER_FLAGS_DEBUG "/DEBUG")
	set(CMAKE_SHARED_LINKER_FLAGS_DEBUG "/DEBUG /INCREMENTAL:NO")
	set(CMAKE_EXE_LINKER_FLAGS_DEBUG "/DEBUG")

	set(CMAKE_MODULE_LINKER_FLAGS_RELEASE "/LTCG")
	set(CMAKE_SHARED_LINKER_FLAGS_RELEASE "/LTCG /INCREMENTAL:NO /OPT:ICF")
	set(CMAKE_EXE_LINKER_FLAGS_RELEASE "/LTCG")

	set(XBOX360_DEFINITIONS
		-D_XBOX
		-DXBOX
		-D_MBCS
	)

	string(REPLACE ";" " " XBOX360_DEFINITIONS "${XBOX360_DEFINITIONS}")

	add_definitions(${XBOX360_DEFINITIONS})

	# Clear default libraries
	set(CMAKE_CXX_STANDARD_LIBRARIES "")

	# Set common libraries
	set(XBOX360_LIBRARIES 
		"xboxkrnl.lib"
		"xapilib.lib"
		"xact3ltcg.lib"
		"xmcoreltcg.lib"
		"xaudio2.lib"
		"xgraphics.lib"
		"xnet.lib"
		"libcmt.lib"
		"vcomp.lib"
	)

	string (REPLACE ";" " " XBOX360_LIBRARIES "${XBOX360_LIBRARIES}")

	set(CMAKE_CXX_STANDARD_LIBRARIES ${XBOX360_LIBRARIES})

	set(XBOX360_INCLUDE_DIRS
		"${XENON_XDK_ROOT}/include/xbox"
	)

	include_directories(${XBOX360_INCLUDE_DIRS})

	set(XBOX360_LIBRARY_DIRS
		"${XENON_XDK_ROOT}/lib/xbox"
	)

	link_directories(${XBOX360_LIBRARY_DIRS})
endif()