variable "release_name" {
  description = "Helm release name"
  default     = "reflector"
}

variable "chart_name" {
  description = "Helm chart name to provision"
  default     = "reflector"
}

variable "chart_repository" {
  description = "Helm repository for the chart"
  default     = "https://emberstack.github.io/helm-charts"
}

variable "chart_version" {
  description = "Version of Chart to install. Set to empty to install the latest version"
  default     = "5.4.17"
}

variable "chart_namespace" {
  description = "Namespace to install the chart into"
  default     = "default"
}

variable "chart_timeout" {
  description = "Timeout to wait for the Chart to be deployed."
  default     = 300
}

variable "max_history" {
  description = "Max History for Helm"
  default     = 20
}

#######################
# Chart Values
#######################
variable "replica" {
  description = "Number of replica of reflector"
  default     = 1
}

variable "image_repository" {
  description = "Image repository"
  default     = "emberstack/kubernetes-reflector"
}

variable "image_tag" {
  description = "Image tag. Defaults to Chart version if unspecified"
  default     = ""
}

variable "rbac_enabled" {
  description = "Create RBAC resources"
  default     = true
}

variable "service_account_create" {
  description = "Create service account"
  default     = true
}

variable "service_account_annotations" {
  description = "Annotations for service account"
  default     = {}
}

variable "service_account_name" {
  description = "Override service account name"
  default     = ""
}

variable "pod_fs_group" {
  description = "fsGroup for Pod Security Context"
  default     = 2000
}

variable "security_context" {
  description = "Security context for the container"
  default = {
    capabilities = {
      drop = ["ALL"]
    }
    readOnlyRootFilesystem = false
    runAsNonRoot           = true
    runAsUser              = 1000
  }
}

variable "liveness_probe" {
  description = "Liveness probe configuration"
  default = {
    initialDelaySeconds = 5
    periodSeconds       = 10
  }
}

variable "readiness_probe" {
  description = "Readiness probe configuration"
  default = {
    initialDelaySeconds = 5
    periodSeconds       = 10
  }
}

variable "resources" {
  description = "Resources for pod"
  default = {
    requests = {
      cpu    = "100m"
      memory = "256Mi"
    }
    limits = {
      cpu    = "100m"
      memory = "256Mi"
    }
  }
}

variable "tolerations" {
  description = "Pod tolerations"
  default     = []
}

variable "affinity" {
  description = "Pod affinity"
  default     = {}
}
