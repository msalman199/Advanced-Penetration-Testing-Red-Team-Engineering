# 🚀 Privilege Escalation with LinPEAS & WinPEAS

![Linux](https://img.shields.io/badge/Linux-Ubuntu-E95420?style=for-the-badge&logo=ubuntu)
![Windows](https://img.shields.io/badge/Windows-Privilege%20Escalation-0078D6?style=for-the-badge&logo=windows)
![Python](https://img.shields.io/badge/Python-Automation-3776AB?style=for-the-badge&logo=python)
![Docker](https://img.shields.io/badge/Docker-Lab%20Environment-2496ED?style=for-the-badge&logo=docker)
![LinPEAS](https://img.shields.io/badge/LinPEAS-Enumeration-success?style=for-the-badge)
![WinPEAS](https://img.shields.io/badge/WinPEAS-Enumeration-success?style=for-the-badge)

---

# 📖 Overview

This lab provides hands-on experience with **privilege escalation enumeration and analysis** using **LinPEAS** and **WinPEAS** in controlled environments.

Students will learn how to:

- 🔍 Execute LinPEAS and WinPEAS enumeration tools
- 📊 Analyze privilege escalation findings
- 🐧 Understand Linux privilege escalation vectors
- 🪟 Understand Windows privilege escalation vectors
- 🤖 Develop Python automation workflows
- 🛡️ Apply systematic privilege escalation methodologies

---

# 🎯 Objectives

By the end of this lab, students will be able to:

- Execute LinPEAS and WinPEAS enumeration tools on target systems
- Analyze enumeration output to identify privilege escalation vectors
- Understand common privilege escalation vulnerabilities on Linux and Windows
- Develop Python automation scripts for privilege escalation workflows
- Apply systematic approaches to privilege escalation in penetration testing

---

# 📋 Prerequisites

Before starting this lab, students should have:

- ✅ Basic Linux command line proficiency
- ✅ Understanding of file permissions and user privileges
- ✅ Fundamental Windows operating system knowledge
- ✅ Basic Python programming skills
- ✅ Familiarity with penetration testing concepts

---

# 🖥️ Lab Environment

Your cloud machine includes:

- Kali Linux
- Docker Containers
- LinPEAS
- WinPEAS
- Python3
- Docker Engine
- Network Access

---

# 🐧 Task 1: Linux Privilege Escalation with LinPEAS

## 🔹 Step 1: Environment Setup

```bash
mkdir -p ~/privesc-lab && cd ~/privesc-lab

whoami && id

cat > Dockerfile.linux << 'EOF'
FROM ubuntu:20.04
RUN apt-get update && apt-get install -y sudo vim curl wget python3
RUN useradd -m -s /bin/bash lowpriv
RUN echo 'lowpriv:password' | chpasswd
RUN echo 'lowpriv ALL=(ALL) NOPASSWD: /usr/bin/vim' >> /etc/sudoers
RUN chmod 4755 /usr/bin/find
RUN echo '#!/bin/bash\necho "Cron job executed"' > /tmp/backup.sh
RUN chmod 777 /tmp/backup.sh
CMD ["/bin/bash"]
EOF

docker build -f Dockerfile.linux -t vuln-linux .
docker run -d --name vuln-linux vuln-linux tail -f /dev/null
```

---

## 🔹 Step 2: Download and Execute LinPEAS

```bash
wget https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh

chmod +x linpeas.sh

docker cp linpeas.sh vuln-linux:/tmp/

docker exec vuln-linux /tmp/linpeas.sh > linpeas_output.txt 2>&1

less linpeas_output.txt
```

---

## 🔹 Step 3: Analyze LinPEAS Output

```bash
grep -A 10 "SUID" linpeas_output.txt

grep -A 5 "sudo" linpeas_output.txt

grep -A 10 "writable" linpeas_output.txt

grep -A 10 "cron" linpeas_output.txt
```

---

## 🔹 Step 4: Create Linux Enumeration Automation Script

Create:

```bash
nano linux_privesc_automation.py
```

The script should include:

- Logging Configuration
- LinPEAS Output Parsing
- SUID Enumeration
- Sudo Permission Analysis
- Writable File Discovery
- Exploitation Opportunity Identification
- Report Generation

Core Class:

```python
class LinuxPrivEscAutomator:
    pass
```

Required Methods:

```python
setup_logging()
parse_linpeas_output()
check_suid_exploits()
attempt_suid_find_exploit()
check_sudo_exploits()
generate_report()
run_automation()
```

---

# 🪟 Task 2: Windows Privilege Escalation with WinPEAS

## 🔹 Step 1: Setup Windows Simulation Environment

```bash
wget https://github.com/carlospolop/PEASS-ng/releases/latest/download/winPEASx64.exe -O winpeas.exe

wget https://github.com/carlospolop/PEASS-ng/releases/latest/download/winPEAS.bat -O winpeas.bat
```

Create Dockerfile:

```bash
cat > Dockerfile.windows << 'EOF'
FROM ubuntu:20.04
RUN apt-get update && apt-get install -y wine xvfb
RUN mkdir -p /root/.wine/drive_c/temp
RUN echo 'echo Vulnerable service' > /root/.wine/drive_c/temp/service.bat
RUN chmod 777 /root/.wine/drive_c/temp/service.bat
CMD ["/bin/bash"]
EOF

docker build -f Dockerfile.windows -t vuln-windows .

docker run -d --name vuln-windows vuln-windows tail -f /dev/null
```

---

## 🔹 Step 2: Create WinPEAS Simulation Script

Create:

```bash
nano winpeas_simulator.py
```

Required functionality:

- System Enumeration
- User Enumeration
- Service Analysis
- Registry Analysis
- Vulnerability Identification
- Report Generation

Core Class:

```python
class WinPEASSimulator:
    pass
```

Required Methods:

```python
gather_system_info()
enumerate_users()
check_services()
check_registry_settings()
identify_vulnerabilities()
generate_report()
run_full_scan()
```

---

## 🔹 Step 3: Analyze WinPEAS Results

Create:

```bash
nano analyze_winpeas.py
```

Required Functions:

```python
analyze_vulnerabilities()
check_always_install_elevated()
check_unquoted_service_paths()
generate_exploitation_plan()
```

---

# 🤖 Task 3: Comprehensive Automation Framework

## 🔹 Step 1: Create Master Automation Script

Create:

```bash
nano privilege_escalation_automation.py
```

Framework Features:

- Linux Enumeration
- Windows Enumeration
- Findings Correlation
- Vulnerability Prioritization
- Report Generation
- Logging
- Automation Workflow

Main Class:

```python
class PrivEscAutomationFramework:
    pass
```

Required Methods:

```python
setup_logging()
run_linpeas_scan()
run_winpeas_scan()
attempt_linux_exploits()
attempt_windows_exploits()
generate_comprehensive_report()
run_full_automation()
```

---

## 🔹 Step 2: Create Exploitation Helper Functions

Required Helper Functions:

```python
exploit_suid_find()
exploit_sudo_vim()
exploit_writable_cron()
create_msi_payload()
exploit_unquoted_service()
```

---

## 🔹 Step 3: Execute Complete Automation

```bash
python3 privilege_escalation_automation.py

cat automation_results.json | python3 -m json.tool

cat privilege_escalation.log

cat automation_report.txt
```

---

# 🎯 Expected Outcomes

After completing this lab, you should have:

- ✅ Successfully executed LinPEAS
- ✅ Successfully executed WinPEAS
- ✅ Identified privilege escalation vectors
- ✅ Automated enumeration workflows
- ✅ Prioritized vulnerabilities
- ✅ Generated detailed reports
- ✅ Developed Python-based automation frameworks

---

# 🛠️ Troubleshooting

## LinPEAS Not Executing

```bash
chmod +x linpeas.sh
```

Verify:

- File permissions
- Successful transfer to container
- Available disk space

---

## Docker Container Issues

```bash
sudo systemctl restart docker

docker rm -f container_name

docker logs container_name
```

---

## Python Script Errors

```bash
python3 --version

pip3 install module_name
```

Verify:

- Python installation
- Module dependencies
- File permissions
- Correct paths

---

# 🔐 Key Security Concepts Learned

## Linux Privilege Escalation

- SUID Binaries
- Misconfigured sudo permissions
- Writable cron jobs
- File permission abuse

## Windows Privilege Escalation

- Unquoted Service Paths
- Weak Service Permissions
- AlwaysInstallElevated
- Stored Credentials

## Automation Concepts

- Enumeration Automation
- Findings Correlation
- Vulnerability Prioritization
- Reporting Frameworks
- Cross-Platform Assessments

---

# 📚 Conclusion

This lab provides practical experience with **LinPEAS** and **WinPEAS** for privilege escalation enumeration and analysis.

Through Linux and Windows environments, students gain experience in:

- Privilege escalation discovery
- Enumeration methodologies
- Vulnerability prioritization
- Python automation development
- Security assessment reporting

The automation frameworks developed during this lab demonstrate how modern penetration testing engagements can be enhanced through scripting, repeatability, and structured analysis.

> ⚠️ **Disclaimer:** Perform privilege escalation testing only in authorized environments and with explicit permission. The knowledge gained from this lab must be used responsibly and ethically.

---

## 🏆 Skills Acquired

- Linux Privilege Escalation Enumeration
- Windows Privilege Escalation Enumeration
- LinPEAS Analysis
- WinPEAS Analysis
- Python Automation
- Docker Lab Management
- Vulnerability Assessment
- Security Reporting
- Penetration Testing Methodology

---

⭐ If you found this lab useful, consider starring the repository and contributing improvements.
