#! /usr/bin/env make
ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

ALSAMIXER_FREEZE__OPT := "/opt/alsamixer-freeze"
ALSAMIXER_FREEZE__CONFIG_PATH := "${ALSAMIXER_FREEZE__OPT}/asound.state"
ALSAMIXER_FREEZE__BIN := "alsactl.sh"
ALSAMIXER_FREEZE__SERVICE_NAME := "alsamixer-freeze.service"
ETC_SYSTEM := "/etc/systemd/system"

install:
	@echo "Creating folder '${ALSAMIXER_FREEZE__OPT}' if not exists"
	@mkdir -p ${ALSAMIXER_FREEZE__OPT}

	@echo "Storing your current configuration at '${ALSAMIXER_FREEZE__CONFIG_PATH}'"
	@alsactl -f ${ALSAMIXER_FREEZE__CONFIG_PATH} store
	@chmod +x ${ALSAMIXER_FREEZE__CONFIG_PATH}

	@echo "Creating '${ALSAMIXER_FREEZE__SERVICE_NAME}'"
	@cp "${ROOT_DIR}/script/${ALSAMIXER_FREEZE__BIN}" "${ALSAMIXER_FREEZE__OPT}/${ALSAMIXER_FREEZE__BIN}"
	@chmod +x "${ALSAMIXER_FREEZE__OPT}/${ALSAMIXER_FREEZE__BIN}"

	@echo "Creating systemctl file"
	@cp "${ROOT_DIR}/template/${ALSAMIXER_FREEZE__SERVICE_NAME}" ${ALSAMIXER_FREEZE__OPT}/${ALSAMIXER_FREEZE__SERVICE_NAME}
	@sed -i "s|{{BINARY}}|$(shell echo "${ALSAMIXER_FREEZE__OPT}/${ALSAMIXER_FREEZE__BIN}")|g" ${ALSAMIXER_FREEZE__OPT}/${ALSAMIXER_FREEZE__SERVICE_NAME}

	@echo "Moving systemctl file to '${ETC_SYSTEM}'"
	@mv ${ALSAMIXER_FREEZE__OPT}/${ALSAMIXER_FREEZE__SERVICE_NAME} ${ETC_SYSTEM}

	@echo "Reloading systemctl daemon"
	@systemctl daemon-reload

	@echo "Starting systemctl '${ALSAMIXER_FREEZE__SERVICE_NAME}'"
	@systemctl start ${ALSAMIXER_FREEZE__SERVICE_NAME}

	@echo "Enabling systemctl '${ALSAMIXER_FREEZE__SERVICE_NAME}'"
	@systemctl enable ${ALSAMIXER_FREEZE__SERVICE_NAME}

	@echo "Done"

uninstall:
	@echo "Removing folder '${ALSAMIXER_FREEZE__OPT}'"
	@rm -rf ${ALSAMIXER_FREEZE__OPT}

	@echo "Stopping systemctl '${ALSAMIXER_FREEZE__SERVICE_NAME}'"
	@systemctl stop ${ALSAMIXER_FREEZE__SERVICE_NAME}

	@echo "Disabling systemctl '${ALSAMIXER_FREEZE__SERVICE_NAME}'"
	@systemctl disable ${ALSAMIXER_FREEZE__SERVICE_NAME}

	@echo "Removing '${ETC_SYSTEM}/${ALSAMIXER_FREEZE__SERVICE_NAME}' file"
	@rm ${ETC_SYSTEM}/${ALSAMIXER_FREEZE__SERVICE_NAME}

	@echo "Reloading systemctl daemon"
	@systemctl daemon-reload

	@echo "Removing '${ALSAMIXER_FREEZE__SERVICE_NAME}' failed status"
	@systemctl reset-failed

	@echo "Done"

start:
	@systemctl start ${ALSAMIXER_FREEZE__SERVICE_NAME}

stop:
	@systemctl stop ${ALSAMIXER_FREEZE__SERVICE_NAME}

default: install