export WORKSPACE="${PWD}/workspace"
export PID_FILE="${WORKSPACE}/allure.pid"

if [ -f "${PID_FILE}" ]; then
  kill -TERM "$(cat ${PID_FILE})"
  rm "${PID_FILE}"
fi
