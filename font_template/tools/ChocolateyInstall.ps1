$ErrorActionPreference = 'Stop'
$packageName = ''
$url         = ''
$checksum    = ''
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$destination = "$toolsDir\extracted"
$fontDir     = "$destination\otfs"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'ZIP'
  url           = $url
  checksum      = $checksum 
  checksumType  = 'sha256'  
  }
  
Install-ChocolateyZIPPackage @packageArgs
 
Install-ChocolateyFont "$fontDir\FONTNAMEEXT"
Install-ChocolateyFont "$fontDir\FONTNAMEEXT"
Install-ChocolateyFont "$fontDir\FONTNAMEEXT"
 
Remove-Item $destination -Recurse
