function Get-Excuse {
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