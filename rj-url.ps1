param(
    [Parameter(Position = 0)]
    [string]$Url
)

if (-not $Url) {
    $Url = Read-Host "Enter Radio Javan URL"
}

$Url = $Url.TrimEnd('/')

if ($Url -match '^https?://play\.radiojavan\.com/song/([^/?#]+)') {

    $slug = $Matches[1]
    $FinalUrl = "https://host2.rj-mw1.com/media/mp3/mp3-320/$slug.mp3"

}
elseif ($Url -match '^https?://play\.radiojavan\.com/podcast/([^/?#]+)') {

    $slug = $Matches[1]
    $FinalUrl = "https://host2.rj-mw1.com/media/podcast/mp3-320/$slug.mp3"

}
elseif ($Url -match '^https?://play\.radiojavan\.com/video/([^/?#]+)') {

    $slug = $Matches[1]
    $FinalUrl = "https://host2.rj-mw1.com/media/music_video/hd/$slug.mp4"

}
else {

    Write-Host "Invalid or unsupported Radio Javan URL." -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host $FinalUrl -ForegroundColor Cyan
Write-Host ""