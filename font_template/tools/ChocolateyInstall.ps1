$packageName  = '-font'
$url          = ''
$checksum     = ''
$checksumType = 'sha256' 
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$UnzipDir     = "$toolsDir\fontawesome-free-5.1.1-desktop"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'ZIP'
  url           = $url
  checksum      = $checksum 
  checksumType  = $checksumType
  }
  
Install-ChocolateyZIPPackage @packageArgs
 
$shell = New-Object -ComObject Shell.Application
$fontsFolder = $shell.Namespace(0x14)
 
Get-ChildItem $UnzipDir -Recurse -Filter *.otf | ForEach-Object {$fontsFolder.CopyHere($_.FullName)}
Get-ChildItem $UnzipDir -Recurse -Filter *.ttf | ForEach-Object {$fontsFolder.CopyHere($_.FullName)}
Remove-Item $UnzipDir -Recurse

