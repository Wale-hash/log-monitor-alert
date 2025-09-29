# Log Monitoring & Alert Script (PowerShell)

## 🔎 Overview
A lightweight PowerShell script that scans Windows Security logs for suspicious failed logon attempts (Event ID 4625).  
Helps with early detection of brute-force or unauthorized login attempts.

---

## ⚠️ Problem
- Brute-force / credential stuffing attacks can overwhelm systems.  
- Admins often miss repeated failed logins until incidents escalate.  

---

## ⚙️ Solution
This script:  
- Scans the most recent 100 failed logon attempts.  
- Saves a report to your Desktop.  
- Gives a quick triage view for suspicious activity.  

---

## 🛠 How to Use
1. Download `monitor_failed_logons.ps1`.  
2. Run PowerShell as **Administrator**.  
3. Run the script:  
   ```powershell
   .\monitor_failed_logons.ps1
