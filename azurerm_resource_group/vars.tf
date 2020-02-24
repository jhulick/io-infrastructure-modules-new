variable "global_prefix" {
  type = string
}

variable "environment" {
  type = string
}

variable "environment_short" {
  type = string
}

variable "region" {
  type = string
}

variable "name" {
  type = string
}

locals {
  resource_name = "${var.global_prefix}-${var.environment_short}-rg-${var.name}"
}
