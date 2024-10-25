# perform a clean install
Write-Host ""
Write-Host "-----------------------------------------------------------------------"
$cleaninstall = Read-Host "clean install, current data will be lost? : "
if ($cleaninstall -eq "y") {
  Write-Host "Removing virtual environment"
  Remove-Item -Path ./venv -Recurse -Force
  Write-Host "Removing static files"
  Remove-Item -Path ./static -Recurse -Force
  Write-Host "Removing database"
  Remove-Item -Path ./databases/default.db.sqlite3 -Force
  Remove-Item -Path ./databases/development.db.sqlite3 -Force
  Write-Host "Removing temp files"
  Remove-Item -Path ./tmp\* -Recurse -Force
  Write-Host "Removing log files"
  Remove-Item -Path ./logs/*.log -Force
}
