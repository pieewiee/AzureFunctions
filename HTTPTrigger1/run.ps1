using namespace System.Net
# Input bindings are passed in via param block.
param($Request, $TriggerMetadata)

# Write to the Azure Functions log stream.
Write-Host "PowerShell HTTP trigger function processed a request."

# Interact with query parameters or the body of the request.
$name = $Request.Query.Name
if (-not $name) {
    $name = $Request.Body.Name
}

$body = "This HTTP triggered function executed successfully. Pass a name in the query string or in the request body for a personalized response."





$body = @"
<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">
<title>Calculator</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="">
<style>
</style>
<script src=""></script>
<body>

<img src="img_la.jpg" alt="LA" style="width:100%">

<div class="">
 <h1>This is a Heading</h1>
 <p>This is a paragraph.</p>
 <p>This is another paragraph.</p>
</div>

</body>
</html>


"@
#$body = $(Get-Content -Path "./template.html")

# Associate values to output bindings by calling 'Push-OutputBinding'.
Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
        StatusCode = [HttpStatusCode]::OK
        Body       = $body
    })