foreach ($dir in $args) {
    if (Test-Path -LiteralPath $dir -PathType container) {
        Set-Location -LiteralPath $dir
        $name = Split-Path -Path $dir -Leaf 
        Get-ChildItem | Compress-Archive -DestinationPath "..\${name}.zip"
    } else {
        Write-Host "Folder does not exists : ${dir}" -ForegroundColor Red
    }
}
pause
exit
