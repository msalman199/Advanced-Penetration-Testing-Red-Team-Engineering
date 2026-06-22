
# 🕷️ Set Up SpiderFoot + recon-ng Pipelines

<div align="center">

# 🔍 Automated OSINT & Reconnaissance Pipeline 

### Build Professional Reconnaissance Workflows with SpiderFoot, recon-ng, and Python Automation

![Python](https://img.shields.io/badge/Python-3.x-blue?logo=python)
![Linux](https://img.shields.io/badge/Linux-Ubuntu-orange?logo=linux)
![SpiderFoot](https://img.shields.io/badge/SpiderFoot-OSINT-red)
![Recon-ng](https://img.shields.io/badge/recon--ng-Reconnaissance-darkgreen)
![OSINT](https://img.shields.io/badge/OSINT-Intelligence-purple)
![JSON](https://img.shields.io/badge/JSON-Configuration-black)
![DNS](https://img.shields.io/badge/DNS-Reconnaissance-blue)
![Automation](https://img.shields.io/badge/Automation-Pipeline-success)

</div>

---

# 🎯 Objectives

By the end of this lab, students will be able to:

✅ Install and configure SpiderFoot and recon-ng

✅ Create Python automation scripts for OSINT collection

✅ Build integrated reconnaissance pipelines

✅ Generate automated reconnaissance reports

✅ Implement ethical reconnaissance workflows

---

# 📚 Prerequisites

Before starting this lab, ensure you have:

🔹 Basic Linux command-line proficiency

🔹 Fundamental Python programming skills

🔹 Understanding of DNS, domains, and IP addressing

🔹 Familiarity with OSINT concepts

🔹 Understanding of ethical hacking principles

---

# 🖥️ Lab Environment

Al Nafi provides pre-configured Linux cloud machines with:

- Python 3
- Git
- SpiderFoot
- recon-ng
- Required dependencies

---

# 🚀 Task 1: Install and Configure SpiderFoot

---

## 🔹 Step 1: Install SpiderFoot

### 📄 install_spiderfoot.sh

```bash
sudo apt update && sudo apt install -y python3 python3-pip git

cd /opt

sudo git clone https://github.com/smicallef/spiderfoot.git

sudo chown -R $USER:$USER /opt/spiderfoot

cd spiderfoot

pip3 install -r requirements.txt
```

---

## 🔹 Step 2: Configure SpiderFoot

### 📄 configure_spiderfoot.sh

```bash
mkdir -p ~/.spiderfoot

cd /opt/spiderfoot

python3 sf.py -l 127.0.0.1:5001
```

Press:

```text
Ctrl + C
```

after confirming successful startup.

---

## 🔹 Step 3: Verify Installation

### 📄 verify_spiderfoot.sh

```bash
python3 sf.py -h
```

Expected Outcome:

✅ SpiderFoot help menu appears

✅ Installation verified

---

# 🔍 Task 2: Install and Configure recon-ng

---

## 🔹 Step 1: Install recon-ng

### 📄 install_reconng.sh

```bash
cd /opt

sudo git clone https://github.com/lanmaster53/recon-ng.git

sudo chown -R $USER:$USER /opt/recon-ng

cd recon-ng

pip3 install -r REQUIREMENTS
```

---

## 🔹 Step 2: Initialize recon-ng

### 📄 initialize_reconng.sh

```bash
cd /opt/recon-ng

python3 recon-ng
```

Inside the console:

```text
marketplace install all

workspaces create lab4_recon

workspaces select lab4_recon

exit
```

---

## 🔹 Step 3: Verify Installation

### 📄 verify_reconng.sh

```bash
python3 recon-ng -w lab4_recon -x "show modules"
```

Expected Outcome:

✅ Available modules are displayed

---

# 🤖 Task 3: Create Automation Scripts

---

## 🔹 Step 1: SpiderFoot Automation Script

### 📄 spiderfoot_automation.py

```python
#!/usr/bin/env python3

"""
SpiderFoot Automation Script
Students: Complete the TODO sections to automate SpiderFoot scans
"""

import subprocess
import time
import sys
import os

class SpiderFootAutomation:

    def __init__(self, target, scan_name="auto_scan"):
        self.target = target
        self.scan_name = scan_name
        self.base_url = "http://127.0.0.1:5001"
        self.spiderfoot_process = None

    def start_spiderfoot(self):
        """Start SpiderFoot web interface"""

        # TODO:
        # Start SpiderFoot using subprocess.Popen()
        # Wait for startup

        pass

    def stop_spiderfoot(self):
        """Stop SpiderFoot web interface"""

        # TODO:
        # Terminate process

        pass

    def create_scan(self):
        """Create SpiderFoot scan"""

        # TODO:
        # Define modules
        # Build scan data
        # Submit scan request

        pass

    def export_results(self, output_file):
        """Export results"""

        # TODO:
        # Save metadata
        # Save summary

        pass

def main():

    if len(sys.argv) != 2:
        print("Usage: python3 spiderfoot_automation.py <target>")
        sys.exit(1)

    target = sys.argv[1]

    scanner = SpiderFootAutomation(target)

    # TODO:
    # Execute scan workflow

if __name__ == "__main__":
    main()
```

Make executable:

```bash
chmod +x /opt/spiderfoot_automation.py
```

---

## 🔹 Step 2: recon-ng Automation Script

### 📄 reconng_automation.py

```python
#!/usr/bin/env python3

"""
recon-ng Automation Script
Students: Complete the TODO sections
"""

import subprocess
import os
import sys

class ReconNGAutomation:

    def __init__(self, target, workspace="lab4_recon"):
        self.target = target
        self.workspace = workspace
        self.reconng_path = "/opt/recon-ng"

    def create_recon_script(self):

        # TODO:
        # Create command file
        # Add workspace commands
        # Add modules

        pass

    def run_reconnaissance(self):

        # TODO:
        # Execute recon-ng script
        # Capture results

        pass

    def export_results(self, output_file):

        # TODO:
        # Export hosts
        # Export contacts

        pass

def main():

    if len(sys.argv) != 2:
        print("Usage: python3 reconng_automation.py <target>")
        sys.exit(1)

    target = sys.argv[1]

    recon = ReconNGAutomation(target)

    # TODO:
    # Execute workflow

if __name__ == "__main__":
    main()
```

Make executable:

```bash
chmod +x /opt/reconng_automation.py
```

---

## 🔹 Step 3: Create Master Pipeline

### 📄 recon_pipeline.py

```python
#!/usr/bin/env python3

"""
Master Reconnaissance Pipeline
Students: Complete the TODO sections
"""

import subprocess
import sys
import os
from datetime import datetime

class ReconPipeline:

    def __init__(self, target):

        self.target = target

        self.timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")

        self.output_dir = (
            f"/tmp/recon_{self.target.replace('.', '_')}_{self.timestamp}"
        )

    def setup_environment(self):

        # TODO:
        # Create output directory

        pass

    def run_spiderfoot(self):

        # TODO:
        # Execute SpiderFoot automation

        pass

    def run_reconng(self):

        # TODO:
        # Execute recon-ng automation

        pass

    def perform_basic_recon(self):

        # TODO:
        # Run nslookup
        # Run dig
        # Run whois
        # Run ping

        pass

    def generate_summary_report(self):

        # TODO:
        # Generate report

        pass

    def run_pipeline(self):

        # TODO:
        # Execute all stages

        pass

def main():

    if len(sys.argv) != 2:
        print("Usage: python3 recon_pipeline.py <target>")
        sys.exit(1)

    target = sys.argv[1]

    # TODO:
    # Validate target
    # Run pipeline

if __name__ == "__main__":
    main()
```

Make executable:

```bash
chmod +x /opt/recon_pipeline.py
```

---

# 🧪 Task 4: Test and Validate Pipeline

---

## 🔹 Step 1: Test SpiderFoot Automation

### 📄 test_spiderfoot.sh

```bash
python3 /opt/spiderfoot_automation.py example.com
```

---

## 🔹 Step 2: Test recon-ng Automation

### 📄 test_reconng.sh

```bash
python3 /opt/reconng_automation.py example.com
```

---

## 🔹 Step 3: Execute Complete Pipeline

### 📄 run_pipeline.sh

```bash
python3 /opt/recon_pipeline.py example.com
```

---

## 🔹 Step 4: Review Results

### 📄 review_results.sh

```bash
ls -la /tmp/recon_*

RESULTS_DIR=$(ls -td /tmp/recon_* | head -1)

cat $RESULTS_DIR/reconnaissance_summary.txt
```

---

# 📊 Task 5: Results Analysis

---

## 🔹 Step 1: Create Analysis Script

### 📄 analyze_results.py

```python
#!/usr/bin/env python3

"""
Results Analysis Script
Students: Complete the TODO sections
"""

import os
import sys
import glob
from datetime import datetime

class ResultsAnalyzer:

    def __init__(self, results_dir):
        self.results_dir = results_dir

    def analyze_files(self):

        # TODO:
        # Locate files
        # Print size information

        pass

    def extract_key_findings(self):

        # TODO:
        # Extract IPs
        # Extract domains
        # Extract emails

        pass

    def generate_analysis_report(self):

        # TODO:
        # Build report

        pass

def main():

    if len(sys.argv) != 2:
        print("Usage: python3 analyze_results.py <results_directory>")
        sys.exit(1)

    results_dir = sys.argv[1]

    analyzer = ResultsAnalyzer(results_dir)

    # TODO:
    # Execute analysis

if __name__ == "__main__":
    main()
```

Make executable:

```bash
chmod +x /opt/analyze_results.py
```

---

# ⚙️ Task 6: Create Configuration System

---

## 🔹 Step 1: Create JSON Configuration

### 📄 recon_config.json

```json
{
    "spiderfoot": {
        "enabled": true,
        "timeout": 600,
        "modules": [
            "sfp_dnsresolve",
            "sfp_whois",
            "sfp_subdomain_enum"
        ]
    },
    "reconng": {
        "enabled": true,
        "timeout": 600,
        "workspace": "automated_recon"
    },
    "basic_tools": {
        "enabled": true,
        "tools": [
            "nslookup",
            "dig",
            "whois"
        ]
    },
    "output": {
        "base_directory": "/tmp",
        "generate_json": true
    }
}
```

---

## 🔹 Step 2: Load Configuration

### 📄 config_loader.py

```python
import json

def load_config(config_file):
    """
    Load configuration from JSON file
    """

    # TODO:
    # Open JSON file
    # Parse contents
    # Handle errors

    pass
```

---

## 🔹 Step 3: Test Configuration-Based Pipeline

### 📄 test_configuration.sh

```bash
python3 /opt/recon_pipeline.py example.com
```

Verify pipeline uses:

```text
recon_config.json
```

settings successfully.

---

# 📁 Expected Output Files

| File | Purpose |
|--------|----------|
| spiderfoot_results.txt | SpiderFoot findings |
| reconng_results.txt | recon-ng findings |
| reconnaissance_summary.txt | Pipeline summary |
| analysis_report.txt | Analysis report |
| recon_config.json | Configuration file |
| Basic Recon Files | DNS, Whois, Ping outputs |

---

# 🛠️ Troubleshooting Guide

## ⚠️ SpiderFoot Will Not Start

Check port usage:

```bash
netstat -tuln | grep 5001
```

Verify dependencies:

```bash
pip3 install -r requirements.txt
```

---

## ⚠️ recon-ng Module Errors

Inside recon-ng:

```text
marketplace install all
```

Check workspace:

```text
workspaces list
```

---

## ⚠️ Pipeline Script Errors

Verify permissions:

```bash
chmod +x /opt/*.py
```

Check Python:

```bash
which python3
```

---

## ⚠️ No Results Generated

Verify target:

```bash
ping example.com
```

Increase timeout values.

Check output directory permissions.

---

# 🎓 Learning Outcomes

After completing this lab, students will have:

✅ Installed SpiderFoot and recon-ng

✅ Automated reconnaissance using Python

✅ Built integrated OSINT pipelines

✅ Created configuration-based workflows

✅ Generated automated reconnaissance reports

✅ Developed repeatable intelligence-gathering processes

---

# 🔐 Ethical Reminder

> ⚠️ Only perform reconnaissance against systems you own or have explicit written authorization to assess.

Always:

✔️ Follow legal requirements

✔️ Respect privacy

✔️ Follow responsible disclosure practices

✔️ Maintain professional ethics

---

# 🏁 Conclusion

This lab introduced students to professional OSINT automation using SpiderFoot and recon-ng.

You learned how to:

🔍 Conduct automated reconnaissance

⚙️ Build reusable automation scripts

🕷️ Integrate SpiderFoot scanning

🛰️ Automate recon-ng investigations

📊 Analyze reconnaissance findings

📁 Create configurable intelligence pipelines

These skills provide a strong foundation for security assessments, threat intelligence collection, attack surface mapping, and red team reconnaissance operations.

---

<div align="center">

### 🌟 Automated Reconnaissance • OSINT • Threat Intelligence • Security Research 🌟

</div>
````
