export VERSION=3.28.3

export WORKSPACE="${PWD}/uploader"
export PID_FILE="${WORKSPACE}/allure.pid"
export LOG_FILE="${WORKSPACE}/allure.log"

export ALLURE_RESULTS="build/allure-results"

"${WORKSPACE}/allure-ee/bin/allure-ee" upload build/allure-results  > "${LOG_FILE}" 2>&1  &
echo $! > ${PID_FILE}
