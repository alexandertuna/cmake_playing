cmake_minimum_required( VERSION 3.14 )

project( tuna_testing )

message("This is a message.")

message("")
message("CMAKE_CURRENT_BINARY_DIR  ${CMAKE_CURRENT_BINARY_DIR}")
message("CMAKE_SYSTEM_PROCESSOR    ${CMAKE_SYSTEM_PROCESSOR}")
message("CMAKE_SYSTEM_NAME         ${CMAKE_SYSTEM_NAME}")
message("")

set(EXECUTABLES "minio" "mc")
foreach(EXE IN LISTS EXECUTABLES)

  find_program(EXE_BIN ${EXE} HINTS "${CMAKE_CURRENT_BINARY_DIR}")

  if(NOT EXE_BIN)
    message("Didnt find ${EXE}. Downloading it ...")

    # system settings
    if (APPLE)
      set(SYS_NAME "darwin")
    else()
      set(SYS_NAME "linux")
    endif()

    if(CMAKE_SYSTEM_PROCESSOR STREQUAL "arm64" OR
       CMAKE_SYSTEM_PROCESSOR STREQUAL "aarch64")
      set(SYS_PROC "arm64")
    else()
      set(SYS_PROC "amd64")
    endif()

    if (EXE STREQUAL "minio")
      set(DIR "server")
    else()
      set(DIR "client")
    endif()

    set(URL "https://dl.min.io/${DIR}/${EXE}/release/${SYS_NAME}-${SYS_PROC}/${EXE}")
    set(FILE "${CMAKE_CURRENT_BINARY_DIR}/${EXE}")
    message("Downloading ${URL} to ${FILE}")
    file(DOWNLOAD "${URL}" "${FILE}" STATUS download_status)

    list(GET download_status 0 RESULT_CODE)
    if (NOT RESULT_CODE EQUAL 0)
      message(FATAL_ERROR "Failed to download ${EXE}: ${RESULT_CODE}")
    endif()

    file(CHMOD "${FILE}" PERMISSIONS
          OWNER_READ OWNER_WRITE OWNER_EXECUTE
          GROUP_READ GROUP_EXECUTE
          WORLD_READ WORLD_EXECUTE)
  endif()

endforeach()

find_program(MINIO_BIN minio HINTS "${CMAKE_CURRENT_BINARY_DIR}" REQUIRED)
find_program(MC_BIN mc       HINTS "${CMAKE_CURRENT_BINARY_DIR}" REQUIRED)

# https://dl.min.io/client/mc/release/linux-amd64/mc
# https://dl.min.io/server/minio/release/linux-amd64/minio
# https://dl.min.io/client/mc/release/darwin-arm64/mc
# https://dl.min.io/server/minio/release/darwin-arm64/minio

# find_program(MC_BIN mc)

# CMAKE_CURRENT_BINARY_DIR  /Users/alexandertuna/Downloads/sdsc/xrootd_mcminio/cmake_playing
# CMAKE_SYSTEM_PROCESSOR    arm64
# CMAKE_SYSTEM_NAME         Darwin


message("")
message("")
message("MINIO_BIN = ${MINIO_BIN}")
message("MC_BIN = ${MC_BIN}")
message("")
message("")

message("This is the end of a message.")
