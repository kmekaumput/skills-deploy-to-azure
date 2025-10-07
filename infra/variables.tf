variable "location" {
  description = "The Azure region to deploy resources in"
  type        = string

}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "app_plan" {
  description = "The name of the app service plan"
  type        = string

}

variable "webapp_name" {
  description = "The name of the webapp"
  type        = string

}

variable "image_registry_url" {
  description = "The URL of the image registry"
  type        = string

}

variable "image_registry_username" {
  description = "The username for the image registry"
  type        = string

}

variable "image_registry_password" {
  description = "The password for the image registry"
  type        = string

}