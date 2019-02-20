$ErrorActionPreference = 'Stop'
$bits = Get-ProcessorBits
$packageName = '-chrome'
$extensionID = ''

if ($bits -eq 64)
   {
    if (Test-Path -Path "HKLM:\SOFTWARE\Wow6432node\Google\Chrome\Extensions\$extensionID")
       {
       Write-Host "  ** Extension already installed." -Foreground Magenta
       } else {
         New-Item -Force -Path "HKLM:\SOFTWARE\Wow6432node\Google\Chrome\Extensions\$extensionID" | Out-Null
         New-ItemProperty -Path "HKLM:\SOFTWARE\Wow6432node\Google\Chrome\Extensions\$extensionID\" -Name "update_url" -Value "https://clients2.google.com/service/update2/crx" | Out-Null
         New-ItemProperty -Path "HKLM:\SOFTWARE\Wow6432node\Google\Chrome\Extensions\$extensionID\" -Name "ChocolateyPackageName" -Value "$packageName" | Out-Null
         }
    } else {
      New-Item -Force -Path "HKLM:\SOFTWARE\Google\Chrome\Extensions\$extensionID" | Out-Null
      New-ItemProperty -Path "HKLM:\SOFTWARE\Google\Chrome\Extensions\$extensionID\" -Name "update_url" -Value "https://clients2.google.com/service/update2/crx" | out-null
      }
