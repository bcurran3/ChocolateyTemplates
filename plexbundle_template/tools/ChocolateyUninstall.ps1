$ErrorActionPreference = 'Stop'
$packageName      = '-plex' 
$BundleName       = '.bundle'
$LocalAppDataPath = Get-ItemProperty -path "registry::hkey_current_user\software\Plex, Inc.\Plex Media Server" | Select-Object -expandproperty LocalAppDataPath

if ($LocalAppDataPath -eq $null) {
    Write-Host "  ** Plex Media Server has not been configured yet!" -Foreground Magenta
    $LocalAppDataPath = "$env:LOCALAPPDATA\Plex"
   }
  
$UnZipDir = Join-Path -Path $LocalAppDataPath -ChildPath "Plex Media Server\Plug-ins"
$strFileName="$LocalAppDataPath\Plex Media Server\Plug-ins\$BundleName.old"

if (Test-Path $strFileName){
    Write-Host "  ** Removing previous .old version." -Foreground Magenta
    Remove-Item "$UnZipDir\$BundleName.old" -Recurse
   }else{
    Write-Host "  ** .old version does not exist." -Foreground Magenta
  }

$strFileName="$LocalAppDataPath\Plex Media Server\Plug-ins\$BundleName"

if (Test-Path $strFileName){
    Write-Host "  ** Removing $packageName" -Foreground Magenta
    Remove-Item "$UnZipDir\$BundleName" -Recurse
   }else{
    Write-Host "  ** ERROR: No previous version exists." -Foreground Red
  }
  Write-Host "  ** You can ignore the ""Only an exit code of non-zero will fail..."" messages." -Foreground Magenta
