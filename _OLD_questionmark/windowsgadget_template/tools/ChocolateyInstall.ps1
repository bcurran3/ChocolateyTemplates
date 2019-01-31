# http://win7gadgets.com/media/g/g1345/virus-blue-wifi.gadget

$ErrorActionPreference = 'Stop'
$packageName      = '-gadget' 
$toolsDir         = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url              = ''
$checksum         = ''
$checksumType     = 'sha256'
$installerPackage = Join-Path $ToolsDir ".gadget"

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  url           = $url
  FileFullPath  = $installerPackage
  checksum      = $checksum
  checksumType  = $checksumType
}

Get-ChocolateyWebFile @packageArgs



