Write-Host "_________________________________"
Write-Host "_________________________________"
Write-Host "    SharePoint Connector v1.0"
Write-Host ""
Write-Host "     Voor het verbinden met"
Write-Host "SharePoint Online via de PnP-tools"
Write-Host "_________________________________"
Write-Host "_________________________________"

$url = Read-Host -Prompt "Voer de url van de site in"
$admin_upn = Read-Host -Prompt "Voer het e-mailadres van het Office365 administrator account in (Bijvoorbeeld: jdoe@contosotoycompany.onmicrosoft.com)"
$admin_credentials = Get-Credential -UserName $admin_upn -Message "Voer het wachtwoord van het Office365 administrator account in:"
Connect-PnPOnline –Url $url –Credentials ($admin_credentials)