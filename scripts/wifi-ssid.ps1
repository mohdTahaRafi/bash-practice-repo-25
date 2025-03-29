# This script extracts the SSID of the currently connected WiFi network using PowerShell.

try {
    # Run netsh to get WiFi details
    $wifiDetails = netsh wlan show interfaces 2>&1 | Out-String

    # Extract the SSID from the output
    $SSID = ($wifiDetails -split "`n" | Where-Object { $_ -match '^\s*SSID\s*:\s*' }) -replace '^\s*SSID\s*:\s*', ''

    # Debugging: Print extracted SSID
    Write-Output "Extracted SSID: $SSID"

    # Check if SSID is found
    if ([string]::IsNullOrWhiteSpace($SSID)) {
        Write-Output "No WiFi SSID found. Are you connected to a network?"
    } else {
        Write-Output "Connected to WiFi SSID: $SSID"
    }
} catch {
    # Handle any errors that occur during execution
    Write-Output "An error occurred while running the script: $_"
}