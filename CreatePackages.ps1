gci -Recurse "src\**\project.json" |
Foreach-Object {
  if($Env:PackageType -eq "development")
  {
     dotnet pack -c %CONFIGURATION% --no-build --version-suffix %LABEL% -o artifacts $_.DirectoryName
  }
  else{
	 dotnet pack -c %CONFIGURATION% --no-build -o artifacts $_.DirectoryName
  }
}