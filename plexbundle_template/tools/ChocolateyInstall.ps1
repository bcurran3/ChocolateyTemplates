$packageName  = '-plex' 
$BundleName   = '.bundle'
$url          = ''
$checksum     = ''
$PlexDataPath = Get-ItemProperty -path "registry::hkey_current_user\software\Plex, Inc.\Plex Media Server" | select-object -expandproperty LocalAppDataPath

if ($PlexDataPath -eq $null) {
    Write-Host "Plex Media Server has not been configured yet!" -ForegroundColor red
    Write-Host "Creating default directories..." -ForegroundColor magenta
    New-Item "$env:LOCALAPPDATA\Plex" -Type Directory -force
    New-Item "$env:LOCALAPPDATA\Plex\Plex Media Server" -Type Directory -force
    New-Item "$env:LOCALAPPDATA\Plex\Plex Media Server\Plug-ins" -Type Directory -force
    $PlexDataPath = "$env:LOCALAPPDATA\Plex"
   }

$UnZipDir = "$PlexDataPath\Plex Media Server\Plug-ins"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $UnZipDir
  fileType      = 'ZIP' 
  url           = $url
  checksum      = $checksum
  checksumType  = 'sha256'  
}

Install-ChocolateyZipPackage @packageArgs

$CheckBundle="$PlexDataPath\Plex Media Server\Plug-ins\$BundleName.old"
If (Test-Path $CheckBundle){
    Write-Host "Removing $BundleName.old." -ForegroundColor magenta
    Remove-Item "$UnZipDir\$BundleName.old" -recurse
  }

$CheckBundle="$PlexDataPath\Plex Media Server\Plug-ins\$BundleName"
If (Test-Path $CheckBundle){
    Write-Host "Renaming previous version to $BundleName.old." -ForegroundColor magenta
    Rename-Item "$UnZipDir\$BundleName" "$BundleName.old"
  }

Rename-Item "$UnZipDir\$BundleName-$env:packageVersion" $BundleName
Write-Host "You can ignore ""Only an exit code of non-zero will fail..."" messages." -ForegroundColor magenta
# NOTE: $env:packageVersion and bundle version could be different on reissues of same version.