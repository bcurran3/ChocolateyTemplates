﻿$ErrorActionPreference = 'Stop'
$bits = Get-ProcessorBits
$packageName = '-chrome'
$extensionID = ''

if ($bits -eq 64) {
    Remove-Item "HKLM:\SOFTWARE\Wow6432node\Google\Chrome\Extensions\$extensionID" -Force -ErrorAction SilentlyContinue | Out-Null
   }else{
    Remove-Item "HKLM:\SOFTWARE\Google\Chrome\Extensions\$extensionID" -Force -ErrorAction SilentlyContinue | Out-Null
}
