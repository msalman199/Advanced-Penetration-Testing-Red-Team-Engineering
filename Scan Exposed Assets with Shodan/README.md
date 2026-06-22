# 🌐 Scan Exposed Assets with Shodan

<div align="center">

# 🔍 Internet-Wide Asset Discovery & Reconnaissance Lab

### Learn OSINT, Asset Enumeration, Automation, and Security Analysis with Shodan

![Python](https://img.shields.io/badge/Python-3.x-blue?logo=python)
![Shodan](https://img.shields.io/badge/Shodan-API-red)
![Linux](https://img.shields.io/badge/Linux-Ubuntu-orange?logo=linux)
![Pandas](https://img.shields.io/badge/Pandas-Data%20Analysis-purple?logo=pandas)
![Matplotlib](https://img.shields.io/badge/Matplotlib-Visualization-green)
![OpenPyXL](https://img.shields.io/badge/OpenPyXL-Excel-success)
![JSON](https://img.shields.io/badge/JSON-Data%20Export-black)
![CSV](https://img.shields.io/badge/CSV-Reporting-yellow)

</div>

---

# 🎯 Objectives

By the end of this lab, students will be able to:

✅ Perform internet-wide asset discovery using Shodan search queries

✅ Automate reconnaissance processes using Python and the Shodan API

✅ Analyze and export scan results for security assessments

✅ Apply ethical OSINT methodologies for asset enumeration

✅ Identify potentially vulnerable services and exposed systems

---

# 📚 Prerequisites

Before starting this lab, ensure you have:

🔹 Basic networking knowledge (IP addresses, ports, protocols)

🔹 Familiarity with Linux command-line operations

🔹 Basic Python programming skills

🔹 Understanding of ethical hacking principles and legal considerations

---

# 🖥️ Lab Environment

Al Nafi provides Linux-based cloud machines with:

- Python 3
- Shodan CLI
- Pip
- Development utilities

---

# 🚀 Task 1: Configure Shodan and Perform Basic Reconnaissance

---

## 🔹 Step 1: Install Shodan Tools

### 📄 install_shodan.sh

```bash
# Update system and install dependencies
sudo apt update && sudo apt install python3 python3-pip -y

# Install Shodan Python library
pip3 install shodan pandas
```

---

## 🔹 Step 2: Configure Shodan API

### 📄 configure_shodan.sh

```bash
# Initialize Shodan API
shodan init YOUR_API_KEY_HERE

# Verify installation
shodan info
```

### Create a free account:

👉 https://www.shodan.io

Copy your API key from the account dashboard.

---

## 🔹 Step 3: Perform Basic Command-Line Searches

### 📄 basic_searches.sh

```bash
# Create working directory
mkdir ~/shodan_lab && cd ~/shodan_lab

# Search Apache servers
shodan search apache --limit 10

# Search SSH services
shodan search port:22 --limit 10

# Search by country
shodan search "apache country:US" --limit 10

# Search nginx services
shodan search "product:nginx" --limit 10
```

---

## 🔹 Step 4: Use Advanced Search Filters

### 📄 advanced_searches.sh

```bash
# Combine multiple filters
shodan search "port:80 country:US city:NewYork"

# Search for Heartbleed vulnerable hosts
shodan search "vuln:CVE-2014-0160"

# Search by organization
shodan search 'org:"Amazon"'

# Search specific OpenSSH versions
shodan search "OpenSSH 7.4" port:22
```

---

## 🔹 Step 5: Retrieve Host Information

### 📄 host_lookup.sh

```bash
# Detailed host information
shodan host 8.8.8.8

# Save search results
shodan search apache --limit 50 > apache_results.txt
```

---

# 🤖 Task 2: Automate Asset Discovery with Python

---

## 🔹 Step 1: Create Shodan Scanner Class

### 📄 shodan_scanner.py

```python
#!/usr/bin/env python3

"""
Shodan Asset Discovery Scanner
Students: Complete the TODO sections to implement full functionality
"""

import shodan
import json
import csv
from datetime import datetime

class ShodanScanner:

    def __init__(self, api_key):
        """
        Initialize Shodan scanner with API key
        """

        self.api = shodan.Shodan(api_key)
        self.results = []

    def search_assets(self, query, limit=100):
        """
        Search for assets using Shodan API
        """

        try:
            print(f"[+] Searching for: {query}")

            # TODO:
            # Perform API search
            # Extract IP, Port, Service, Country
            # Store in self.results

            pass

        except shodan.APIError as e:
            print(f"[-] Error: {e}")
            return []

    def get_host_info(self, ip):
        """
        Get detailed host information
        """

        # TODO:
        # Implement self.api.host()
        pass

    def save_to_json(self, filename):
        """
        Export results to JSON
        """

        # TODO:
        pass

    def save_to_csv(self, filename):
        """
        Export results to CSV
        """

        # TODO:
        pass
```

---

## 🔹 Step 2: Create Main Discovery Script

### 📄 asset_discovery.py

```python
#!/usr/bin/env python3

"""
Automated Asset Discovery Tool
Students: Complete the implementation
"""

import time
from shodan_scanner import ShodanScanner

def main():

    API_KEY = "YOUR_API_KEY_HERE"

    scanner = ShodanScanner(API_KEY)

    queries = [
        "apache",
        "nginx",
        "port:22",
        "Microsoft-IIS"
    ]

    # TODO:
    # Loop through queries
    # Call scanner.search_assets()
    # Implement rate limiting
    # Remove duplicates
    # Export results

    print("[+] Discovery complete")

if __name__ == "__main__":
    main()
```

---

## 🔹 Step 3: Create Analysis Engine

### 📄 analyze_results.py

```python
#!/usr/bin/env python3

"""
Shodan Results Analysis Tool
Students: Implement analysis functions
"""

import json
import pandas as pd
from collections import Counter

class ResultAnalyzer:

    def __init__(self, results_file):

        # TODO:
        # Load JSON data
        # Create DataFrame

        pass

    def generate_summary(self):

        # TODO:
        # Total assets
        # Unique IPs
        # Countries
        # Services
        # Ports

        pass

    def identify_vulnerable_services(self):

        # TODO:
        # Find risky services
        # Identify outdated software

        pass

    def export_report(self, output_file):

        # TODO:
        # Generate final report

        pass

def main():

    # TODO:
    pass

if __name__ == "__main__":
    main()
```

---

## 🔹 Step 4: Test the Implementation

### 📄 test_scripts.sh

```bash
chmod +x shodan_scanner.py
chmod +x asset_discovery.py
chmod +x analyze_results.py

python3 asset_discovery.py

python3 analyze_results.py results.json
```

---

# 📊 Task 3: Export and Analyze Scan Results

---

## 🔹 Step 1: Enhanced Export Module

### 📄 export_results.py

```python
#!/usr/bin/env python3

"""
Enhanced Results Export Tool
Students: Implement export functionality
"""

import json
import csv
import pandas as pd
from datetime import datetime

class ResultsExporter:

    def __init__(self, results_data):

        self.data = results_data
        self.df = pd.DataFrame(results_data)

    def export_to_csv(self, filename):

        # TODO:
        # Risk scoring
        # Risk categories

        pass

    def export_to_excel(self, filename):

        # TODO:
        # Multiple sheets
        # Summary reports

        pass

    def export_to_html(self, filename):

        # TODO:
        # Styled HTML report

        pass

    def calculate_risk_score(self, row):

        # TODO:
        # Risk calculation logic

        pass

def main():

    # TODO:
    pass

if __name__ == "__main__":
    main()
```

---

## 🔹 Step 2: Visualization Module

### 📄 visualize_results.py

```python
#!/usr/bin/env python3

"""
Results Visualization Tool
Students: Implement visualization functions
"""

import pandas as pd
import matplotlib.pyplot as plt
import json

def create_service_chart(df, output_file):

    # TODO:
    # Service distribution chart

    pass

def create_country_chart(df, output_file):

    # TODO:
    # Country pie chart

    pass

def create_port_chart(df, output_file):

    # TODO:
    # Port usage chart

    pass

def main():

    # TODO:
    # Load results
    # Create charts

    pass

if __name__ == "__main__":
    main()
```

---

# 🔄 Complete Analysis Pipeline

### 📄 run_pipeline.sh

```bash
# Run discovery
python3 asset_discovery.py

# Analyze results
python3 analyze_results.py results.json

# Export reports
python3 export_results.py results.json

# Generate visualizations
python3 visualize_results.py results.json

# Verify generated files
ls -lh *.csv *.xlsx *.html *.png
```

---

# 📁 Expected Output Files

| File | Purpose |
|--------|----------|
| results.json | Raw Shodan results |
| results.csv | Results with risk scoring |
| analysis_report.txt | Findings & statistics |
| results.xlsx | Multi-sheet workbook |
| report.html | Interactive report |
| service_chart.png | Service distribution |
| country_chart.png | Country distribution |
| port_chart.png | Port distribution |

---

# 🛠️ Troubleshooting Guide

## ⚠️ API Rate Limiting

```bash
shodan info
```

Recommendations:

✅ Use fewer queries

✅ Add delays using:

```python
time.sleep(1)
```

✅ Reduce result limits

---

## ⚠️ Import Errors

Install dependencies:

```bash
pip3 install shodan pandas matplotlib openpyxl
```

Verify version:

```bash
python3 --version
```

---

## ⚠️ Empty Results

Check API key:

```bash
shodan info
```

Try simpler searches:

```bash
shodan search apache
```

Verify internet connectivity.

---

## ⚠️ Permission Issues

```bash
chmod +x script_name.py
```

Avoid unnecessary use of sudo.

---

# 🎓 Learning Outcomes

After completing this lab, students will have:

✅ Configured Shodan CLI and API

✅ Conducted internet-scale reconnaissance

✅ Built automated asset discovery tools

✅ Implemented security analysis workflows

✅ Exported results into multiple formats

✅ Created professional visualizations

✅ Identified exposed services and security risks

---

# 🔐 Ethical Considerations

> ⚠️ Security professionals must always operate responsibly.

### Follow These Rules

✔️ Only assess systems you own or have permission to test

✔️ Respect privacy and legal boundaries

✔️ Use responsible disclosure practices

✔️ Never perform unauthorized scanning

✔️ Follow organizational security policies

---

# 🏁 Conclusion

This lab introduced students to the powerful capabilities of **Shodan**, the world's leading search engine for internet-connected devices.

Through hands-on exercises, students learned how to:

🔍 Discover exposed assets

⚙️ Automate reconnaissance workflows

📊 Analyze large-scale security data

📈 Visualize findings

🛡️ Prioritize risk based on exposure

The techniques learned here provide a strong foundation for **OSINT investigations, attack surface management, security assessments, and cyber defense operations.**

---

<div align="center">

### 🌟 Happy Hunting — Responsibly & Ethically 🌟

**Shodan + Python + OSINT + Security Analytics**

</div>
