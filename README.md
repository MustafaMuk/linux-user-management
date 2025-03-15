# Linux User Management Script

## Overview
This project provides a Bash script (`user_manager.sh`) for managing Linux users. It automates the process of creating users, assigning them to groups, and setting permissions for their home directories.

## Features
- Creates predefined users.
- Assigns users to specific groups.
- Configures home directory permissions.
- Logs all actions performed.

## Prerequisites
- A Linux system with root access.
- Bash installed (`bash --version` to check).
- Execute permissions for the script (`chmod +x user_manager.sh`).

## Installation & Usage
1. **Clone the repository:**
   ```sh
   git clone https://github.com/MustafaMuk/linux-user-management.git
   cd linux-user-management
   ```
2. **Run the script with sudo:**
   ```sh
   sudo ./user_manager.sh
   ```
3. **Check logs for execution details:**
   ```sh
   cat user_management.log
   ```

## Example Output
```
2025-03-15 22:38:32 - Starting user creation process...
2025-03-15 22:38:32 - Creating user 'devops_user1'...
2025-03-15 22:38:32 - User 'devops_user1' already exists. Skipping creation.
2025-03-15 22:38:32 - Assigned 'devops_user1' to 'devops'.
2025-03-15 22:38:32 - Set home directory permissions for 'devops_user1'.
...
2025-03-15 22:38:32 - User creation process completed.
```

## Log Management
- The script logs all actions to `user_management.log`.
- To rotate logs, use:
  ```sh
  mv user_management.log user_management_$(date +%F).log
  ```
- Alternatively, set up log rotation in `/etc/logrotate.d/`.

## License
This project is licensed under the MIT License - see the `LICENSE` file for details.
