# Detect_InactiveADUsers_PowerShell

## 🛡️ PowerShell Script to Detect Inactive User Accounts in Active Directory

This PowerShell script identifies **enabled but inactive user accounts** in Active Directory that have not logged in for a specified number of days (default: 30). It generates a **CSV report** for auditing, cleanup, or further security operations.

---

## 🎯 Project Objective

This project was developed as part of my **self-training in PowerShell scripting for cybersecurity**.  
Its main goals were to:

- Use the `ActiveDirectory` module for user enumeration
- Filter users based on inactivity (last logon date)
- Export results in a reusable CSV format
- Handle errors securely using `try/catch`
- Follow secure and modular scripting best practices

---

## 🧠 Key Concepts Learned

- Querying Active Directory with the `ActiveDirectory` module
- Dynamically calculating time thresholds using `Get-Date` and `AddDays`
- Using `param()` blocks for script reusability
- Exporting data to UTF-8 encoded CSV files
- Handling prerequisites and runtime exceptions with `try/catch`
- Checking execution context (domain administrator privilege)

---

## ⚙️ Requirements

- Windows Server with AD DS role installed, or any system with **RSAT: Active Directory Tools**
- PowerShell 5.1 or newer
- Script must be run as **domain administrator**
- `ActiveDirectory` module installed and available

---

## 🚀 Usage

### 🔁 Syntax

```powershell
.\Detect-InactiveADUsers.ps1 [-DaysInactive <int>] [-ExportPath <string>]
```

### 📝 Parameters

| Parameter      | Description                                           | Default               |
| -------------- | ----------------------------------------------------- | --------------------- |
| `DaysInactive` | Number of days since the user's last successful logon | `30`                  |
| `ExportPath`   | Path to the CSV file to be generated                  | `.\InactiveUsers.csv` |


### 📌 Examples

```
# Find users inactive for 90 days
.\Detect-InactiveADUsers.ps1 -DaysInactive 90

# Find users inactive for 60 days and export to a custom path
.\Detect-InactiveADUsers.ps1 -DaysInactive 60 -ExportPath "C:\Audit\InactiveUsers.csv"
```

### 📂 Sample CSV Output

| Name      | SamAccountName | LastLogonDate       | Enabled |
| --------- | -------------- | ------------------- | ------- |
| Jane Doe  | jdoe           | 2024-12-01 08:14:22 | True    |
| John Test | jtest          | 2024-10-20 11:45:09 | True    |

---

## ❗ Built-in Security and Best Practices

- ✅ Checks for required modules (`ActiveDirectory`)

- ✅ No hardcoded passwords or credentials

- ✅ Robust error handling

- ✅ Read-only access to AD data (no modification)

- ✅ Exported reports support auditing and traceability

---

## 📄 License

MIT License

This project is open-source and free to use or modify for learning purposes or internal IT operations.
