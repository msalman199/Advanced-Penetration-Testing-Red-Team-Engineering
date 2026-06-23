# 🧭 Pivot Using SSH Tunnels and Port Forwarding  
## 🛡️ Advanced Penetration Testing Lab (Al Nafi Cloud Environment)

---

![Linux](https://img.shields.io/badge/OS-Linux-Ubuntu-orange)
![SSH](https://img.shields.io/badge/Protocol-SSH_Tunneling-blue)
![Python](https://img.shields.io/badge/Python-3.8+-green)
![Networking](https://img.shields.io/badge/Networking-Pivoting-red)
![Level](https://img.shields.io/badge/Level-Intermediate-purple)

---

# 🎯 Objectives

✔ Understand SSH tunneling for pivoting scenarios  
✔ Configure Local, Remote & Dynamic Port Forwarding  
✔ Build SOCKS proxy for traffic redirection  
✔ Access internal services via compromised hosts  
✔ Automate tunnel management using Python  
✔ Apply pivoting techniques in ethical penetration testing  

---

# 📌 Prerequisites

- 🐧 Linux command line basics  
- 🌐 TCP/IP networking fundamentals  
- 🔐 SSH authentication knowledge  
- 🐍 Basic Python programming  
- 🧪 Penetration testing workflow understanding  

---

# 🖥️ Lab Environment Setup

> ⚙️ Al Nafi Cloud Ubuntu 20.04 preconfigured machine

- OpenSSH Server/Client  
- Python 3.8+  
- Netcat, Nmap installed  

---

# 🧩 TASK 1 — Local Port Forwarding

## 🔷 Step 1: Setup Environment

```bash
sudo apt update && sudo apt install -y openssh-server openssh-client python3 python3-pip netcat nmap

sudo useradd -m -s /bin/bash pivot_user
echo "pivot_user:pivot123" | sudo chpasswd

sudo -u pivot_user ssh-keygen -t rsa -b 2048 -f /home/pivot_user/.ssh/id_rsa -N ""
sudo -u pivot_user cat /home/pivot_user/.ssh/id_rsa.pub >> /home/pivot_user/.ssh/authorized_keys

sudo systemctl start ssh
sudo systemctl enable ssh
sudo systemctl status ssh | grep Active
🌐 Step 2: Create Target Service
python3 -m http.server 8080 --directory /tmp &
netstat -tlnp | grep 8080
curl -I http://localhost:8080
🔐 Step 3: Local Port Forwarding
ssh -f -N -L 9090:localhost:8080 pivot_user@localhost

ps aux | grep "ssh.*-L"
netstat -tlnp | grep 9090
curl -I http://localhost:9090
🐍 Step 4: Python Local Tunnel Script
#!/usr/bin/env python3
import socket
import subprocess
import time

def test_local_port_forward(original_port, forwarded_port):
    pass

def create_tunnel(local_port, remote_host, remote_port, ssh_user, ssh_host):
    pass

if __name__ == "__main__":
    pass
🧩 TASK 2 — Dynamic Port Forwarding (SOCKS Proxy)
🟣 Step 1: SOCKS Tunnel
ssh -f -N -D 1080 pivot_user@localhost

netstat -tlnp | grep 1080
ps aux | grep "ssh.*-D"
🔧 Step 2: ProxyChains Setup
sudo apt install -y proxychains4

sudo tee /etc/proxychains4.conf > /dev/null << 'EOF'
strict_chain
proxy_dns
tcp_read_time_out 15000
tcp_connect_time_out 8000

[ProxyList]
socks5 127.0.0.1 1080
EOF
🧪 Test Proxy
proxychains4 nc -zv localhost 22
proxychains4 nmap -sT -Pn localhost -p 22,80,8080
🐍 SOCKS Scanner Skeleton
#!/usr/bin/env python3
import socket
import socks
from concurrent.futures import ThreadPoolExecutor

class SOCKSScanner:
    def __init__(self, proxy_host='127.0.0.1', proxy_port=1080):
        self.proxy_host = proxy_host
        self.proxy_port = proxy_port

    def configure_socks(self):
        pass

    def reset_socket(self):
        pass

    def scan_port(self, host, port, timeout=3):
        pass

    def scan_ports(self, host, ports):
        pass
pip3 install pysocks
🧩 TASK 3 — Remote Port Forwarding
🔵 Step 1: Local Service
python3 << 'EOF' &
import socket
server = socket.socket()
server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
server.bind(('127.0.0.1', 7777))
server.listen(5)

print("Service running on 7777")

while True:
    conn, addr = server.accept()
    conn.send(b'Hello Pivot Service\n')
    conn.close()
EOF
🌍 Step 2: Remote Forwarding
ssh -f -N -R 8888:localhost:7777 pivot_user@localhost

nc localhost 8888
ps aux | grep ssh
🐍 Remote Forward Manager
class RemoteForwardManager:
    def __init__(self):
        self.tunnels = {}

    def create_remote_forward(self, remote_port, local_host, local_port,
                              ssh_user, ssh_host):
        pass

    def test_remote_port(self, host, port):
        pass

    def cleanup(self):
        pass
🧩 TASK 4 — Automated Tunnel Management
📄 Tunnel Config
{
  "tunnels": [
    {
      "name": "web_tunnel",
      "type": "local",
      "local_port": 8090,
      "remote_host": "localhost",
      "remote_port": 8080,
      "ssh_user": "pivot_user",
      "ssh_host": "localhost"
    },
    {
      "name": "socks_proxy",
      "type": "dynamic",
      "local_port": 1081,
      "ssh_user": "pivot_user",
      "ssh_host": "localhost"
    }
  ]
}
🤖 Tunnel Manager (Automation Engine)
import subprocess
import json
import socket
import time

class TunnelManager:
    def __init__(self, config_file='tunnel_config.json'):
        self.config_file = config_file
        self.tunnels = {}
        self.processes = {}

    def load_config(self):
        pass

    def create_local_tunnel(self, config):
        pass

    def create_dynamic_tunnel(self, config):
        pass

    def test_port(self, host, port, timeout=3):
        pass

    def start_all_tunnels(self):
        pass

    def stop_tunnel(self, tunnel_name):
        pass

    def cleanup_all(self):
        pass

    def list_tunnels(self):
        pass
🚀 Execution
chmod +x tunnel_manager.py
python3 tunnel_manager.py

netstat -tlnp | grep -E "8090|1081"
curl -I http://localhost:8090
nc -zv localhost 1081
🎯 Expected Outcomes

✔ Local port forwarding working
✔ SOCKS5 proxy operational
✔ Remote service exposure via SSH
✔ Python automation framework built
✔ Multi-tunnel pivoting capability

🧯 Troubleshooting
❌ SSH Tunnel Fails
sudo systemctl status ssh
chmod 600 ~/.ssh/id_rsa
sudo tail -f /var/log/auth.log
❌ Port Busy
sudo lsof -i :PORT
pkill -f ssh
❌ SOCKS Not Working
netstat -tlnp | grep 1080
pip3 install pysocks
🧠 Conclusion

This lab demonstrates advanced SSH pivoting techniques used in penetration testing:

🔁 Local Forwarding → internal service access
🌍 Remote Forwarding → external exposure
🧦 Dynamic SOCKS Proxy → traffic tunneling
🤖 Automation → scalable red-team workflows

⚠️ Always use these techniques only in authorized environments.
