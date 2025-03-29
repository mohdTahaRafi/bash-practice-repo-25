# This script extracts the SSID of the currently connected WiFi network using PowerShell.

try {
    $wifiDetails = netsh wlan show interfaces 2>&1 | Out-String

    $SSID = ($wifiDetails -split "`n" | Where-Object { $_ -match '^\s*SSID\s*:\s*' }) -replace '^\s*SSID\s*:\s*', ''

    Write-Output "Extracted SSID: $SSID"

    if ([string]::IsNullOrWhiteSpace($SSID)) {
        Write-Output "No WiFi SSID found. Are you connected to a network?"
    } else {
        Write-Output "Connected to WiFi SSID: $SSID"
    }
} catch {
    Write-Output "An error occurred while running the script: $_"
}