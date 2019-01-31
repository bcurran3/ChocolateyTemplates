$packageName  = '-plex' 
$BundleName   = '.bundle'
$PlexDataPath = Get-ItemProperty -path "registry::hkey_current_user\software\Plex, Inc.\Plex Media Server" | select-object -expandproperty LocalAppDataPath

if ($PlexDataPath -eq $null) {
    Write-Host "Plex Media Server has not been configured yet!" -ForegroundColor red
    $PlexDataPath = "$env:LOCALAPPDATA\Plex"
   }
  
$UnZipDir = "$PlexDataPath\Plex Media Server\Plug-ins"

$CheckBundle = "$PlexDataPath\Plex Media Server\Plug-ins\$BundleName.old"
If (Test-Path $CheckBundle){
     Write-Host "Removing previous .old version." -ForegroundColor magenta
     Remove-Item "$UnZipDir\$BundleName.old" -recurse
   } 

$CheckBundle = "$PlexDataPath\Plex Media Server\Plug-ins\$BundleName"
If (Test-Path $CheckBundle){
     Write-Host "Removing $packageName" -ForegroundColor magenta
     Remove-Item "$UnZipDir\$BundleName" -recurse
   } else {
     Write-Host "ERROR: No previous version exists." -ForegroundColor red
   }
Write-Host "You can ignore ""Only an exit code of non-zero will fail..."" messages." -ForegroundColor magenta

