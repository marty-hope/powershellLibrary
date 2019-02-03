$originalLocation = "C:\Users\marty\OneDrive\Pictures\Camera imports\2019-02"
$copyToLocation = "D:\Pictures\Camera Roll\02-02-2019"
if([System.IO.Directory]::Exists($originalLocation)){
    $files = [System.IO.Directory]::EnumerateFiles($originalLocation, "*.arw")
    foreach($file in $files)
    {
        $fileNameWithoutPath = [System.IO.Path]::GetFileName($file)
        $newFileNameWithFullPath = "$copyToLocation\$fileNameWithoutPath"
        [System.IO.File]::Move($file, $newFileNameWithFullPath)     

    }     
}