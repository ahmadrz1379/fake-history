$startDate = Get-Date "2022-03-04"
$endDate = Get-Date

$currentDate = $startDate

while ($currentDate -le $endDate) {

    Write-Host "Generating commits for $($currentDate.ToString('yyyy-MM-dd'))"

    for ($i = 1; $i -le 100; $i++) {

        $timestamp = Get-Date -Format "yyyyMMddHHmmssffff"

        Add-Content -Path "data.txt" -Value "$timestamp commit $i"

        git add data.txt

        $fakeDate = $currentDate.AddMinutes($i)

        $env:GIT_AUTHOR_DATE = $fakeDate.ToString("yyyy-MM-dd HH:mm:ss")
        $env:GIT_COMMITTER_DATE = $fakeDate.ToString("yyyy-MM-dd HH:mm:ss")

        git commit -m "commit $i on $($currentDate.ToString('yyyy-MM-dd'))"
    }

    $currentDate = $currentDate.AddDays(1)
}