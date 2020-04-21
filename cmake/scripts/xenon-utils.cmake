
# Compile Xbox 360 Shared library
function(add_xenon_module project_name project_sources)
    add_library(${project_name} SHARED ${project_sources})
    set_target_properties(${project_name} PROPERTIES SUFFIX ".xex")

    # Get module xex configuration file
    get_filename_component(MODULE_CONFIG_FILE "${project_name}/${project_name}.xml" ABSOLUTE)
    if(NOT MODULE_CONFIG_FILE)
        message(FATAL_ERROR "Unable to locate XEX configuration.")
    endif()

    # Apply configuration file for imagexex
    target_link_options(${project_name} PRIVATE "/XEXCONFIG:${MODULE_CONFIG_FILE}")
endfunction()

# Compile Xbox 360 Static library
function(add_xenon_library project_name project_sources)
    add_library(${project_name} STATIC ${project_sources})
endfunction()