# == Class: magnum::olso_middlware
#
# Setup and configure oslo_middleware section in magnum config
#
# === Parameters
#
# [*params*]
#   (Optional) Hash of configs to pass through to oslo::middleware class.
#   Used for configuring oslo_middleware section of config.
#
class magnum::oslo_middleware(
  $params = {},
) inherits magnum::params {

  validate_legacy(Hash, 'validate_hash', $params)

  oslo::middleware {'magnum_config':
    * => $params,
  }

}
