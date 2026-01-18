Task 2: User Management and Access Control

Objective

To securely create and manage user accounts for new developers Sarah and Mike, ensuring:

Controlled system access
Isolated working directories
Strong password policies with expiration and complexity enforcement


first check the existing user: cut -d: -f1 /etc/passwd


step 1: Create User Accounts

sudo useradd -m -s /bin/bash Sarah
sudo useradd -m -s /bin/bash mike

-m → Creates home directory automatically
-s /bin/bash → Assigns Bash shell for interactive access

step 2: Set Secure Passwords

sudo passwd Sarah

sudo passwd mike


step 3: Create Isolated Workspace Directories

sudo mkdir -p /home/Sarah/workspace

sudo mkdir -p /home/mike/workspace

step 4: Assign Ownership to Respective Users

sudo chown -R Sarah:Sarah /home/Sarah/workspace
sudo chown -R mike:mike /home/mike/workspace


step 5: Set Secure Directory Permissions

sudo chmod 700 /home/Sarah/workspace
sudo chmod 700 /home/mike/workspace


Permission breakdown:

Owner: read, write, execute
Group: no access
Others: no access

✅ This guarantees complete isolation between users.

step 6: Verify Access Control

su - Sarah
cd ~/workspace

should fail on : cd /home/mike/workspace

step 7: Implement Password Expiration Policy (30 Days) from admin user {exit from Sarah workspace}

sudo chage -M 30 Sarah
sudo chage -M 30 mike


Verify Password Policy
sudo chage -l Sarah
sudo chage -l mike


step 8: Enforce Password Complexity (System-Wide)

sudo nano /etc/security/pwquality.conf

minlen = 12
dcredit = -1
ucredit = -1
lcredit = -1
ocredit = -1

step 9: Ensure PAM Uses Password Quality Rules

Verify /etc/pam.d/common-password (Ubuntu/Debian) - password requisite pam_pwquality.so retry=3

if not then install pwdquality package

sudo apt update
sudo apt install -y libpam-pwquality

dpkg -l | grep pwquality

Enable pam_pwquality using pam-auth-update sudo pam-auth-update

