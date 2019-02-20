$ErrorActionPreference = 'Stop'
$packageName = '-firefox'
$url         = ''
$checksum    = ''
$extensionID = ""

if(Test-Path 'HKLM:\SOFTWARE\Mozilla\Firefox\TaskBarIDs'){
	$installDir = Get-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Mozilla\Firefox\TaskBarIDs | Select-Object -ExpandProperty Property
}
if(Test-Path 'HKLM:\SOFTWARE\Wow6432Node\Mozilla\Firefox\TaskBarIDs'){
	$installDir = Get-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Mozilla\Firefox\TaskBarIDs | Select-Object -ExpandProperty Property
}

$browserFolder = Join-Path $installDir "browser"
$extensionsFolder = Join-Path $browserFolder "extensions"
$extFolder = Join-Path $extensionsFolder "$extensionID"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $extFolder
  fileType      = 'ZIP' 
  url           = $url
  checksum      = $checksum
  checksumType  = 'sha256' 
}

if (!(Test-Path $extFolder)) {
	New-Item -Force -ItemType directory -Path $extFolder 
	Install-ChocolateyZipPackage @packageArgs
}
else {
	Write-Host "  ** $packageName already exists" -Foreground Magenta
}
