
# 🔎 Map External Targets with Google Dorking

<div align="center">

# 🌐 External Reconnaissance & Target Mapping 

### Master Google Dorking, Certificate Transparency Logs, and Automated OSINT Collection

![Python](https://img.shields.io/badge/Python-3.x-blue?logo=python)
![Linux](https://img.shields.io/badge/Linux-Ubuntu-orange?logo=linux)
![Google](https://img.shields.io/badge/Google-Dorking-red?logo=google)
![OSINT](https://img.shields.io/badge/OSINT-Reconnaissance-purple)
![DNS](https://img.shields.io/badge/DNS-Enumeration-blue)
![SSL/TLS](https://img.shields.io/badge/SSL/TLS-Certificate%20Transparency-green)
![JSON](https://img.shields.io/badge/JSON-Reporting-black)
![Automation](https://img.shields.io/badge/Automation-Python-success)

</div>

---

# 🎯 Objectives

By the end of this lab, students will be able to:

✅ Apply advanced Google Dorking techniques for reconnaissance

✅ Utilize Certificate Transparency logs for subdomain enumeration

✅ Develop Python scripts for automated information gathering

✅ Understand ethical and legal boundaries of external reconnaissance

✅ Create systematic approaches to target mapping

---

# 📚 Prerequisites

Before starting this lab, ensure you have:

🔹 Basic Linux command-line proficiency

🔹 Fundamental networking concepts (DNS, subdomains, SSL/TLS)

🔹 Python programming basics

🔹 Understanding of web technologies and HTTP/HTTPS

🔹 Knowledge of ethical hacking principles

---

# 🖥️ Lab Environment

Your cloud machine includes:

- Python 3.x
- pip
- curl
- wget
- Nano/Vim editors
- Web browser
- Networking utilities

---

# 🚀 Task 1: Master Google Dorking Techniques

---

## 🔹 Step 1: Create Google Dork Reference

### 📄 google_dorks.txt

```text
# Core Google Dork Operators

site:       - Limit search to specific domain

filetype:   - Search for specific file extensions

inurl:      - Find terms in URLs

intitle:    - Find terms in page titles

intext:     - Find terms in page content

cache:      - View cached pages
```

---

## 🔹 Step 2: Practice Manual Dorking

### 📄 manual_dork_examples.txt

```text
# Subdomain Discovery
site:*.example.com

# Admin Panels
site:example.com inurl:admin OR inurl:login

# Configuration Files
site:example.com filetype:xml OR filetype:conf OR filetype:ini

# Directory Listings
site:example.com intitle:"index of"

# Backup Files
site:example.com filetype:bak OR filetype:old
```

Document findings:

### 📄 manual_dork_results.txt

```text
Record discovered pages, files, subdomains,
and interesting observations here.
```

---

## 🔹 Step 3: Create Automated Google Dorking Tool

### 📄 google_dorker.py

```python
#!/usr/bin/env python3

import requests
import time
import urllib.parse
import sys
from bs4 import BeautifulSoup
import random

class GoogleDorker:

    def __init__(self):

        self.session = requests.Session()

        self.session.headers.update({
            "User-Agent":
            "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36"
        })

    def search_google(self, query, num_results=10):
        """
        Perform Google search.
        """

        # TODO:
        # Encode query
        # Build search URL
        # Add delay
        # Parse results
        # Return findings

        pass

    def dork_target(self, target_domain, dork_list):
        """
        Execute dork campaign.
        """

        # TODO:
        # Replace TARGET placeholder
        # Execute searches
        # Return results

        pass

    def save_results(self, results, filename):
        """
        Save findings.
        """

        # TODO:
        # Export formatted report

        pass

def main():

    if len(sys.argv) != 2:
        print("Usage: python3 google_dorker.py <target_domain>")
        sys.exit(1)

    target = sys.argv[1]

    dorks = {
        "Subdomains":
            "site:*.TARGET",

        "Admin Panels":
            "site:TARGET inurl:admin OR inurl:login",

        "Config Files":
            "site:TARGET filetype:xml OR filetype:conf",

        "Login Pages":
            "site:TARGET \"login\" OR \"sign in\""
    }

    # TODO:
    # Run dork campaign
    # Save output

if __name__ == "__main__":
    main()
```

Install dependencies:

```bash
pip3 install requests beautifulsoup4

chmod +x google_dorker.py
```

---

## 🔹 Step 4: Execute Dorking Tool

### 📄 run_google_dorker.sh

```bash
python3 google_dorker.py example.com
```

⚠️ Only assess domains you own or have written authorization to test.

---

# 🔐 Task 2: Leverage Certificate Transparency Logs

---

## 🔹 Step 1: Understand CT Logs

Certificate Transparency (CT) logs record all publicly issued SSL/TLS certificates.

Popular search platform:

🔗 https://crt.sh

---

## 🔹 Step 2: Manual crt.sh Exploration

### 📄 crtsh_manual_queries.sh

```bash
curl -s "https://crt.sh/?q=%.example.com&output=json" | head -50

curl -s "https://crt.sh/?q=%.example.com&output=json" \
| python3 -m json.tool | less
```

---

## 🔹 Step 3: Build Subdomain Discovery Tool

### 📄 subdomain_hunter.py

```python
#!/usr/bin/env python3

import requests
import json
import sys
import socket
import concurrent.futures

class SubdomainHunter:

    def __init__(self):

        self.session = requests.Session()

        self.session.headers.update({
            "User-Agent":
            "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36"
        })

    def search_crtsh(self, domain):
        """
        Query Certificate Transparency logs.
        """

        # TODO:
        # Query crt.sh
        # Parse JSON
        # Return subdomains

        pass

    def resolve_subdomain(self, subdomain):
        """
        Resolve DNS.
        """

        # TODO:
        # Resolve IP
        # Return results

        pass

    def check_http_status(self, subdomain):
        """
        Analyze web services.
        """

        # TODO:
        # Check HTTP
        # Check HTTPS

        pass

    def analyze_subdomains(self,
                           subdomains,
                           max_workers=15):
        """
        Concurrent analysis.
        """

        # TODO:
        # Resolve domains
        # Check services

        pass

    def generate_report(self,
                        domain,
                        subdomains,
                        resolved,
                        http_results):
        """
        Generate report.
        """

        # TODO:
        # Write findings

        pass

def main():

    if len(sys.argv) != 2:
        print("Usage: python3 subdomain_hunter.py <domain>")
        sys.exit(1)

    domain = sys.argv[1]

    # TODO:
    # Execute workflow

if __name__ == "__main__":
    main()
```

Make executable:

```bash
chmod +x subdomain_hunter.py
```

---

## 🔹 Step 4: Execute Subdomain Discovery

### 📄 run_subdomain_hunter.sh

```bash
python3 subdomain_hunter.py example.com
```

Review findings:

```bash
cat subdomain_report_example_com.txt

cat subdomains_example_com.txt
```

---

# 🛰️ Task 3: Build Unified Reconnaissance Framework

---

## 🔹 Step 1: Create Integrated Framework

### 📄 recon_framework.py

```python
#!/usr/bin/env python3

import requests
import json
import sys
import time
import socket
import concurrent.futures
import argparse
from datetime import datetime
import os

class ReconFramework:

    def __init__(self,
                 target_domain,
                 output_dir="recon_results"):

        self.target = target_domain.lower().strip()

        self.output_dir = output_dir

        self.session = requests.Session()

        if not os.path.exists(self.output_dir):
            os.makedirs(self.output_dir)

        self.results = {
            "target": self.target,
            "timestamp": datetime.now().isoformat(),
            "google_dorks": {},
            "subdomains": {},
            "summary": {}
        }

    def log_message(self, message, level="INFO"):

        # TODO:
        # Print timestamped log

        pass

    def google_dorking(self):

        # TODO:
        # Execute dork campaign

        pass

    def subdomain_discovery(self):

        # TODO:
        # Discover subdomains

        pass

    def search_crtsh(self):

        # TODO:
        # Query CT logs

        pass

    def analyze_subdomains(self,
                           subdomains,
                           max_workers=15):

        # TODO:
        # Resolve domains
        # Analyze services

        pass

    def generate_reports(self):

        # TODO:
        # Generate reports

        pass

    def generate_text_report(self):

        # TODO:
        # Create readable report

        pass

    def generate_json_report(self):

        # TODO:
        # Save JSON report

        pass

    def run_full_recon(self):

        # TODO:
        # Execute workflow

        pass

def main():

    parser = argparse.ArgumentParser(
        description="Comprehensive Reconnaissance Framework"
    )

    parser.add_argument("target")

    parser.add_argument(
        "-o",
        "--output",
        default="recon_results"
    )

    parser.add_argument(
        "--no-dorks",
        action="store_true"
    )

    parser.add_argument(
        "--no-subdomains",
        action="store_true"
    )

    args = parser.parse_args()

    # TODO:
    # Create framework
    # Execute modules

if __name__ == "__main__":
    main()
```

Make executable:

```bash
chmod +x recon_framework.py
```

---

## 🔹 Step 2: Execute Full Reconnaissance

### 📄 run_framework.sh

```bash
python3 recon_framework.py example.com
```

Skip dorking:

```bash
python3 recon_framework.py example.com --no-dorks
```

Custom output directory:

```bash
python3 recon_framework.py example.com -o custom_output
```

---

## 🔹 Step 3: Analyze Reports

### 📄 analyze_reports.sh

```bash
cat recon_results/recon_report_example_com.txt

cat recon_results/recon_report_example_com.json \
| python3 -m json.tool

wc -l recon_results/subdomains_example_com.txt
```

---

# 📁 Expected Deliverables

| File | Purpose |
|--------|----------|
| google_dorker.py | Automated Google Dorking |
| subdomain_hunter.py | CT-based subdomain enumeration |
| recon_framework.py | Unified reconnaissance platform |
| recon_report.txt | Intelligence summary |
| recon_report.json | Machine-readable report |
| subdomains.txt | Discovered subdomains |

---

# 🛠️ Troubleshooting Guide

## ⚠️ Google Blocks Requests

Solutions:

✅ Increase delays (5–10 seconds)

✅ Use rotating proxies

✅ Consider Google Custom Search API

---

## ⚠️ crt.sh Timeouts

Verify service manually:

```bash
curl https://crt.sh
```

Check:

- Internet connectivity
- Valid target domain
- SSL certificate existence

---

## ⚠️ DNS Resolution Failures

Try alternate resolvers:

```text
8.8.8.8

1.1.1.1
```

Verify network connectivity.

---

## ⚠️ HTTP Connection Timeouts

Increase timeout values:

```python
timeout=10
```

Reduce thread count.

Verify firewall settings.

---

# 🎓 Learning Outcomes

After completing this lab, students will have:

✅ Created Google Dorking automation tools

✅ Built Certificate Transparency discovery scripts

✅ Automated target intelligence gathering

✅ Generated reconnaissance reports

✅ Developed structured OSINT workflows

✅ Understood ethical reconnaissance practices

---

# 🔐 Legal & Ethical Reminder

> ⚠️ Only perform reconnaissance against systems you own or have explicit written authorization to assess.

Always:

✔️ Respect privacy

✔️ Follow responsible disclosure

✔️ Stay within legal boundaries

✔️ Follow organizational policies

---

# 🏁 Conclusion

This lab introduced essential external reconnaissance techniques used in penetration testing and security assessments.

Students learned how to:

🔍 Discover exposed information with Google Dorking

🌐 Enumerate subdomains through Certificate Transparency logs

⚙️ Automate intelligence gathering with Python

📊 Generate structured reconnaissance reports

🛰️ Build scalable OSINT frameworks

These techniques form the foundation of modern attack-surface mapping, threat intelligence, and reconnaissance operations.

---

<div align="center">

### 🌟 Google Dorking • Certificate Transparency • OSINT • Target Mapping 🌟

</div>
````
