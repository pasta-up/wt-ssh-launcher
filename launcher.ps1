# List of computer FQDNs and the corresponding username you want to login with.
$computers = @{
    "fqdn.domain.com" = "username";
    "fqdn2.domain.com" = "root";
    "fqdn3.domain.com" = "anotheruser";
    "fqdn4.domain.com" = "active@directoryuser"
}

# Menu Function
function Show-Menu {
    cls
    $i = 65  # ASCII value for 'A'
    foreach ($key in $computers.Keys) {
        $letter = [char]$i
        Write-Host "$letter. $key ($($computers[$key]))"
        $i++
    }
}

# Actual Execution
while ($true) {
    Show-Menu
    $keyInfo = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    $selection = $keyInfo.Character

    $i = 65  # ASCII value for 'A'
    $selectedComputer = $null
    foreach ($key in $computers.Keys) {
        if ($selection -eq [char]$i -or $selection -eq [char]($i + 32)) {
            $selectedComputer = $key
            break
        }
        $i++
    }

    if ($selectedComputer) {
        cls
        $username = $computers[$selectedComputer]
        $command = "ssh $username@$selectedComputer"

        # I think you could also use invokecommand here, 
        # I want SSH when exiting to drop back to the menu but SSH has a "connection closed" dialog and this version was my 
        # attempt to see if I could bypass that from powershell (its a function of the ssh exe).
        Start-Process -FilePath "powershell" -ArgumentList "-Command $command" -NoNewWindow -Wait
        
        $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    }
}