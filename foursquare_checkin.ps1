if (-not ([System.Management.Automation.PSTypeName]'ServerCertificateValidationCallback').Type)
{
$certCallback = @"
    using System;
    using System.Net;
    using System.Net.Security;
    using System.Security.Cryptography.X509Certificates;
    public class ServerCertificateValidationCallback
    {
        public static void Ignore()
        {
            if(ServicePointManager.ServerCertificateValidationCallback ==null)
            {
                ServicePointManager.ServerCertificateValidationCallback += 
                    delegate
                    (
                        Object obj, 
                        X509Certificate certificate, 
                        X509Chain chain, 
                        SslPolicyErrors errors
                    )
                    {
                        return true;
                    };
            }
        }
    }
"@
    Add-Type $certCallback
 }
[ServerCertificateValidationCallback]::Ignore()

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add = {:method: POST}
$headers.Add = {:scheme: https}
$headers.Add = {:path: /v2/checkins/add}
$headers.Add = {:authority: api.foursquare.com}
$headers.Add = {cookie: __utma=51454142.940876681.1491290045.1491290045.1517918224.2; bbhive=ISTIZHABYFWC1BU35WA4O0Z1SQY0JC%3A%3A1572453739}
$headers.Add = {accept: */*}
$headers.Add = {content-type: application/x-www-form-urlencoded}
$headers.Add = {content-length: 279}
$headers.Add = {x-fs-consumer: 52}
$headers.Add = {user-agent: com.foursquare.robin.ios.phone:20180920.1511.26:20180820:iOS 12.0.1:iPhone10,4}
$headers.Add = {accept-language: ru-UA-UA}
$headers.Add = {accept-encoding: br, gzip, deflate}
$body = "batteryStrength=0.990000&venueId=%item_id%&llAcc=65.000000&batteryStatus=unplugged&ll=48.000000%2C35.000000&altAcc=10.000000&oauth_token=%token_here%%&hourFormat=24&floorLevel=2146959360&m=swarm&alt=76.624519&csid=8636&v=20180820"

Invoke-RestMethod 'https://api.foursquare.com/v2/checkins/add' -Method Post -Headers $headers -Body $body
