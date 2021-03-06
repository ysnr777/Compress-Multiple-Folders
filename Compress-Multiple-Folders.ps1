if ($Args.Count -eq 0) {
    Write-Host "No arguments specified." -ForegroundColor Red
    pause
    exit
}
$Args | foreach {
    if (Test-Path -LiteralPath $_ -PathType container) {
        Set-Location -LiteralPath $_
        $name = Split-Path -Path $_ -Leaf 
        Get-ChildItem | Compress-Archive -DestinationPath "..\${name}.zip"
    } else {
        Write-Host "Folder does not exists : ${_}" -ForegroundColor Red
    }
}
pause
exit
