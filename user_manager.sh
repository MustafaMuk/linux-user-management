#!/bin/bash

LOG_FILE="user_management.log"

# Function to log messages
log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

log_message "Starting user creation process..."

# Ensure groups exist before assigning users
for group in devops admin; do
    if ! getent group "$group" > /dev/null; then
        log_message "Group '$group' does not exist. Creating it..."
        sudo groupadd "$group"
    fi
done

# Define users and their respective groups
declare -A users
users["devops_user1"]="devops"
users["devops_user2"]="devops"
users["devops_admin"]="admin"

# Create users and assign them to groups
for user in "${!users[@]}"; do
    log_message "Creating user '$user'..."
    
    # Create user if they don't exist
    if ! id "$user" &>/dev/null; then
        sudo useradd -m -s /bin/bash -g "${users[$user]}" "$user"
        log_message "User '$user' created successfully."
    else
        log_message "User '$user' already exists. Skipping creation."
    fi

    # Assign user to the group
    sudo usermod -aG "${users[$user]}" "$user"
    log_message "Assigned '$user' to '${users[$user]}'."

    # Set home directory permissions
    sudo chmod 700 "/home/$user"
    log_message "Set home directory permissions for '$user'."
done

log_message "User creation process completed."
log_message "Check $LOG_FILE for details."

