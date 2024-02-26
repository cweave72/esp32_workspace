#!/bin/bash

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
    echo "Error: Script must be sourced."
    exit
fi


# SCRIPTPATH will be set to the path of this script.
SCRIPTPATH=$(dirname $(realpath "${BASH_SOURCE[0]}"))

# Add this directory to the PATH.
#echo "Adding $SCRIPTPATH to PATH."
#export PATH=$SCRIPTPATH:$PATH

ESP_DIR=$SCRIPTPATH/esp-idf
EXPORT_SH=$ESP_DIR/export.sh

function check_espidf_env {
    if [[ ":$PATH:" == *"$ESP_DIR/tools:"* ]]; then
        echo "ESP environment is activated."
    else
        source $EXPORT_SH
        echo "ESP environment activated."
    fi
}

# Define the esp-idf target as esp32 devices.
export IDF_TARGET=esp32

# Signal that the workspace is initialized.
export ESP32_WORKSPACE_INITIALIZED

# Define paths needed for workspace.
export MONITOR_PORT="/dev/ttyUSB0"
export COMPONENTS_PATH=$SCRIPTPATH/components
export ESP32_TOOLS=$SCRIPTPATH/tools

check_espidf_env
