#!/bin/bash

# parameters
REPS=5
TEST_LOG_DIR=logs
RUN_BASELINE=1
RUN_KEYSTONE=1
TEST_RUNNER=bench-runner
EYRIE_FULL_SUPPORT=eyrie-rt
DEFAULT_USZ=4096
DEFAULT_FSZ=32768
LARGE_FSZ=49152
XLARGE_FSZ=262144

set -e

if [[ -f "./logs"  ]]
then
    rm -rf ./logs
fi

mkdir ./logs



for tst in aes dhrystone miniz norx primes qsort sha512; do
    tst=$(basename $tst)

    echo "Running $tst"
    for RUN_N in $(seq $REPS); do

        BASE_LOG_FILE=${TEST_LOG_DIR}/base_${tst}_${RUN_N}.log
        KEYSTONE_LOG_FILE=${TEST_LOG_DIR}/keystone_${tst}_${RUN_N}.log

        if [[ $RUN_BASELINE == 1 ]]; then
            { time ./${tst}; } &> ${BASE_LOG_FILE}
        fi

        if [[ $RUN_KEYSTONE == 1 ]]; then
            { time ./${TEST_RUNNER} ./${tst} ${EYRIE_FULL_SUPPORT} --utm-size ${DEFAULT_USZ} --freemem-size ${XLARGE_FSZ} --time ; } &> ${KEYSTONE_LOG_FILE}
        fi
    done
done