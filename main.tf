resource "helm_release" "release" {
  name       = var.release_name
  chart      = var.chart_name
  repository = var.chart_repository
  version    = var.chart_version
  namespace  = var.chart_namespace

  max_history = var.max_history
  timeout     = var.chart_timeout

  values = [
    templatefile("${path.module}/templates/values.yaml", local.values),
  ]
}

locals {
  values = {
    replica = var.replica

    image_repository = var.image_repository
    image_tag        = var.image_tag

    rbac_enabled                = var.rbac_enabled
    service_account_create      = var.service_account_create
    service_account_annotations = jsonencode(var.service_account_annotations)
    service_account_name        = var.service_account_name

    pod_fs_group     = var.pod_fs_group
    security_context = jsonencode(var.security_context)

    liveness_probe  = jsonencode(var.liveness_probe)
    readiness_probe = jsonencode(var.readiness_probe)

    resources   = jsonencode(var.resources)
    tolerations = jsonencode(var.tolerations)
    affinity    = jsonencode(var.affinity)
  }
}
