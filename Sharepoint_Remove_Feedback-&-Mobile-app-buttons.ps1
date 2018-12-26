Write-Host "_________________________________"
Write-Host "_________________________________"
Write-Host "       SharePoint Online,"
Write-Host "      Verwijderaar voor de"
Write-Host " Feedback en Mobiele App knoppen"
Write-Host ""
Write-Host "     Voor het verbinden met"
Write-Host "SharePoint Online via de SPO-tools"
Write-Host "_________________________________"
Write-Host "_________________________________"
# Aantal tenant_name's:
# - Rubicon-Jeugdzorg: RubiconOnline

$url = Read-Host -Prompt "Voer de url van de site in"
$tenant_name= Read-Host -Prompt "Voer de naam van de tenant in (Voor 'jdoe@contosotoycompany.onmicrosoft.com' is dit 'contosotoycompany')"
$admin_upn= Read-Host -Prompt "Voer het e-mailadres van het administrator account in (Bijvoorbeeld: jdoe@contosotoycompany.onmicrosoft.com)"
$admin_credentials = Get-Credential -UserName $admin_upn -Message "Voer het wachtwoord van het administrator account in:"
Connect-SPOService -Url https://$tenant_name-admin.sharepoint.com -Credential $admin_credentials

#Knop met "Feedback" uitzetten en knop met "Mobiele app downloaden" uitzetten. Duurt 1 uur voordat dit in werking treed.
Set-SPOTenant -UserVoiceForFeedbackEnabled:$false