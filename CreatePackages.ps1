gci -Recurse "src\**\project.json" |
Foreach-Object {
  if($Env:PackageType -eq "development")
  {
     dotnet pack -c $Env:CONFIGURATION --no-build --version-suffix $Env:LABEL -o artifacts $_.DirectoryName
  }
  else{
	 dotnet pack -c $Env:CONFIGURATION --no-build -o artifacts $_.DirectoryName
  }
}