export WORKSPACE="${PWD}/workspace"
export PID_FILE="${WORKSPACE}/allure.pid"

if [ -f "${PID_FILE}" ]; then
  export PID="$(cat ${PID_FILE})"
  kill -TERM "${PID}"
  wait "${PID}"
  rm "${PID_FILE}"
fi
