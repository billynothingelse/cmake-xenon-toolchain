CMake Xbox 360 Toolchain
===================
A toolchain and compiler setup for the CMake build system that enables generating
project files correctly, regardless of Visual Studio version, for the Xbox 360 platform.

Note
-------------
This project is no longer maintained and is not feature complete - it may not work correctly
as it has not been used for an unknown length of time and there are no other backups that contain other
features that I implemented at the time. There is a known issue with the ninja generator system that
breaks the project files with one flag that, if I recall, was not overridable from CMake or command line
which required pre-build scripts to overwrite the intermediate data.

Why?
-------------
While working on Xbox 360, the requirement for Visual Studio 2010 often lead to many issues,
and due to my migration to desktop, I decided to write an Xbox 360 toolchain and scripts so
that I could utilise my new development environment and use newer versions of the Visual Studio IDE
with only the requirement being the Xbox 360 SDK.

