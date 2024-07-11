#!/bin/bash

# Get the current date and time (format: YYYYMMDD_HHMMSS)
CURRENT_TIME=$(date +"%Y%m%d_%H%M%S")

# Set the log file name
LOG_FILE="log_${CURRENT_TIME}.log"

# Start logging using the script command
script -q -c "ros2 run examples_rclcpp_minimal_publisher publisher_member_function" $LOG_FILE

