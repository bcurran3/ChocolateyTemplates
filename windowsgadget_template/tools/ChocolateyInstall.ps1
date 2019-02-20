#http://win7gadgets.com/media/g/g1345/virus-blue-wifi.gadget
$ErrorActionPreference = 'Stop'
$toolsDir         = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$packageName      = '-gadget' 
$url              = ''
$checksum         = ''
$installerPackage = "$toolsDir\.gadget"

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  url           = $url
  FileFullPath  = $installerPackage
  checksum      = $checksum
  checksumType  = 'sha256'
}

Get-ChocolateyWebFile @packageArgs
