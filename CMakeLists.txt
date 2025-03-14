cmake_minimum_required( VERSION 3.14 )

project( tuna_testing )

message("This is a message.")

message("")
message("")
message("CMAKE_CURRENT_BINARY_DIR  ${CMAKE_CURRENT_BINARY_DIR}")
message("CMAKE_SYSTEM_PROCESSOR    ${CMAKE_SYSTEM_PROCESSOR}")
message("CMAKE_SYSTEM_NAME         ${CMAKE_SYSTEM_NAME}")
message("")
message("")

find_program(MINIO_BIN minio HINTS "${CMAKE_CURRENT_BINARY_DIR}")
if(NOT MINIO_BIN)
  message("Didnt find minio. Trying to get from the internet...")
  if (APPLE)
    message("APPLE!")
    set(SYS_NAME "darwin")
    if(CMAKE_SYSTEM_PROCESSOR STREQUAL "arm64")
      set(SYS_PROC "arm64")
    else()
      set(SYS_PROC "amd64")
    endif()
  else()
    message("NOT APPLE!")
  endif()
  set(DOWNLOAD_URL "https://dl.min.io/server/minio/release/darwin-arm64/minio")
  set(LOCAL_OUTPUT "${CMAKE_CURRENT_BINARY_DIR}/minio")
  file(
    DOWNLOAD 
    ${DOWNLOAD_URL}
    ${LOCAL_OUTPUT}
    SHOW_PROGRESS
    # EXPECTED_HASH SHA256=YOUR_EXPECTED_HASH_HERE
    # TIMEOUT 30
    TLS_VERIFY ON
  )
  file(CHMOD "${CMAKE_CURRENT_BINARY_DIR}/minio" PERMISSIONS
        OWNER_READ
        OWNER_WRITE
        OWNER_EXECUTE
        GROUP_READ
        GROUP_EXECUTE
        WORLD_READ
        WORLD_EXECUTE
  )
endif()
find_program(MINIO_BIN minio HINTS "${CMAKE_CURRENT_BINARY_DIR}" REQUIRED)


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
