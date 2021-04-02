<#PSScriptInfo
#####################################################
# Stop-SeleniumDrivers
#####################################################
.VERSION 0.1

.GUID e7172940-4e12-425e-9e65-c7ab1b2ffc1f

.AUTHOR David Walker, Sitecore Dave, Radical Dave

.COMPANYNAME David Walker, Sitecore Dave, Radical Dave

.COPYRIGHT David Walker, Sitecore Dave, Radical Dave

.TAGS powershell script selenium chromedriver

.LICENSEURI https://github.com/Radical-Dave/Stop-SeleniumDrivers/blob/main/LICENSE

.PROJECTURI https://github.com/Radical-Dave/Stop-SeleniumDrivers

.ICONURI

.EXTERNALMODULEDEPENDENCIES

.REQUIREDSCRIPTS

.EXTERNALSCRIPTDEPENDENCIES

.RELEASENOTES


#>

<#
.SYNOPSIS
Powershell Script to Stop-Process for SeleniumDrivers (chromedriver, etc)

.DESCRIPTION
Powershell Script to Stop-Process for SeleniumDrivers (chromedriver, etc)

.EXAMPLE
PS> .\Stop-SeleniumDrivers

.Link
https://github.com/Radical-Dave/Stop-SeleniumDrivers
https://github.com/Radical-Dave/Shared.SeleniumExtensions

.OUTPUTS
    System.String
#>
#####################################################
# Stop-SeleniumDrivers
#####################################################
[CmdletBinding(SupportsShouldProcess,PositionalBinding=$false)]
Param(
    # Setting for which one to remove?

    # Force - overwrite if index already exists
    [Parameter(Mandatory=$false)] [switch]$Force = $false
)
begin {
	$ErrorActionPreference = 'Stop'
	$PSScriptName = $MyInvocation.MyCommand.Name.Replace(".ps1","")

    $results = 'No processes found'
    $processes = Get-Process 'chromedriver' -ErrorAction SilentlyContinue
}
process {
	Write-Verbose "$PSScriptName $name $template start"
    if($PSCmdlet.ShouldProcess($processes)) {
        if ($processes) {
            $fragCount = 0
            while ($processes) {
                foreach($process in $processes) {
                    Stop-Process $process
                    $fragCount++;
                }
                $processes = Get-Process 'chromedriver' -ErrorAction SilentlyContinue
            }
            $results = "Completed. Kills:$fragCount"
        }
    }
    #Write-Host "$($PSScriptName):$results"
    if ($PersistForCurrentUser) { Set-Location $path }
    return $results
}