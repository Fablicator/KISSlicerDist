git clone -b fm1-profile "https://github.com/Fablicator/KISSlicerDist.git"  ".\profiles\fm1\"
git clone -b mx-profile "https://github.com/Fablicator/KISSlicerDist.git"  ".\profiles\mx\"
git clone -b sx-profile "https://github.com/Fablicator/KISSlicerDist.git"  ".\profiles\sx\"

Compress-Archive -Path ".\profiles\mx\*" -DestinationPath ".\release\mx-profile.zip"
Compress-Archive -Path ".\profiles\sx\*" -DestinationPath ".\release\sx-profile.zip"
Compress-Archive -Path ".\profiles\fm1\*" -DestinationPath ".\release\fm1-profile.zip"