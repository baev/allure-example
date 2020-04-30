export VERSION=3.28.3

export WORKSPACE="${PWD}/workspace"
export PID_FILE="${WORKSPACE}/allure.pid"
export LOG_FILE="${WORKSPACE}/allure.log"

#export ALLURE_ENDPOINT=http://localhost:8080
#export ALLURE_TOKEN=03f728b3-19b4-49f0-957f-e41dc902dbd3
#export ALLURE_PROJECT_ID=4

export ALLURE_RESULTS="build/allure-results"

mkdir -p "${WORKSPACE}" && rm -r -f "${WORKSPACE}/allure-ee"

wget "https://dl.bintray.com/qameta/maven-unstable/io/qameta/allure/allure-ee-commandline/${VERSION}/allure-ee-commandline-${VERSION}.zip" \
     -O "${WORKSPACE}/allure-ee-commandline.zip"
unzip -d "${WORKSPACE}" "${WORKSPACE}/allure-ee-commandline.zip" && rm "${WORKSPACE}/allure-ee-commandline.zip"
mv "${WORKSPACE}/allure-ee-${VERSION}" "${WORKSPACE}/allure-ee" && rm -r -f "${WORKSPACE}/allure-ee-${VERSION}"

"${WORKSPACE}/allure-ee/bin/allure-ee" upload build/allure-results  > "${LOG_FILE}" 2>&1  &
echo $! > ${PID_FILE}
