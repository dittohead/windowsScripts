$filename = "pic.jpg"
$Url = "https://upload.wikimedia.org/wikipedia/commons/3/37/African_Bush_Elephant.jpg"
cd ~
Invoke-RestMethod -Method Get -Uri $Url -OutFile $filename
$pic=(Get-Item -Path ".\").FullName+'\'+$filename
Set-WallPaper -Value $pic
