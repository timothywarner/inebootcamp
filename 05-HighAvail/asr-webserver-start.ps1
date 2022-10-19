$service = Get-Service -Name 'w3svc'
if ($service -ne 'Running') {
  Start-Service -Name 'w3svc' -Force
}
exit