# 🔓 Crack Password Hashes Using Hashcat & John

![Linux](https://img.shields.io/badge/Linux-Kali-E95420?style=for-the-badge\&logo=linux)
![Hashcat](https://img.shields.io/badge/Hashcat-Password%20Cracking-red?style=for-the-badge)
![John The Ripper](https://img.shields.io/badge/John%20The%20Ripper-Cracking-blue?style=for-the-badge)
![Python](https://img.shields.io/badge/Python-Automation-3776AB?style=for-the-badge\&logo=python)
![Cyber Security](https://img.shields.io/badge/Cyber%20Security-Password%20Auditing-success?style=for-the-badge)
![Al Nafi](https://img.shields.io/badge/Al%20Nafi-Lab-orange?style=for-the-badge)

---

# 📖 Overview

This lab introduces practical password auditing and hash analysis techniques using two industry-standard tools:

* 🔥 Hashcat
* ⚡ John the Ripper

Students will learn how to identify common hash formats, perform dictionary and brute-force attacks, automate workflows using Python, and compare password recovery methodologies.

---

# 🎯 Objectives

By the end of this lab, students will be able to:

* 🔍 Identify and analyze password hash formats
* 🔐 Use Hashcat for password recovery operations
* ⚡ Use John the Ripper for password auditing
* 🤖 Create Python automation scripts
* 📊 Compare effectiveness of different password recovery methods

---

# 📋 Prerequisites

Before starting this lab, students should have:

* ✅ Basic Linux command line proficiency
* ✅ Understanding of cryptographic hash functions
* ✅ Fundamental Python programming skills

---

# 🖥️ Lab Environment

Al Nafi provides ready-to-use Linux cloud machines with:

* Kali Linux
* Hashcat
* John the Ripper
* Python3
* Preconfigured Lab Environment

---

# 🔥 Task 1: Crack Hashes with Hashcat

## 🔹 Step 1.1: Setup Working Environment

```bash
mkdir -p ~/hash_lab/{hashes,wordlists,results}
cd ~/hash_lab

hashcat --version
```

---

## 🔹 Step 1.2: Generate Test Hashes

```bash
echo -n "password123" | md5sum | cut -d' ' -f1 > hashes/md5.txt
echo -n "admin" | md5sum | cut -d' ' -f1 >> hashes/md5.txt
echo -n "qwerty" | md5sum | cut -d' ' -f1 >> hashes/md5.txt

echo -n "password123" | sha256sum | cut -d' ' -f1 > hashes/sha256.txt
echo -n "welcome" | sha256sum | cut -d' ' -f1 >> hashes/sha256.txt

cat > wordlists/common.txt << EOF
password
password123
admin
qwerty
welcome
123456
letmein
EOF
```

---

## 🔹 Step 1.3: Dictionary Attack

```bash
hashcat -m 0 -a 0 hashes/md5.txt wordlists/common.txt

hashcat -m 0 hashes/md5.txt --show

hashcat -m 0 hashes/md5.txt --show > results/md5_cracked.txt
```

### 📚 Hashcat Mode Reference

| Mode | Algorithm |
| ---- | --------- |
| 0    | MD5       |
| 100  | SHA1      |
| 1400 | SHA256    |

### 📚 Attack Modes

| Attack Mode | Description       |
| ----------- | ----------------- |
| -a 0        | Dictionary Attack |
| -a 3        | Brute Force       |

---

## 🔹 Step 1.4: Brute Force Attack

```bash
echo -n "1234" | md5sum | cut -d' ' -f1 > hashes/numeric.txt

hashcat -m 0 -a 3 hashes/numeric.txt ?d?d?d?d

hashcat -m 0 -a 3 hashes/md5.txt ?l?l?l?d?d?d
```

### 📚 Mask Characters

| Mask | Meaning            |
| ---- | ------------------ |
| ?l   | Lowercase          |
| ?u   | Uppercase          |
| ?d   | Digits             |
| ?s   | Special Characters |

---

## 🔹 Step 1.5: Rule-Based Attack

```bash
hashcat -m 0 -a 0 hashes/md5.txt wordlists/common.txt \
-r /usr/share/hashcat/rules/best64.rule

hashcat -m 0 hashes/md5.txt --show
```

---

# ⚡ Task 2: Use John the Ripper

## 🔹 Step 2.1: Prepare Hash Files

```bash
cp hashes/md5.txt hashes/john_md5.txt

john --version

john --list=formats | grep -i raw
```

---

## 🔹 Step 2.2: Dictionary Attack

```bash
john --format=Raw-MD5 \
--wordlist=wordlists/common.txt \
hashes/john_md5.txt

john --show --format=Raw-MD5 hashes/john_md5.txt

john --show --format=Raw-MD5 hashes/john_md5.txt \
> results/john_results.txt
```

---

## 🔹 Step 2.3: Rule-Based Cracking

```bash
john --format=Raw-MD5 \
--wordlist=wordlists/common.txt \
--rules=Wordlist \
hashes/john_md5.txt

john --format=Raw-MD5 \
--wordlist=wordlists/common.txt \
--rules \
hashes/john_md5.txt

john --show --format=Raw-MD5 hashes/john_md5.txt
```

---

## 🔹 Step 2.4: Incremental Mode

```bash
echo -n "abc" | md5sum | cut -d' ' -f1 > hashes/simple.txt

timeout 60 john \
--format=Raw-MD5 \
--incremental=Lower \
hashes/simple.txt

john --show --format=Raw-MD5 hashes/simple.txt
```

---

# 🤖 Task 3: Automate with Python

## 🔹 Step 3.1: Create Hash Cracker Script

```bash
nano hash_cracker.py
```

### Features

* Generate hashes
* Create hash files
* Run Hashcat
* Run John the Ripper
* Compare performance
* Generate reports

### Core Class

```python
class HashCracker:
    pass
```

### Required Methods

```python
generate_hash()
create_hash_file()
run_hashcat()
run_john()
compare_tools()
```

---

## 🔹 Step 3.2: Create Hash Analysis Script

```bash
nano hash_analyzer.py
```

### Core Class

```python
class HashAnalyzer:
    pass
```

### Required Methods

```python
identify_hash_type()
analyze_hash_file()
estimate_crack_time()
generate_report()
```

### Supported Hash Patterns

```python
{
    'md5': r'^[a-f0-9]{32}$',
    'sha1': r'^[a-f0-9]{40}$',
    'sha256': r'^[a-f0-9]{64}$'
}
```

---

## 🔹 Step 3.3: Test Automation Scripts

```bash
python3 hash_cracker.py

python3 hash_analyzer.py

ls -lh results/

cat results/*.txt
```

---

# 📊 Expected Outcomes

After completing this lab, you should have:

* ✅ Successfully audited multiple hash types
* ✅ Used Hashcat attack modes
* ✅ Used John the Ripper attack modes
* ✅ Built Python automation workflows
* ✅ Generated comparison reports
* ✅ Improved understanding of password security

---

# ⚔️ Tool Comparison

| Feature        | Hashcat     | John the Ripper |
| -------------- | ----------- | --------------- |
| Speed          | Very Fast   | Fast            |
| GPU Support    | Yes         | Limited         |
| Rule Engine    | Excellent   | Excellent       |
| Large Datasets | Best Choice | Good            |
| CPU Cracking   | Good        | Excellent       |

### Summary

* 🚀 Hashcat is ideal for high-performance password recovery.
* ⚡ John excels in flexibility and advanced rule processing.
* 🎯 Both tools complement each other during security assessments.

---

# 🛠️ Troubleshooting

## Issue 1: Hashcat Shows "No Devices Found"

```bash
hashcat --force -m 0 hashes/md5.txt wordlists/common.txt
```

---

## Issue 2: John Doesn't Show Results

```bash
john --list=formats

ls ~/.john/
```

Verify:

* Correct format selected
* Session files exist
* Hash file format is valid

---

## Issue 3: Python Script Timeout

Solutions:

```python
try:
    pass
except subprocess.TimeoutExpired:
    pass
```

Also:

* Increase timeout values
* Use smaller datasets

---

## Issue 4: Permission Denied

```bash
chmod +x hash_cracker.py

chmod +x hash_analyzer.py
```

---

# 🔐 Security Concepts Learned

## Password Auditing

* Dictionary Attacks
* Brute Force Attacks
* Rule-Based Mutations
* Password Strength Analysis

## Hash Algorithms

* MD5
* SHA1
* SHA256

## Security Assessment Automation

* Python Automation
* Workflow Orchestration
* Reporting
* Performance Benchmarking

---

# 📚 Key Takeaways

* Weak passwords are vulnerable to dictionary attacks.
* Brute-force attacks become expensive as password complexity increases.
* Modern password storage should include salting and key stretching.
* Automation significantly improves efficiency during password auditing engagements.

---

# 🚀 Next Steps

Explore:

* Advanced Hashcat Rules
* Custom Masks
* Password Mangling Techniques
* bcrypt
* scrypt
* Argon2
* Rainbow Tables
* CTF Password Challenges

---

# ⚠️ Ethical Reminder

This lab is intended solely for:

* Authorized security assessments
* Educational environments
* Password recovery operations
* Security research

Unauthorized password cracking against systems you do not own or have permission to test is illegal and unethical.

---

# 🏆 Skills Acquired

* Password Hash Identification
* Hashcat Usage
* John the Ripper Usage
* Dictionary Attacks
* Brute Force Attacks
* Rule-Based Password Auditing
* Python Automation
* Security Assessment Methodology
* Password Security Analysis

---

⭐ If this repository helped you learn password auditing techniques, consider giving it a star and contributing improvements.
