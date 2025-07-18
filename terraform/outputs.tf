output "static_site_url" {
  value = azurerm_storage_account.resume_storage.primary_web_endpoint
}

output "function_app_url" {
  value = azurerm_linux_function_app.resume_fn.default_hostname
}