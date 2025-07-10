<#
.SYNOPSIS
    Script to detect inactive Active Directory user accounts.

.DESCRIPTION
    This PowerShell script identifies Active Directory accounts that have not logged on for a certain number of days (default: 30).
    It exports the results to a CSV file for auditing or manual/automated processing.

.PARAMETER DaysInactive
    Number of inactive days (default: 30)

.PARAMETER ExportPath
    Full path for the output CSV file

.EXAMPLE
    .\Detect-InactiveADUsers.ps1 -DaysInactive 15 -ExportPath "C:\Your\Output\Path\Example.csv"
#>

param (
    [int]$DaysInactive = 30,
    [string]$ExportPath = ".\InactiveUsers.csv"
)

# Checking the ActiveDirectory module
if (-not (Get-Module -ListAvailable -Name ActiveDirectory)) {
    Write-Error "'ActiveDirectory' module not found. Please install it or run this script on a domain controller."
    exit 1
}

Import-Module ActiveDirectory

# Referencing date
$thresholdDate = (Get-Date).AddDays(-$DaysInactive)

# Find inactive users
try {
    $inactiveUsers = Get-ADUser -Filter {Enabled -eq $true -and LastLogonDate -lt $thresholdDate} -Properties LastLogonDate, DisplayName, Enabled | Select-Object Name, SamAccountName, LastLogonDate, Enable
    if ($inactiveUsers.Count -eq 0) {
        Write-Host "No inactive users since more than $DaysInactive days detected."
    } else {
        $inactiveUsers | Export-Csv -Path $ExportPath -NoTypeInformation -Encoding UTF8
        Write-Host "Export ended: $ExportPath"
    }
}

catch {
    Write-Error "Error occur during the script execution: $_"
}
