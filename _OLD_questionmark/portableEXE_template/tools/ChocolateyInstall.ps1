﻿$ErrorActionPreference = 'Stop'
$packageName  = '' 
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url          = ''
$checksum     = ''
$checksumType = 'sha256'
$FileFullPath = "$toolsDir\.exe"
$shortcutName = '.lnk'
$portableEXE  = '.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  url           = $url
  FileFullPath  = $FileFullPath
  softwareName  = ''
  checksum      = $checksum
  checksumType  = $checksumType
}
 
Get-ChocolateyWebFile @packageArgs

Install-ChocolateyShortcut -shortcutFilePath "$env:Public\Desktop\$shortcutName" -targetPath "$toolsDir\$portableEXE" -WorkingDirectory "$toolsDir\"
Install-ChocolateyShortcut -shortcutFilePath "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\$shortcutName" -targetPath "$toolsDir\$portableEXE" -WorkingDirectory "$toolsDir\"