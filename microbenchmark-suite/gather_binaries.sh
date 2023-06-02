# Only run this script after compiling the benchmarks
# This script will copy all binaries to ../microbenchmark_suite-bins
# all memory binaries will be copied to ../microbenchmark_suite_mem-bins
# It will rename all bench.RISCV files to <benchmark_name>.RISCV

#!/bin/bash

cd $(dirname $0)

rm -rf ../microbenchmark_suite-bins
rm -rf ../microbenchmark_suite_mem-bins
mkdir ../microbenchmark_suite-bins
mkdir ../microbenchmark_suite_mem-bins

for exe in $(ls | grep -o -E '^([^.]+)$') ; do
case "$exe" in
    memory*)
        cp $exe ../microbenchmark_suite_mem-bins/$exe.RISCV
esac    
    if [ "$exe" = "LICENSE" ] || [ "$exe" = "Makefile" ]; then
        continue
    else
        cp $exe ../microbenchmark_suite-bins/$exe.RISCV
    fi
done
