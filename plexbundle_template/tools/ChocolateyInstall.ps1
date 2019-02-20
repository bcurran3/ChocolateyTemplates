$ErrorActionPreference = 'Stop'
$packageName      = '-plex'
$BundleName       = '.bundle'
$url              = ''
$checksum         = ''
$LocalAppDataPath = Get-ItemProperty -Path "registry::hkey_current_user\software\Plex, Inc.\Plex Media Server" | Select-Object -ExpandProperty LocalAppDataPath

if ($LocalAppDataPath -eq $null) {
    Write-Host "  ** Plex Media Server has not been configured yet!" -Foreground Magenta
    Write-Host "  ** Creating default directories..." -Foreground Magenta
    New-Item "$ENV:LOCALAPPDATA\Plex" -Type Directory -Force
    New-Item "$ENV:LOCALAPPDATA\Plex\Plex Media Server" -Type Directory -Force
    New-Item "$ENV:LOCALAPPDATA\Plex\Plex Media Server\Plug-ins" -Type Directory -Force
    $LocalAppDataPath = "$ENV:LOCALAPPDATA\Plex"
   }

$UnZipDir = Join-Path -Path $LocalAppDataPath -ChildPath "Plex Media Server\Plug-ins"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $UnZipDir
  fileType      = 'ZIP' 
  url           = $url
  checksum      = $checksum
  checksumType  = 'sha256'  
}

Install-ChocolateyZipPackage @packageArgs

$strFileName="$LocalAppDataPath\Plex Media Server\Plug-ins\$BundleName.old"

If (Test-Path $strFileName){
    Write-Host "  ** Removing previous .old version." -Foreground Magenta
    Remove-Item "$UnZipDir\$BundleName.old" -Recurse
   }else{
    Write-Host "  ** .old version does not exist." -Foreground Magenta
}

$strFileName="$LocalAppDataPath\Plex Media Server\Plug-ins\$BundleName"

If (Test-Path $strFileName){
    Write-Host "  ** Renaming previous version .old." -Foreground Magenta
    Rename-Item "$UnZipDir\$BundleName" "$BundleName.old"
   }else{
    Write-Host "  ** No previous version exists." -Foreground Magenta
   }

# NOTE: $env:packageVersion and bundle version could be different on reissues of same version.
Rename-Item "$UnZipDir\$BundleName-$env:packageVersion" $BundleName
Write-Host "  ** You can ignore the ""Only an exit code of non-zero will fail..."" messages." -Foreground Magenta
