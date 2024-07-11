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
# [*helm_chart_repo*]
#   Reference to the helm chart repository for the cluster API driver.
#   Defaults to $::os_service_default
#
# [*helm_chart_name*]
#   Name of the helm chart to use from the repo specified by the helm_chart_repo.
#   Defaults to $::os_service_default
#
class magnum::driver::capi_helm (
  $kubeconfig_file  = $::os_service_default,
  $helm_chart_repo  = $::os_service_default,
  $helm_chart_name  = $::os_service_default,
) {

  magnum_config {
    'capi_helm/kubeconfig_file': value => $kubeconfig_file;
    'capi_helm/helm_chart_repo': value => $helm_chart_repo;
    'capi_helm/helm_chart_name': value => $helm_chart_name;
  }

}
