$tenant_name = Read-Host -Prompt "Voer de naam van de tenant in (Voor 'jdoe@contosotoycompany.onmicrosoft.com' is dit 'contosotoycompany')"
$admin_upn= Read-Host -Prompt "Voer het e-mailadres van het administrator account in (Bijvoorbeeld: jdoe@contosotoycompany.onmicrosoft.com)"
$admin_credentials = Get-Credential -UserName $admin_upn -Message "Voer het wachtwoord van het administrator account in"
Connect-PnPOnline –Url https://$tenant_name.sharepoint.com –Credentials ($admin_credentials)

$site_name = Read-Host -Prompt "Voer de naam voor de site in (Let Op! In de URL worden alle speciale tekens weggehaald.)"
$site_filteredname = $site_name -replace '[\W]', ''
$site_url = "https://$tenant_name.sharepoint.com/sites/$site_filteredname"


$folders = Get-PnPFolderItem -ItemType "Folder"
$folders_current = 0
while($folders_current -ne $folders.Count)
     {
       Mkdir $folders.Get($folders_current).Name
       $folders_current++
       
     }
$folders_current = 0

$files = Get-PnPFolderItem -ItemType "File"
$files_current = 0
while($files_current -ne $files.Count)
     {
       Get-PnPFile _catalogs\wp\$files.Get($files_current).Name
       $files_current++
       
     }
$files_current = 0