$file = Get-Item 'kentang.JPG'
$boundary = [System.Guid]::NewGuid().ToString()
$LF = "`r`n"

$bodyLines = (
    "--$boundary",
    "Content-Disposition: form-data; name=`"image`"; filename=`"$($file.Name)`"",
    "Content-Type: image/jpeg",
    "",
    [System.IO.File]::ReadAllBytes($file.FullName),
    "--$boundary--",
    ""
) -join $LF

try {
    $response = Invoke-WebRequest -Uri 'http://localhost:3000/api/predict/predict' -Method Post -Body $bodyLines -ContentType "multipart/form-data; boundary=$boundary"
    Write-Host "Success! Response:"
    $response.Content | ConvertFrom-Json | ConvertTo-Json -Depth 10
} catch {
    Write-Host "Error: $($_.Exception.Message)"
    if ($_.Exception.Response) {
        Write-Host "Status Code: $($_.Exception.Response.StatusCode)"
        $reader = New-Object System.IO.StreamReader($_.Exception.Response.GetResponseStream())
        $responseBody = $reader.ReadToEnd()
        Write-Host "Response Body: $responseBody"
    }
}
