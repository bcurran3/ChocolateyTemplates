$ErrorActionPreference = 'Stop'
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName    = ''
$url            = ''
$checksum       = ''

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir  
  fileType      = 'EXE'
  url           = $url
  validExitCodes= @(0,1)
  silentArgs    = '/S'
  softwareName  = ''
  checksum      = $checksum
  checksumType  = 'sha256' 
}

Install-ChocolateyPackage @packageArgs
