$emailSmtpServer = "smtp.yandex.com.tr"
$emailSmtpServerPort = "587"
$emailSmtpUser = "admin@admin.com"
$emailSmtpPass = "pass"
$c=Get-Date
$emailMessage = New-Object System.Net.Mail.MailMessage
$emailMessage.From = "admin@admin.com"
$emailMessage.To.Add( "turkcan.keskin@gmail.com" )
$emailMessage.Subject = $env:COMPUTERNAME + " test "
$emailMessage.IsBodyHtml = $true
$emailMessage.Body = @"
$env:COMPUTERNAME
$c
<p>created by turkcankeskin</p>
"@

$SMTPClient = New-Object System.Net.Mail.SmtpClient( $emailSmtpServer , $emailSmtpServerPort )
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential( $emailSmtpUser , $emailSmtpPass );

$SMTPClient.Send( $emailMessage )
