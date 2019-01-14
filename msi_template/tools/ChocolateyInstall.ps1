$packageName    = ''
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url            = '' 
$checksum       = ''
$checksumType   = 'sha256'
$silentArgs     = '/quiet /norestart'
$softwareName   = ''
$validExitCodes = @(0, 3010, 1641)

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'MSI'
  url           = $url
  validExitCodes= $validExitCodes
  silentArgs    = $silentArgs
  softwareName  = $softwareName
  checksum      = $checksum
  checksumType  = $checksumType
}

Install-ChocolateyPackage @packageArgs  
  
