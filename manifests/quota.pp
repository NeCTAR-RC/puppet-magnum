# == Class: magnum::quota
#
# Setups magnum quota.
#
# === Parameters
#
# [*quota_clusters*]
#   (optional) Number of clusters allowed per project.
#   Defaults to '20'.
#
class magnum::quota (
  $quota_clusters            = $::os_service_default
) {

  magnum_config {
    'quotas/max_clusters_per_project':  value => $quota_clusters;
  }
}
