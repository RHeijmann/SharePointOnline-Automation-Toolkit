$tenant_name = Read-Host -Prompt "Voer de naam van de tenant in (Voor 'jdoe@contosotoycompany.onmicrosoft.com' is dit 'contosotoycompany')"
$admin_upn= Read-Host -Prompt "Voer het e-mailadres van het administrator account in (Bijvoorbeeld: jdoe@contosotoycompany.onmicrosoft.com)"
$admin_credentials = Get-Credential -UserName $admin_upn -Message "Voer het wachtwoord van het administrator account in"
Connect-PnPOnline –Url https://$tenant_name.sharepoint.com –Credentials ($admin_credentials)

$site_name = Read-Host -Prompt "Voer de naam voor de site in (Let Op! In de URL worden alle speciale tekens weggehaald.)"
$site_filteredname = $site_name -replace '[\W]', ''
$site_url = "https://$tenant_name.sharepoint.com/sites/$site_filteredname"

# https://docs.microsoft.com/en-us/sharepoint/dev/solution-guidance/modern-experience-customizations-provisioning-sites
New-PnPSite -Type CommunicationSite -Title "$site_name" -Url $site_url -SiteDesign Blank
Connect-PnPOnline –Url $site_url –Credentials ($admin_credentials)

$site_administrator = Read-Host -Prompt "Voer het e-mailadres in van de site administrator, laat leeg om over te slaan"
$site_group_editors = Read-Host -Prompt "Voer het e-mailadres in van de groep die mag bewerken, laat leeg om over te slaan"
$site_group_viewers = Read-Host -Prompt "Voer het e-mailadres in van de groep die de site mag zien, laat leeg om over te slaan"

#De waardes van de machtigingniveau's zijn gebasseerd op basis van de taal van SharePoint.
#Kies uit de niveau's: Volledig beheer, Ontwerpen, Bewerken, Bijdragen, Lezen, Beperkte toegang, Goedkeuren, Hiërarchie beheren, Beperkt lezen, Alleen weergeven (https://support.office.com/nl-nl/article/machtigingsniveaus-in-sharepoint-87ecbb0e-6550-491a-8826-c075e4859848?ui=nl-NL&rs=nl-NL&ad=NL)
if ($site_administrator) { Set-PnPWebPermission -User "$site_administrator" -AddRole 'Volledig beheer' }
if ($site_group_editors) { Set-PnPWebPermission -Group "$site_group_editors" -AddRole 'Bewerken' }
if ($site_group_viewers) { Set-PnPWebPermission -Group "$site_group_viewers" -AddRole 'Lezen' }
