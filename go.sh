# source ~/miniconda3/bin/activate
# conda activate xrootd
rm -f minio mc
rm -rf CMakeCache.txt CMakeFiles Makefile cmake_install.cmake
cmake ./
rm -rf CMakeCache.txt CMakeFiles Makefile cmake_install.cmake
