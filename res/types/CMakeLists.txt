#******************************************************************************
#  (c) 2020 Copyright, Real-Time Innovations, Inc. (RTI) All rights reserved.
#
#   Licensed according to the terms in the LICENSE.md file located at the root 
#   of this software repository:
#
#                                LICENSE.md
#
#*****************************************************************************

cmake_minimum_required(VERSION 3.14)

message(STATUS "CMAKE_CURRENT_SOURCE_DIR = ${CMAKE_CURRENT_SOURCE_DIR}")
message(STATUS "CMAKE_SOURCE_DIR = ${CMAKE_SOURCE_DIR}")
message(STATUS "CMAKE_CURRENT_BINARY_DIR = ${CMAKE_CURRENT_BINARY_DIR}")
message(STATUS "CMAKE_BINARY_DIR = ${CMAKE_BINARY_DIR}")

set(CODEGEN_OUTPUT_DIR "${CMAKE_BINARY_DIR}/../../generated")
message(STATUS "CODEGEN_OUTPUT_DIR = ${CODEGEN_OUTPUT_DIR}")

#-----------------------------------------------------------------------------
# Codegen

# Include the CodegenRTIConnextDDS cmake module
include(CodegenRTIConnextDDS)

# SDK specific codegen settings: 
if("${RTI_CONNEXT_SDK}" MATCHES "pro")
  set(CODEGEN_FLAGS UNBOUNDED NAMESPACE)
  set(CONNEXTDDS_INSTALLATION "${CONNEXTDDS_DIR}")
elseif("${RTI_CONNEXT_SDK}" MATCHES "micro")
  set(CODEGEN_FLAGS MICRO)
  set(CONNEXTDDS_INSTALLATION "${CONNEXTDDSMICRO_DIR}")
endif()

###################################################################################
# Convert IDLs to XML
###################################################################################

add_subdirectory("data")
add_subdirectory("services")

set(IDLs Shapes_t)
set(resulting_files)

foreach(IDL ${IDLs})

  connextdds_rtiddsgen_convert(
    INPUT
      "${CMAKE_CURRENT_SOURCE_DIR}/${IDL}.idl"
    FROM
      "IDL"
    TO
      "XML"
    OUTPUT_DIRECTORY
      "${CMAKE_CURRENT_SOURCE_DIR}"
    INCLUDE_DIRS
      "${CMAKE_CURRENT_SOURCE_DIR}/../.." # res/types
  )

  list(APPEND resulting_files "${CMAKE_CURRENT_SOURCE_DIR}/${IDL}.xml")

endforeach()

add_custom_target(xml_generation ALL DEPENDS
  ${resulting_files}
)


###################################################################################
# Generate files
###################################################################################

set(IDLs 
  # Data
  data/base/Primitives_t.idl
  data/base/Entity_t.idl
  data/base/Variants_t.idl

  data/physics/Time_t.idl
  
  data/sensing/Camera_t.idl
  data/sensing/Image_t.idl

  data/gateway/CAN_t.idl

  # Services
  services/Drive_bus_t.idl
  services/CAN_svc_t.idl
)

list(LENGTH IDLs IDLs_length)
math(EXPR length "${IDLs_length}-1")

set(LANGUAGES C C++)

set(types_lib_list)

foreach(language ${LANGUAGES})

  add_library(${language}_${RTI_CONNEXT_SDK}_types_lib)
  list(APPEND types_lib_list ${language}_${RTI_CONNEXT_SDK}_types_lib)

  foreach(i RANGE ${length})

    list(GET IDLs ${i} idl)
    get_filename_component(idl_relative_location ${idl} DIRECTORY)

    connextdds_rtiddsgen_run(
      IDL_FILE
        "${CMAKE_CURRENT_SOURCE_DIR}/${idl}"
      VAR
        codegen_files
      LANG
        ${language}
      OUTPUT_DIRECTORY
        "${CODEGEN_OUTPUT_DIR}/${language}/res/types/${idl_relative_location}"
      INCLUDE_DIRS
        "${CMAKE_CURRENT_SOURCE_DIR}/../.."
      ${CODEGEN_FLAGS}
    )

    if (${language} STREQUAL "C")
      target_sources(${language}_${RTI_CONNEXT_SDK}_types_lib PRIVATE ${codegen_files_C_SOURCES})
    elseif(${language} STREQUAL "C++")
      target_sources(${language}_${RTI_CONNEXT_SDK}_types_lib PRIVATE ${codegen_files_CXX_SOURCES})
    endif()

  endforeach()

  target_include_directories(${language}_${RTI_CONNEXT_SDK}_types_lib
    PUBLIC
      "${CONNEXTDDS_INSTALLATION}/include"
      "${CONNEXTDDS_INSTALLATION}/include/ndds"
      "${CODEGEN_OUTPUT_DIR}/${language}"
  )

  if("${RTI_CONNEXT_SDK}" MATCHES "pro")

    if (${language} STREQUAL "C")
      target_link_libraries(${language}_${RTI_CONNEXT_SDK}_types_lib RTIConnextDDS::c_api)
    elseif(${language} STREQUAL "C++")
      target_link_libraries(${language}_${RTI_CONNEXT_SDK}_types_lib RTIConnextDDS::cpp_api)
    endif()

  elseif("${RTI_CONNEXT_SDK}" MATCHES "micro")

    target_link_libraries(${language}_${RTI_CONNEXT_SDK}_types_lib RTIConnextDDSMicro::rti_me)
    set(libraries RTIConnextDDSMicro::rti_me)

  endif()

endforeach()

install(
    TARGETS ${types_lib_list}
    CONFIGURATIONS Debug Release
    RUNTIME DESTINATION "${INSTALL_RUNTIME_OUTPUT_DIRECTORY}"
    ARCHIVE DESTINATION "${INSTALL_ARCHIVE_OUTPUT_DIRECTORY}"
    LIBRARY DESTINATION "${INSTALL_LIBRARY_OUTPUT_DIRECTORY}"
    )
