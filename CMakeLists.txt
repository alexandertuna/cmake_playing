cmake_minimum_required( VERSION 3.14 )

project( tuna_testing )

message("This is a basic message.")

find_program(MINIO_BIN minio REQUIRED)
find_program(MC_BIN mc REQUIRED)


message("")
message("")
message("MINIO_BIN = ${MINIO_BIN}")
message("MC_BIN = ${MC_BIN}")
message("")
message("")

message("This is the end of a basic message.")
