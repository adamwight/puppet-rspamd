# Class: rspamd
# ===========================
#
# Main entry point for the rspamd module
#
# @summary this class allows you to install and configure the Rspamd system and its services
# 
# @example
#   include rspamd
#
# @param package_manage    whether to install the rspamd package
# @param service_manage    whether to manage the rspamd service
# @param manage_package_repo whether to add the upstream package repo to your system (includes {rspamd::repo})
# @param config_path       the path containing the rspamd config directory
# @param purge_unmanaged   whether local.d/override.d config files not managed by this module should be purged
#
# @author Bernhard Frauendienst <puppet@nospam.obeliks.de>
#
class rspamd (
  String $config_path,
  Boolean $manage_package_repo,
  Boolean $package_manage,
  String $package_name,
  Boolean $purge_unmanaged,
  Boolean $service_manage,
) {
  contain rspamd::install
  contain rspamd::configuration
  contain rspamd::service

  Class['::rspamd::install']
  -> Class['::rspamd::configuration']
  ~> Class['::rspamd::service']
}
