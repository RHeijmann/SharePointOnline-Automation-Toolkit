Write-Host "_________________________________"
Write-Host "_________________________________"
Write-Host "    SharePoint Connector v1.0"
Write-Host ""
Write-Host "     Voor het verbinden met"
Write-Host "SharePoint Online via de SPO-tools"
Write-Host "_________________________________"
Write-Host "_________________________________"

$tenant_name= Read-Host -Prompt "Voer de naam van de tenant in (Voor 'jdoe@contosotoycompany.onmicrosoft.com' is dit 'contosotoycompany')"
$admin_upn= Read-Host -Prompt "Voer het e-mailadres van het administrator account in (Bijvoorbeeld: jdoe@contosotoycompany.onmicrosoft.com)"
$admin_credentials = Get-Credential -UserName $admin_upn -Message "Voer het wachtwoord van het administrator account in:"
Connect-SPOService -Url https://$tenant_name-admin.sharepoint.com -Credential $admin_credentials