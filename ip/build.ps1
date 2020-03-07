$imageName = "ip"
$targetDir = "./"
$binPath = $targetDir + "/main"
Write-Host "#: building binary executable file..."
$env:GOOS="linux";$env:GOARCH="amd64";go build -ldflags="-s -w" -o $binPath ./
Write-Host "#: compressing binary executable file..."
upx $binPath
Write-Host "#: removing docker image..."
docker rmi $imageName
Write-Host "#: building docker image"
docker build -t $imageName $targetDir
Write-Host "#: exporting docker image..."
docker save $imageName -o M:\$imageName.tar
Write-Host "#: copying installing script..."
Copy-Item .\$imageName.sh M:\$imageName.sh
Write-Host "#: cleaning up..."
Remove-Item $binPath
Write-Host "#: done"