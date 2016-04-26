function Get-Excuse {
<#

    .SYNOPSIS   
		Gets a random excuse.
         
    .DESCRIPTION   
		This module grabs a random excuse from the BOFH Excuse Archive. It will return 1 excuse for each
		array item piped to it. 
	
	.PARAMETER Counts
		The number of excuses to return
         
    .NOTES
		Author: Stephen Arnold
		
		Version 0.1
			Everything.
  
    .EXAMPLE
		(1..10)|Get-Excuse
		Returns 10 excuses. 

		
#> 

[CmdletBinding()]
	param(
		[Parameter(ValueFromPipeline=$true)]
		 $Counts
    )
	Begin {}
	
	Process {
		$Web = New-Object System.Net.WebClient     
		$ExcuseList = (($Web.DownloadString("http://pages.cs.wisc.edu/~ballard/bofh/excuses")).split([Environment]::NewLine))
		$ExcuseCount = $ExcuseList.count
		
		$Counts | % { 
			$ExcuseList[(Get-Random $ExcuseCount)]
		}
	}
	
	End{}
}