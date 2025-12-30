#! /bin/bash

# ----------------------------------------
# GCP Health Check Script (Beginner Level)
# Checks:
# 1. VM (Instance) health
# 2. Cloud Storage health
# Creates date-wise folders
# Saves logs inside date folder
# ----------------------------------------

# Get current date and time ( YYYY-MM-DD-HH-MM-SEC)
DATETIME=$(date '+%Y-%m-%d_%H-%M-%S')

# directory where logs will be stored
BASE_LOG_DIR="/home/naralanavi97/Narala"

# Create base log directory if not exists
mkdir -p $BASE_LOG_DIR

# Create date-wise folder (example: 2025-12-30)
DATE_FOLDER="$BASE_LOG_DIR/$DATETIME"
mkdir -p "$DATE_FOLDER" 
# Log file name with time
LOG_FILE="$DATE_FOLDER/health_check_$DAETIME.log"

# Write header to log file
echo "====================================" >> $LOG_FILE
echo "GCP HEALTH CHECK REPORT" >> $LOG_FILE
echo "Date & Time : $(date)" >> $LOG_FILE
echo "====================================" >> $LOG_FILE
echo "" >> $LOG_FILE

# ---------------- VM HEALTH CHECK ----------------
echo "Checking VM Instances..." >> $LOG_FILE

# List VM instances
gcloud compute instances list >> $LOG_FILE 2>&1

# Check command status
if [ $? -eq 0 ]; then
    echo "VM Health Check : PASS" >> $LOG_FILE
else
    echo "VM Health Check : FAIL" >> $LOG_FILE
fi

echo "" >> $LOG_FILE

# ---------------- STORAGE HEALTH CHECK ----------------
echo "Checking Cloud Storage Buckets..." >> $LOG_FILE

# List storage buckets
gsutil ls >> $LOG_FILE 2>&1

# Check command status
if [ $? -eq 0 ]; then
    echo "Storage Health Check : PASS" >> $LOG_FILE
else
    echo "Storage Health Check : FAIL" >> $LOG_FILE
fi

echo "" >> $LOG_FILE

# Write footer
echo "Health Check Completed at: $(date)" >> $LOG_FILE
echo "Log File Location: $LOG_FILE" >> $LOG_FILE
echo "====================================" >> $LOG_FI
