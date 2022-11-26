#******************************************************************************
# (C) Copyright 2020-2022 Real-Time Innovations, Inc.  All rights reserved.
#
# The use of this software is governed by the terms specified in the 
# RTI Labs License Agreement, available at https://www.rti.com/terms/RTILabs. 
#
# By accessing, downloading, or otherwise using this software, you agree to 
# be bound by those terms.
#*****************************************************************************

cmake_minimum_required(VERSION 3.14)

#-----------------------------------------------------------------------------
# Codegen

# Include the CodegenRTIConnextDDS cmake module
include(CodegenRTIConnextDDS)

# Connext SDK specific codegen settings: 
if("${RTI_CONNEXT_SDK}" MATCHES "pro")
  set(CODEGEN_FLAGS UNBOUNDED NAMESPACE)
elseif("${RTI_CONNEXT_SDK}" MATCHES "micro")
  set(CODEGEN_FLAGS MICRO)
endif()

set(CODEGEN_OUTPUT_DIR "${CMAKE_BINARY_DIR}/../../generated")
message(STATUS "CODEGEN_OUTPUT_DIR: ${CODEGEN_OUTPUT_DIR}")

#-----------------------------------------------------------------------------
# Convert IDLs to XML
#-----------------------------------------------------------------------------

add_subdirectory("data")
add_subdirectory("services")

add_custom_target(xml_generation ALL DEPENDS
  ${resulting_files}
)

#-----------------------------------------------------------------------------
# Generate files
#-----------------------------------------------------------------------------

set(IDLs 
  # Data
  data/base/Primitives_t.idl
  data/base/Entity_t.idl
  data/base/Variants_t.idl

  data/physics/Time_t.idl
  data/physics/Point2D_t.idl
  data/physics/Point3D_t.idl

  data/sensing/Image_t.idl
  data/sensing/Camera_t.idl

  data/sensing/PointCloud_t.idl
  data/sensing/Lidar_t.idl

  data/actuation/Actuation_t.idl

  data/perception/Lane_t.idl
  data/perception/Track_t.idl

  data/planning/Alert_t.idl
  
  data/gateway/CAN_t.idl

  data/demo/ShapeType_t.idl

  # Services
  services/Shapes_t.idl
  services/Drive_t.idl
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
      target_sources(${language}_${RTI_CONNEXT_SDK}_types_lib 
            PRIVATE ${codegen_files_C_SOURCES})
    elseif(${language} STREQUAL "C++")
      target_sources(${language}_${RTI_CONNEXT_SDK}_types_lib 
            PRIVATE ${codegen_files_CXX_SOURCES})
    endif()

  endforeach()

  target_include_directories(${language}_${RTI_CONNEXT_SDK}_types_lib
    PUBLIC
      "${CODEGEN_OUTPUT_DIR}/${language}"
  )

  if("${RTI_CONNEXT_SDK}" MATCHES "pro")
      target_include_directories(${language}_${RTI_CONNEXT_SDK}_types_lib
          PUBLIC
          "${RTI_CONNEXT_SDK_DIR}/include"
          "${RTI_CONNEXT_SDK_DIR}/include/ndds"
          )

    if (${language} STREQUAL "C")
      target_link_libraries(${language}_${RTI_CONNEXT_SDK}_types_lib
            RTIConnextDDS::c_api)
    elseif(${language} STREQUAL "C++")
      target_link_libraries(${language}_${RTI_CONNEXT_SDK}_types_lib
            RTIConnextDDS::cpp_api)
    endif()

  elseif("${RTI_CONNEXT_SDK}" MATCHES "micro")
    target_link_libraries(${language}_${RTI_CONNEXT_SDK}_types_lib
            RTIConnextDDSMicro::rti_me)
  endif()

  # export targets, so that they can be IMPORTED by other projects (components)
  export(TARGETS ${language}_${RTI_CONNEXT_SDK}_types_lib APPEND 
         FILE ${CMAKE_BINARY_DIR}/${PROJECT_NAME}-exports.cmake
    )
endforeach()

#-----------------------------------------------------------------------------

install(
    TARGETS ${types_lib_list}
    CONFIGURATIONS Debug Release
    RUNTIME DESTINATION "${INSTALL_RUNTIME_OUTPUT_DIRECTORY}"
    ARCHIVE DESTINATION "${INSTALL_ARCHIVE_OUTPUT_DIRECTORY}"
    LIBRARY DESTINATION "${INSTALL_LIBRARY_OUTPUT_DIRECTORY}"
    )

#-----------------------------------------------------------------------------
