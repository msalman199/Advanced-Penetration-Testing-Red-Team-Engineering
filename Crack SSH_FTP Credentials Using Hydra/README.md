
# 🚀 Crack SSH/FTP Credentials Using Hydra

<div align="center">

# 🔐 SSH & FTP Credential Auditing 

### Learn Hydra, Medusa, Python Automation, Detection & Defense Against Brute-Force Attacks

![Hydra](https://img.shields.io/badge/Hydra-Password%20Auditing-red)
![Medusa](https://img.shields.io/badge/Medusa-Credential%20Testing-blue)
![Python](https://img.shields.io/badge/Python-3.x-yellow?logo=python)
![SSH](https://img.shields.io/badge/SSH-Secure%20Shell-green)
![FTP](https://img.shields.io/badge/FTP-File%20Transfer-orange)
![Fail2Ban](https://img.shields.io/badge/Fail2Ban-Intrusion%20Prevention-purple)
![Linux](https://img.shields.io/badge/Linux-Ubuntu-black?logo=linux)
![Cybersecurity](https://img.shields.io/badge/Cybersecurity-Authentication-success)

</div>

---

# 🎯 Objectives

By the end of this lab, students will be able to:

✅ Perform SSH credential auditing using Hydra

✅ Execute FTP credential testing using Medusa

✅ Create Python automation scripts for credential validation

✅ Analyze authentication logs and attack results

✅ Implement brute-force detection and prevention controls

---

# 📚 Prerequisites

Students should have:

🔹 Basic Linux command-line proficiency

🔹 Understanding of SSH and FTP protocols

🔹 Python programming fundamentals

🔹 Familiarity with authentication mechanisms

🔹 Awareness of ethical hacking principles

---

# 🖥️ Lab Environment

Al Nafi provides pre-configured Linux cloud machines with:

- Ubuntu 20.04 LTS
- Hydra
- Medusa
- Python 3.8+
- SSH Server
- FTP Server
- Sample Wordlists

⚠️ All activities must be performed only on systems you own or are explicitly authorized to assess.

---

# 🚀 Task 1: SSH Credential Testing with Hydra

---

## 🔹 Step 1.1: Verify Installation and Setup

### 📄 verify_hydra.sh

```bash
# Verify Hydra installation
hydra -h

# Check SSH service
sudo systemctl status ssh

# Start SSH service if necessary
sudo systemctl start ssh
```

---

## 🔹 Step 1.2: Create Test Environment

### 📄 setup_test_environment.sh

```bash
# Create test accounts
sudo useradd -m testuser1
sudo useradd -m admin

echo 'testuser1:password123' | sudo chpasswd
echo 'admin:admin' | sudo chpasswd

# Create wordlist directory
mkdir ~/wordlists
cd ~/wordlists

# Username list
cat > usernames.txt << EOF
admin
testuser1
root
user
guest
EOF

# Password list
cat > passwords.txt << EOF
admin
password
123456
password123
root
test
EOF
```

---

## 🔹 Step 1.3: Basic Hydra Credential Auditing

### 📄 hydra_tests.sh

```bash
# Single credential validation
hydra -l admin -p admin ssh://127.0.0.1

# Username/password lists
hydra -L ~/wordlists/usernames.txt \
-P ~/wordlists/passwords.txt \
ssh://127.0.0.1

# Verbose output
hydra -L ~/wordlists/usernames.txt \
-P ~/wordlists/passwords.txt \
-t 4 -V \
ssh://127.0.0.1

# Save results
hydra -L ~/wordlists/usernames.txt \
-P ~/wordlists/passwords.txt \
-o ssh_results.txt \
ssh://127.0.0.1
```

---

## 🔹 Step 1.4: Advanced Hydra Options

### 📄 hydra_advanced.sh

```bash
# Delay between attempts
hydra -L ~/wordlists/usernames.txt \
-P ~/wordlists/passwords.txt \
-t 2 -w 3 \
ssh://127.0.0.1

# Custom SSH port
hydra -L ~/wordlists/usernames.txt \
-P ~/wordlists/passwords.txt \
-s 2222 \
ssh://127.0.0.1

# Resume interrupted session
hydra -L ~/wordlists/usernames.txt \
-P ~/wordlists/passwords.txt \
-R \
ssh://127.0.0.1
```

---

# 📂 Task 2: FTP Credential Testing with Medusa

---

## 🔹 Step 2.1: Configure FTP Service

### 📄 ftp_setup.sh

```bash
sudo apt install vsftpd -y

sudo tee /etc/vsftpd.conf > /dev/null << EOF
listen=YES
local_enable=YES
write_enable=YES
chroot_local_user=YES
allow_writeable_chroot=YES
EOF

sudo systemctl restart vsftpd
sudo systemctl enable vsftpd
```

---

## 🔹 Step 2.2: Verify Medusa

### 📄 medusa_verify.sh

```bash
# Install Medusa
sudo apt install medusa -y

# Help
medusa -h

# Available modules
medusa -d
```

---

## 🔹 Step 2.3: Execute FTP Credential Auditing

### 📄 medusa_tests.sh

```bash
# Single credential validation
medusa -h 127.0.0.1 \
-u testuser1 \
-p password123 \
-M ftp

# Username/password lists
medusa -h 127.0.0.1 \
-U ~/wordlists/usernames.txt \
-P ~/wordlists/passwords.txt \
-M ftp \
-v 6

# Save results
medusa -h 127.0.0.1 \
-U ~/wordlists/usernames.txt \
-P ~/wordlists/passwords.txt \
-M ftp \
-t 5 \
-O ftp_results.txt

# Resume session
medusa -h 127.0.0.1 \
-U ~/wordlists/usernames.txt \
-P ~/wordlists/passwords.txt \
-M ftp \
-Z h1u1p1
```

---

# 🤖 Task 3: Automate Credential Testing with Python

---

## 🔹 Step 3.1: SSH Automation Script

### 📄 ssh_bruteforce.py

```python
#!/usr/bin/env python3

import paramiko
import sys
import threading
from queue import Queue

class SSHBruteForcer:

    def __init__(self,
                 target,
                 port=22,
                 threads=10):

        self.target = target
        self.port = port
        self.threads = threads

        self.found_credentials = []

        self.queue = Queue()

    def ssh_connect(self,
                    username,
                    password):
        """
        Test SSH credentials

        TODO:
        - Create Paramiko SSH client
        - Configure host key policy
        - Attempt authentication
        - Return True on success
        """
        pass

    def worker(self):
        """
        Credential testing worker

        TODO:
        - Process queue
        - Store valid credentials
        """
        pass

    def load_wordlist(self, filename):
        """
        Load wordlist

        TODO:
        - Read file
        - Return list
        """
        pass

    def run_attack(self,
                   usernames_file,
                   passwords_file):
        """
        Execute audit

        TODO:
        - Load files
        - Start workers
        - Display results
        """
        pass

if __name__ == "__main__":

    # TODO:
    # Parse arguments
    # Run audit
    pass
```

Installation:

```bash
pip3 install paramiko

chmod +x ssh_bruteforce.py
```

---

## 🔹 Step 3.2: FTP Automation Script

### 📄 ftp_bruteforce.py

```python
#!/usr/bin/env python3

import ftplib
import sys
import threading
import time
from queue import Queue

class FTPBruteForcer:

    def __init__(self,
                 target,
                 port=21,
                 threads=10):

        self.target = target

        self.port = port

        self.threads = threads

        self.found_credentials = []

        self.queue = Queue()

    def ftp_connect(self,
                    username,
                    password):
        """
        Test FTP credentials

        TODO:
        - Connect
        - Login
        - Return result
        """
        pass

    def worker(self):
        """
        Worker thread

        TODO:
        - Process queue
        - Add delay
        """
        pass

    def load_wordlist(self, filename):
        """
        Load wordlist

        TODO:
        - Read file
        """
        pass

    def run_attack(self,
                   usernames_file,
                   passwords_file):
        """
        Execute audit

        TODO:
        - Start workers
        - Report results
        """
        pass

if __name__ == "__main__":

    # TODO:
    # Parse arguments
    pass
```

---

## 🔹 Step 3.3: Multi-Service Framework

### 📄 multi_bruteforce.py

```python
#!/usr/bin/env python3

import argparse

class MultiServiceBruteForcer:

    def __init__(self,
                 target,
                 service,
                 port=None,
                 threads=10):

        """
        TODO:
        - Configure service
        - Configure port
        """
        pass

    def ssh_connect(self,
                    username,
                    password):
        """
        TODO:
        SSH validation
        """
        pass

    def ftp_connect(self,
                    username,
                    password):
        """
        TODO:
        FTP validation
        """
        pass

    def test_credentials(self,
                         username,
                         password):
        """
        TODO:
        Route to service
        """
        pass

    def worker(self):
        """
        TODO:
        Process queue
        """
        pass

    def run_attack(self,
                   usernames_file,
                   passwords_file,
                   output_file=None):
        """
        TODO:
        Execute workflow
        """
        pass

def main():

    """
    TODO:
    - Parse arguments
    - Execute framework
    """
    pass

if __name__ == "__main__":
    main()
```

---

## 🔹 Step 3.4: Results Analysis Tool

### 📄 attack_analyzer.py

```python
#!/usr/bin/env python3

import json
from datetime import datetime

class AttackAnalyzer:

    def __init__(self):

        self.results = {}

    def parse_hydra_output(self,
                           filename):
        """
        TODO:
        Parse Hydra results
        """
        pass

    def parse_medusa_output(self,
                            filename):
        """
        TODO:
        Parse Medusa results
        """
        pass

    def parse_custom_output(self,
                            filename):
        """
        TODO:
        Parse custom results
        """
        pass

    def analyze_passwords(self,
                          passwords):
        """
        TODO:
        Analyze password patterns
        """
        pass

    def generate_report(self,
                        credentials,
                        output_file):
        """
        TODO:
        Generate JSON report
        """
        pass

def main():

    """
    TODO:
    Parse files
    Generate report
    """
    pass

if __name__ == "__main__":
    main()
```

---

# 🛡️ Task 4: Defense and Detection

---

## 🔹 Step 4.1: Monitor Authentication Failures

### 📄 auth_monitor.sh

```bash
# Recent failures
sudo grep "Failed password" \
/var/log/auth.log | tail -20

# Count by IP
sudo grep "Failed password" \
/var/log/auth.log \
| awk '{print $(NF-3)}' \
| sort | uniq -c | sort -rn

# Real-time monitoring
sudo tail -f /var/log/auth.log
```

---

## 🔹 Step 4.2: Configure Fail2Ban

### 📄 fail2ban_setup.sh

```bash
sudo apt install fail2ban -y

sudo tee /etc/fail2ban/jail.local > /dev/null << EOF
[sshd]
enabled = true
port = ssh
filter = sshd
logpath = /var/log/auth.log
maxretry = 3
bantime = 3600
findtime = 600
EOF

sudo systemctl restart fail2ban

sudo fail2ban-client status sshd
```

---

## 🔹 Step 4.3: Configure SSH Rate Limiting

### 📄 ssh_hardening.sh

```bash
sudo nano /etc/ssh/sshd_config
```

Add:

```text
MaxAuthTries 3
MaxSessions 2
LoginGraceTime 30
```

Restart:

```bash
sudo systemctl restart ssh
```

---

## 🔹 Step 4.4: Detection Script

### 📄 detect_bruteforce.py

```python
#!/usr/bin/env python3

import re
from collections import defaultdict

def parse_auth_log(
        logfile='/var/log/auth.log'):
    """
    TODO:
    Parse failed attempts
    """
    pass

def detect_attacks(
        failed_attempts,
        threshold=5):
    """
    TODO:
    Detect suspicious activity
    """
    pass

def generate_alert(
        suspicious_ips):
    """
    TODO:
    Generate alerts
    """
    pass

if __name__ == "__main__":

    # TODO:
    # Detect brute-force attempts
    pass
```

---

# 📊 Verification Steps

```bash
cat ssh_results.txt

cat ftp_results.txt

ssh testuser1@127.0.0.1

sudo fail2ban-client status
```

---

# 📁 Deliverables

| File | Purpose |
|--------|----------|
| ssh_results.txt | SSH Audit Results |
| ftp_results.txt | FTP Audit Results |
| ssh_bruteforce.py | SSH Automation |
| ftp_bruteforce.py | FTP Automation |
| multi_bruteforce.py | Unified Framework |
| attack_analyzer.py | Results Analysis |
| detect_bruteforce.py | Detection Engine |

---

# 🛠️ Troubleshooting Guide

## ⚠️ Hydra Timeout

```bash
sudo systemctl status ssh
```

Reduce concurrency:

```bash
-t 2
```

---

## ⚠️ Permission Denied

Verify users:

```bash
cat /etc/passwd | grep testuser
```

Reset credentials:

```bash
echo 'testuser1:password123' | sudo chpasswd
```

---

## ⚠️ Paramiko Errors

```bash
pip3 install paramiko
```

Verify:

```bash
python3 --version
```

---

## ⚠️ FTP Connection Refused

```bash
sudo systemctl status vsftpd
```

Check configuration:

```bash
sudo cat /etc/vsftpd.conf
```

---

## ⚠️ No Results Found

Verify:

✅ Test accounts exist

✅ Credentials are present in wordlists

✅ Services are running

---

# 🎓 Learning Outcomes

After completing this lab students will understand:

✅ SSH authentication auditing

✅ FTP credential validation

✅ Python automation frameworks

✅ Authentication log analysis

✅ Fail2Ban deployment

✅ Brute-force detection strategies

---

# 🔐 Security Takeaways

✔️ Authentication logs provide valuable detection data

✔️ Rate limiting reduces automated attack effectiveness

✔️ Strong password policies improve resilience

✔️ Account lockout mechanisms increase protection

✔️ Monitoring and alerting are essential security controls

---

# 🏁 Conclusion

This lab introduced credential auditing techniques using **Hydra**, **Medusa**, and **Python automation frameworks**.

Students learned how to:

🔍 Assess authentication security

⚡ Automate credential validation workflows

📊 Analyze authentication results

🛡️ Deploy Fail2Ban defenses

📈 Monitor and detect suspicious login activity

Understanding these techniques helps security professionals strengthen authentication systems and improve defensive monitoring capabilities.

---

<div align="center">

### 🌟 Hydra • Medusa • Python Automation • Authentication Security 🌟

</div>
````
