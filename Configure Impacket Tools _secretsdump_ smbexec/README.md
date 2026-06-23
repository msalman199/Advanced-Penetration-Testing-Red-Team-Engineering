# 🛠️ Configure Impacket Tools (secretsdump, smbexec)

<p align="center">
  <img src="https://img.shields.io/badge/Tool-Impacket-blue?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Python-3.x-green?style=for-the-badge&logo=python" />
  <img src="https://img.shields.io/badge/Linux-Ubuntu-orange?style=for-the-badge&logo=ubuntu" />
  <img src="https://img.shields.io/badge/Protocol-SMB-red?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Security-Active%20Directory-darkred?style=for-the-badge" />
</p>

---

# 📚 Overview

This lab introduces students to the **Impacket Framework**, focusing on the safe configuration and automation of commonly used administrative and security assessment utilities.

Students will learn how credential extraction tools work conceptually, understand NTLM hash structures, automate analysis workflows, and create reporting frameworks for security assessments.

---

# 🎯 Objectives

By the end of this lab, students will be able to:

✅ Install and configure Impacket tools

✅ Understand secretsdump output formats

✅ Understand smbexec command structures

✅ Analyze NTLM hash data

✅ Create Python automation frameworks

✅ Generate structured reports

✅ Understand credential security implications

---

# 📋 Prerequisites

Before starting this lab, students should have:

- Basic Linux Command Line Skills
- Understanding of Windows Active Directory
- Knowledge of SMB Protocol
- NTLM Authentication Fundamentals
- Basic Python Programming
- Security Assessment Concepts

---

# 🖥️ Lab Environment

Al Nafi provides pre-configured Linux cloud machines containing:

- Ubuntu Linux
- Python 3.x
- pip
- Git
- Virtual Environment Support
- Internet Access

---

# 🚀 Task 1: Install and Configure Impacket

---

# 🛠️ Step 1: Create Virtual Environment

```bash
python3 -m venv impacket-env

source impacket-env/bin/activate

pip install --upgrade pip
```

---

# 🛠️ Step 2: Install Impacket

```bash
git clone https://github.com/SecureAuthCorp/impacket.git

cd impacket

pip install .

python3 -c "import impacket; print('Impacket installed successfully')"
```

---

# 🛠️ Step 3: Verify Installation

```bash
python3 examples/secretsdump.py -h

python3 examples/smbexec.py -h

ls examples/*.py | head -10
```

---

# 🚀 Task 2: Analyze Credential Dumps

---

# 🛠️ Step 1: Create Practice Environment

```bash
mkdir -p ~/impacket-lab/test-data

cd ~/impacket-lab/test-data
```

Create sample dataset:

```bash
cat > sample_hashes.txt << 'EOF'
Administrator:500:aad3b435b51404eeaad3b435b51404ee:31d6cfe0d16ae931b73c59d7e0c089c0:::
Guest:501:aad3b435b51404eeaad3b435b51404ee:31d6cfe0d16ae931b73c59d7e0c089c0:::
testuser:1001:aad3b435b51404eeaad3b435b51404ee:8846f7eaee8fb117ad06bdd830b7586c:::
EOF
```

---

# 🧠 Step 2: Create Hash Analysis Script

## hash_analyzer.py

```python
#!/usr/bin/env python3
"""
Hash Analyzer for secretsdump output

Students: Complete the functions to parse
and analyze NTLM hashes
"""

class HashAnalyzer:

    def __init__(self, hash_file):

        self.hash_file = hash_file
        self.hashes = []

    def parse_hash_line(self, line):

        """
        Parse hash entry

        TODO:
        Split line
        Extract username
        Extract RID
        Extract LM Hash
        Extract NTLM Hash
        Return dictionary
        """

        pass

    def detect_empty_password(self, ntlm_hash):

        """
        TODO:
        Compare against known
        empty password NTLM hash
        """

        pass

    def analyze_file(self):

        """
        TODO:
        Read file
        Parse hashes
        Store results
        Generate statistics
        """

        pass


# TODO:
# Create analyzer instance
# Run analysis
```

---

# 📖 Step 3: Common secretsdump Usage Patterns

```bash
# Local SAM extraction
# python3 examples/secretsdump.py -sam SAM -system SYSTEM LOCAL

# Remote credential extraction
# python3 examples/secretsdump.py DOMAIN/user:password@target

# Pass-the-hash authentication
# python3 examples/secretsdump.py -hashes :NTLM_HASH DOMAIN/user@target

# NTDS extraction
# python3 examples/secretsdump.py -ntds ntds.dit -system SYSTEM LOCAL
```

---

# 🐍 Step 4: Create Hash Processing Script

## hash_processor.py

```python
#!/usr/bin/env python3
"""
Hash Processing and Export Tool

Students: Implement processing logic
"""

import json
from datetime import datetime

class HashProcessor:

    def __init__(self):

        self.processed_hashes = []

    def load_hashes(self, filename):

        """
        TODO:
        Read file
        Parse entries
        Store hashes
        """

        pass

    def export_to_hashcat(self, output_file):

        """
        TODO:
        Export in hashcat format
        """

        pass

    def export_to_john(self, output_file):

        """
        TODO:
        Export in John format
        """

        pass

    def generate_report(self):

        """
        TODO:
        Count hashes
        Generate JSON report
        Save report
        """

        pass


# TODO:
# Implement main logic
```

---

# 🚀 Task 3: SMBExec Automation

---

# 🛠️ Step 1: Create SMBExec Automation Script

## smbexec_automation.py

```python
#!/usr/bin/env python3
"""
SMBExec Demonstration and Automation

Students: Complete implementation
"""

class SMBExecAutomation:

    def __init__(
        self,
        target,
        username,
        password,
        domain=""
    ):

        self.target = target
        self.username = username
        self.password = password
        self.domain = domain
        self.results = []

    def build_command(self, remote_command):

        """
        TODO:
        Build authentication string
        Build command list
        Return command
        """

        pass

    def execute_single_command(self, command):

        """
        TODO:
        Execute command
        Capture output
        Handle errors
        """

        pass

    def execute_batch_commands(self, command_list):

        """
        TODO:
        Execute commands
        Store results
        Return summary
        """

        pass

    def save_results(self, filename):

        """
        TODO:
        Save results to JSON
        """

        pass


# TODO:
# Create instance
# Execute test commands
```

---

# 📖 Step 2: Common smbexec Examples

```bash
# Basic Authentication
# python3 examples/smbexec.py DOMAIN/user:password@target

# Pass-the-Hash
# python3 examples/smbexec.py -hashes :NTLM_HASH DOMAIN/user@target

# Execute command
# python3 examples/smbexec.py DOMAIN/user:password@target 'whoami'

# Specify share
# python3 examples/smbexec.py -share ADMIN$ DOMAIN/user:password@target
```

---

# 🛠️ Step 3: Create Command Templates

## command_template_generator.py

```python
#!/usr/bin/env python3
"""
Command Template Generator

Students: Complete template creation
"""

class CommandTemplateGenerator:

    def __init__(self):

        self.templates = {
            "reconnaissance": [],
            "enumeration": [],
            "collection": []
        }

    def create_recon_template(self):

        """
        TODO:
        Add system information commands
        Add network commands
        Add user enumeration commands
        """

        pass

    def create_enum_template(self):

        """
        TODO:
        Add service enumeration
        Add process listing
        Add registry queries
        """

        pass

    def save_template(self, category, filename):

        """
        TODO:
        Save template to file
        Add descriptions
        Add instructions
        """

        pass


# TODO:
# Generate templates
```

---

# 🚀 Task 4: Build Automation Framework

---

# 🏗️ Step 1: Unified Framework

## impacket_framework.py

```python
#!/usr/bin/env python3
"""
Impacket Automation Framework

Students: Complete framework implementation
"""

import subprocess
import json
import threading

from datetime import datetime
from concurrent.futures import ThreadPoolExecutor

class ImpacketFramework:

    def __init__(self, config_file=None):

        self.config = self.load_config(config_file)

        self.results = {}

        self.lock = threading.Lock()

    def load_config(self, config_file):

        """
        TODO:
        Load JSON configuration
        Return dictionary
        """

        pass

    def run_secretsdump(self, target_info):

        """
        TODO:
        Execute secretsdump
        Capture output
        Parse results
        """

        pass

    def run_smbexec(self, target_info, commands):

        """
        TODO:
        Execute command list
        Capture output
        Return results
        """

        pass

    def parallel_execution(
        self,
        targets,
        operation
    ):

        """
        TODO:
        ThreadPoolExecutor
        Submit tasks
        Gather results
        """

        pass

    def generate_report(self, output_file):

        """
        TODO:
        Generate HTML/JSON report
        Include statistics
        """

        pass


# TODO:
# Implement argument parsing
# Execute framework
```

---

# ⚙️ Step 2: Create Configuration File

## config.json

```json
{
  "framework": {
    "timeout": 30,
    "max_threads": 5,
    "retry_attempts": 3,
    "output_directory": "./impacket_results"
  },

  "targets": [
    {
      "name": "target1",
      "ip": "192.168.1.100",
      "domain": "TESTDOMAIN",
      "username": "administrator",
      "password": "password123"
    }
  ],

  "operations": {
    "secretsdump": true,
    "smbexec": true,

    "commands": [
      "whoami",
      "hostname",
      "ipconfig",
      "systeminfo"
    ]
  }
}
```

---

# 📜 Step 3: Implement Logging System

## impacket_logger.py

```python
#!/usr/bin/env python3
"""
Logging System for Impacket Operations

Students: Complete implementation
"""

import logging

from datetime import datetime

class ImpacketLogger:

    def __init__(
        self,
        log_file='impacket.log',
        level=logging.INFO
    ):

        """
        TODO:
        Configure logging
        Add file handler
        Add console handler
        """

        pass

    def log_operation(
        self,
        operation,
        target,
        status,
        details
    ):

        """
        TODO:
        Format message
        Log operation
        """

        pass

    def log_error(
        self,
        error_message,
        exception=None
    ):

        """
        TODO:
        Log errors
        Include traceback
        """

        pass

    def generate_summary(self):

        """
        TODO:
        Parse logs
        Count successes
        Count failures
        Generate summary
        """

        pass


# TODO:
# Integrate logger
# Test logging functions
```

---

# ▶️ Execute Lab Components

Run scripts:

```bash
python3 hash_analyzer.py

python3 hash_processor.py

python3 smbexec_automation.py

python3 impacket_framework.py
```

Review results:

```bash
ls -lah

cat impacket.log

cat report.json
```

---

# 🎯 Expected Outcomes

After completing this lab, students should have:

✅ Working Impacket Installation

✅ Understanding of secretsdump Output

✅ NTLM Hash Analysis Scripts

✅ SMBExec Automation Scripts

✅ Reporting Framework

✅ Logging System

✅ Security Assessment Documentation

---

# 🔍 Troubleshooting Tips

## Installation Problems

```bash
python3 --version

sudo apt install python3-dev libssl-dev

pip install --upgrade pip
```

---

## Connection Issues

```bash
ping target_ip

nmap -p 445 target_ip
```

Verify:

- SMB Port Availability
- Firewall Rules
- Authentication Details

---

## No Results Returned

Verify:

- Required Privileges
- Correct Paths
- Correct Authentication
- Accessible Files

---

# 📚 Key Takeaways

🔹 Impacket is widely used for Windows security assessments

🔹 Understanding credential storage improves defensive security

🔹 Automation increases assessment efficiency

🔹 Reporting and logging are essential

🔹 Always operate within authorized environments

🔹 Proper documentation supports compliance requirements

---

# 🏁 Conclusion

This lab introduced the installation, configuration, analysis, and automation capabilities of the Impacket framework. Students learned how to work with credential data, create automation workflows, generate reports, and understand the security implications of remote administration and credential management.

The Python frameworks developed throughout this lab can be extended to support additional security assessment and administrative workflows.

---

# ⚖️ Ethical Reminder

These techniques should only be used in authorized environments, approved security assessments, training labs, or systems where explicit permission has been granted.

Unauthorized access, credential extraction, or remote command execution against systems without authorization is illegal and unethical.

---

# 🚀 Next Steps

- Explore additional Impacket utilities
- Study Kerberos authentication concepts
- Learn Active Directory security fundamentals
- Build advanced reporting frameworks
- Integrate automation into larger security workflows

---

⭐ Happy Learning & Stay Ethical!
