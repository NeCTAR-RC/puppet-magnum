# == Class: magnum::driver::capi_helm
#
# Configures the Magnum capi_helm driver
#
# === Parameters
#
# [*kubeconfig_file*]
#   Path to a kubeconfig file for a management cluster
#   Defaults to $::os_service_default
#
class magnum::driver::capi_helm (
  $kubeconfig_file  = $::os_service_default,
) {

  magnum_config {
    'capi_helm/kubeconfig_file': value => $kubeconfig_file,
  }

}
