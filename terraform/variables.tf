variable "resource_group_name" {
  default = "resume-rg"
}

variable "location" {
  default = "canadacentral"
}

variable "storage_account_name" {
  default = "vithustoragesa02"
}

variable "function_app_name" {
  default = "vithu-function-app-new01"
}

variable "app_service_plan_name" {
  default = "resume-fn-plan-new01"
}

variable "function_runtime_version" {
  default = "~4"
}