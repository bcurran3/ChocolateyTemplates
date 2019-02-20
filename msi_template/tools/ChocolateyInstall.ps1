$ErrorActionPreference = 'Stop'
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName    = ''
$url            = '' 
$checksum       = ''

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'MSI'
  url           = $url
  validExitCodes= @(0, 3010, 1641)
  silentArgs    = '/quiet /norestart'
  softwareName  = ''
  checksum      = $checksum
  checksumType  = 'sha256' 
}

Install-ChocolateyPackage @packageArgs  
