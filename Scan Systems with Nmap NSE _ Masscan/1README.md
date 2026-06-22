
# 🚀 Network Scanning with Nmap NSE and Masscan

<div align="center">

# 🌐 Advanced Network Reconnaissance & Port Discovery 

### Master Nmap NSE, Masscan, Python Automation, and Hybrid Scanning Strategies

![Nmap](https://img.shields.io/badge/Nmap-Network%20Scanner-blue)
![Masscan](https://img.shields.io/badge/Masscan-High%20Speed%20Scanner-red)
![Python](https://img.shields.io/badge/Python-3.x-yellow?logo=python)
![Linux](https://img.shields.io/badge/Linux-Ubuntu-orange?logo=linux)
![NSE](https://img.shields.io/badge/NSE-Scripting%20Engine-green)
![XML](https://img.shields.io/badge/XML-Scan%20Results-purple)
![JSON](https://img.shields.io/badge/JSON-Reporting-black)
![Cybersecurity](https://img.shields.io/badge/Cybersecurity-Reconnaissance-success)

</div>

---

# 🎯 Objectives

By the end of this lab, students will be able to:

✅ Execute advanced network reconnaissance using Nmap Scripting Engine (NSE)

✅ Perform high-speed port scanning with Masscan

✅ Automate scanning workflows using Python

✅ Analyze and interpret scan results

✅ Implement hybrid scanning strategies combining speed and detail

---

# 📚 Prerequisites

Students should have:

🔹 Basic Linux command-line proficiency

🔹 Understanding of TCP/IP networking

🔹 Familiarity with Nmap fundamentals

🔹 Python 3 programming knowledge

🔹 Awareness of ethical hacking principles

---

# 🖥️ Lab Environment

Al Nafi provides pre-configured Linux cloud machines with:

- Ubuntu Linux
- Nmap
- Masscan
- Python 3
- Development tools
- Text editors

⚠️ All scans target:

```text
127.0.0.1
```

for safety and legality.

---

# 🚀 Task 1: NSE Script Categories and Service Detection

---

## 🔹 Step 1: Explore NSE Categories

### 📄 explore_nse.sh

```bash
# View NSE categories
nmap --script-help all | grep "Categories:" | sort | uniq

# Explore specific categories
nmap --script-help vuln

nmap --script-help discovery

nmap --script-help auth

# Create results directory
mkdir -p ~/lab6_results/nse_scans
```

---

## 🔹 Step 2: Service Detection Scanning

### 📄 service_detection.sh

```bash
# Service detection with default scripts
nmap -sV -sC 127.0.0.1 \
-oA ~/lab6_results/nse_scans/service_scan

# Banner grabbing
nmap --script=banner,ssh-hostkey,http-headers \
127.0.0.1 -p 22,80,443 \
-oN ~/lab6_results/nse_scans/banner_scan.txt

# HTTP Enumeration
nmap --script=http-enum,http-methods,http-title \
127.0.0.1 -p 80,443,8080 \
-oA ~/lab6_results/nse_scans/http_scan
```

---

## 🔹 Step 3: Vulnerability Assessment

### 📄 vulnerability_scan.sh

```bash
# General vulnerability scan
nmap --script=vuln 127.0.0.1 \
-oA ~/lab6_results/nse_scans/vuln_scan

# SSL/TLS analysis
nmap --script=ssl-enum-ciphers,ssl-cert,ssl-known-key \
127.0.0.1 -p 443 \
-oN ~/lab6_results/nse_scans/ssl_scan.txt

# Authentication testing
nmap --script=auth \
127.0.0.1 -p 21,22,23,25 \
-oA ~/lab6_results/nse_scans/auth_scan
```

---

## 🔹 Step 4: Create Custom NSE Script

### 📄 simple-banner.nse

```lua
local shortport = require "shortport"
local stdnse = require "stdnse"

description = [[
Simple banner grabbing script
for educational purposes.
]]

author = "Student"

categories = {"discovery", "safe"}

portrule = shortport.port_or_service({22, 80, 443})

action = function(host, port)

    -- TODO:
    -- Create socket connection
    -- Receive banner
    -- Return results

    return "Banner grab implementation needed"
end
```

Create directory:

```bash
mkdir -p ~/custom_nse
```

Test script:

```bash
nmap --script=~/custom_nse/simple-banner.nse \
127.0.0.1 -p 22,80
```

---

# ⚡ Task 2: High-Speed Scanning with Masscan

---

## 🔹 Step 1: Basic Masscan Operations

### 📄 masscan_basics.sh

```bash
mkdir -p ~/lab6_results/masscan_scans

# Common ports
sudo masscan 127.0.0.1 \
-p 1-1000 \
--rate=1000 \
-oX ~/lab6_results/masscan_scans/common_ports.xml

# Service ports
sudo masscan 127.0.0.1 \
-p 21,22,23,25,53,80,110,143,443,3306,5432 \
--rate=500 \
-oG ~/lab6_results/masscan_scans/services.gnmap

cat ~/lab6_results/masscan_scans/services.gnmap
```

---

## 🔹 Step 2: Create Masscan Parser

### 📄 masscan_parser.py

```python
#!/usr/bin/env python3

import xml.etree.ElementTree as ET
import sys
from collections import defaultdict

class MasscanParser:

    def __init__(self, xml_file):

        self.xml_file = xml_file

        self.results = defaultdict(list)

    def parse_xml(self):
        """
        Parse XML results.

        TODO:
        - Parse hosts
        - Parse ports
        - Store findings
        """
        pass

    def generate_report(self):
        """
        Generate report.

        TODO:
        - Format output
        - Display statistics
        """
        pass

    def export_json(self, output_file):
        """
        Export JSON.

        TODO:
        - Convert results
        - Save file
        """
        pass

if __name__ == "__main__":

    if len(sys.argv) != 2:
        print("Usage: python3 masscan_parser.py <xml_file>")
        sys.exit(1)

    parser = MasscanParser(sys.argv[1])

    # TODO:
    # Execute parser
```

---

## 🔹 Step 3: Hybrid Scanning Strategy

### 📄 hybrid_scanner.py

```python
#!/usr/bin/env python3

import subprocess
import xml.etree.ElementTree as ET
import os

class HybridScanner:

    def __init__(
        self,
        target,
        results_dir="~/lab6_results/hybrid"
    ):

        self.target = target

        self.results_dir = os.path.expanduser(results_dir)

        os.makedirs(self.results_dir, exist_ok=True)

    def masscan_discovery(self, port_range="1-1000"):
        """
        Fast port discovery.

        TODO:
        - Run Masscan
        - Parse results
        """
        pass

    def nmap_detailed_scan(self, ports):
        """
        Detailed Nmap scan.

        TODO:
        - Run Nmap
        - Save results
        """
        pass

    def run_hybrid_scan(self):
        """
        Complete workflow.

        TODO:
        - Discover ports
        - Execute Nmap
        - Generate summary
        """
        pass

if __name__ == "__main__":

    scanner = HybridScanner("127.0.0.1")

    # TODO:
    # Execute scan
```

---

# 🤖 Task 3: Automated Scanning Framework

---

## 🔹 Step 1: Build Automation System

### 📄 scan_automation.py

```python
#!/usr/bin/env python3

import subprocess
import json
import logging
from datetime import datetime
import os

class ScanAutomation:

    def __init__(self,
                 config_file="scan_config.json"):

        self.config_file = config_file

        self.results_dir = "automated_scans"

        self.setup_logging()

        self.load_config()

    def setup_logging(self):
        """
        Configure logging.

        TODO:
        - Log to console
        - Log to file
        """
        pass

    def load_config(self):
        """
        Load configuration.

        TODO:
        - Parse JSON
        - Validate data
        """
        pass

    def execute_nmap_scan(self,
                          target,
                          scan_type):
        """
        Execute Nmap scan.

        TODO:
        - Build command
        - Execute
        """
        pass

    def execute_masscan_scan(self,
                             target,
                             port_range):
        """
        Execute Masscan.

        TODO:
        - Run scan
        - Save results
        """
        pass

    def run_scan_suite(self, target):
        """
        Full scan suite.

        TODO:
        - Execute scans
        - Generate summary
        """
        pass

if __name__ == "__main__":

    # TODO:
    # Run framework
    pass
```

---

## 🔹 Step 2: Scan Configuration

### 📄 scan_config.json

```json
{
  "targets": ["127.0.0.1"],

  "scan_types": {

    "quick": {
      "tool": "nmap",
      "args": ["-sS", "-F", "-T4"],
      "description": "Fast SYN scan"
    },

    "detailed": {
      "tool": "nmap",
      "args": ["-sV", "-sC", "-A"],
      "description": "Service detection"
    },

    "mass": {
      "tool": "masscan",
      "args": ["-p1-1000", "--rate=1000"],
      "description": "Rapid discovery"
    }
  },

  "output_formats": [
    "xml",
    "nmap",
    "gnmap"
  ]
}
```

---

## 🔹 Step 3: Result Aggregation

### 📄 result_aggregator.py

```python
#!/usr/bin/env python3

import os
import json
import xml.etree.ElementTree as ET
from collections import defaultdict
import glob

class ResultAggregator:

    def __init__(
        self,
        base_dir="~/lab6_results"
    ):

        self.base_dir = os.path.expanduser(base_dir)

        self.aggregated_data = defaultdict(list)

    def find_scan_files(self,
                        file_pattern="*.xml"):
        """
        Locate scan files.

        TODO:
        - Use glob
        - Return files
        """
        pass

    def parse_nmap_xml(self, xml_file):
        """
        Parse Nmap XML.

        TODO:
        - Extract ports
        - Extract services
        """
        pass

    def parse_masscan_xml(self, xml_file):
        """
        Parse Masscan XML.

        TODO:
        - Extract ports
        - Extract hosts
        """
        pass

    def generate_summary_report(self):
        """
        Generate report.

        TODO:
        - Aggregate findings
        """
        pass

    def export_consolidated_results(
        self,
        output_file
    ):
        """
        Export JSON.

        TODO:
        - Save results
        """
        pass

if __name__ == "__main__":

    aggregator = ResultAggregator()

    # TODO:
    # Aggregate findings
```

---

# 📊 Task 4: Analysis and Reporting

---

## 🔹 Step 1: Compare Scanning Techniques

### 📄 compare_scans.sh

```bash
#!/bin/bash

echo "=== Scanning Technique Comparison ==="

echo ""

echo "Running Nmap quick scan..."
time nmap -F 127.0.0.1 -oN nmap_quick.txt

echo "Running Masscan quick scan..."
time sudo masscan 127.0.0.1 \
-p1-1000 \
--rate=1000 \
-oG masscan_quick.txt

echo "Running Nmap detailed scan..."
time nmap -sV -sC 127.0.0.1 \
-p 1-1000 \
-oN nmap_detailed.txt

echo ""
echo "Compare speed vs detail."
```

Execute:

```bash
chmod +x compare_scans.sh

./compare_scans.sh
```

---

## 🔹 Step 2: Generate Professional Report

### 📄 report_generator.py

```python
#!/usr/bin/env python3

from datetime import datetime
import json

class ReportGenerator:

    def __init__(self, scan_data):

        self.scan_data = scan_data

        self.report_date = datetime.now()

    def generate_executive_summary(self):
        """
        Executive Summary

        TODO:
        - Summarize findings
        """
        pass

    def generate_technical_details(self):
        """
        Technical Findings

        TODO:
        - Document services
        - Document vulnerabilities
        """
        pass

    def generate_recommendations(self):
        """
        Recommendations

        TODO:
        - Prioritize fixes
        """
        pass

    def export_html_report(self, output_file):
        """
        Export HTML.

        TODO:
        - Build HTML report
        """
        pass

if __name__ == "__main__":

    # TODO:
    # Generate report
    pass
```

---

# 📁 Expected Deliverables

| File | Purpose |
|--------|----------|
| NSE Scan Results | Service Enumeration |
| Masscan Results | Port Discovery |
| Custom NSE Script | Banner Collection |
| Python Automation Scripts | Scan Automation |
| Aggregated Reports | Consolidated Findings |
| HTML Security Report | Professional Reporting |

---

# 🛠️ Troubleshooting Guide

## ⚠️ Masscan Requires Root

Solution:

```bash
sudo masscan
```

---

## ⚠️ NSE Scripts Missing

Update database:

```bash
nmap --script-updatedb
```

---

## ⚠️ Python Import Errors

Install dependencies:

```bash
pip3 install schedule
```

---

## ⚠️ Scan Timeout Issues

Solutions:

✅ Reduce port ranges

✅ Lower Masscan rate

✅ Increase timeout values

---

## ⚠️ XML Parsing Errors

Verify:

- XML is complete
- Scan completed successfully
- File is well-formed

---

# 🎓 Learning Outcomes

After completing this lab, students will have:

✅ NSE proficiency

✅ Masscan experience

✅ Python scan automation skills

✅ Result analysis expertise

✅ Hybrid scanning methodology

---

# 🔐 Ethical Reminder

> ⚠️ Only scan systems you own or have explicit written authorization to test.

Always:

✔️ Follow organizational policies

✔️ Respect legal boundaries

✔️ Conduct authorized testing only

✔️ Follow responsible disclosure practices

---

# 🏁 Conclusion

This lab introduced advanced network reconnaissance using **Nmap NSE** and **Masscan**.

Students learned how to:

🔍 Enumerate services using NSE scripts

⚡ Perform high-speed discovery with Masscan

🤖 Automate scanning using Python

📊 Aggregate and analyze scan results

🛡️ Generate professional assessment reports

The hybrid approach combines the speed of Masscan with the depth of Nmap, creating an efficient workflow for professional security assessments.

---

<div align="center">

### 🌟 Nmap NSE • Masscan • Automation • Network Reconnaissance 🌟

</div>
````
