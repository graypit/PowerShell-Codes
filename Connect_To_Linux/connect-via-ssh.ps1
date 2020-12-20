function ConnectToSSH($HostIP, $Username, $Password) {
    Import-Module posh-ssh;
    write-host "We are going to connect to: $HostIP server"
    $secpword = ConvertTo-SecureString -AsPlainText $($Password) -Force
    $Credential = New-Object System.Management.Automation.PSCredential ($Username, $secpword)
    New-SSHSession -ComputerName $HostIP -Credential $Credential
    Invoke-SSHCommand -Index 0 -Command "mkdir my-folder" -TimeOut 30
 }
 ConnectToSSH "192.168.1.55" "root" "myrootpass123"