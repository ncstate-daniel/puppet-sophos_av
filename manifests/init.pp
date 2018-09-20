# == Class: sophos_av
class sophos_av (
  $source_package,
  $install_dir           = $sophos_av::params::install_dir,
  $auto_start            = $sophos_av::params::auto_start,
  $enable_on_boot        = $sophos_av::params::enable_on_boot,
  $live_protection       = $sophos_av::params::live_protection,
  $update_source_type    = $sophos_av::params::update_source_type,
  $prefer_fanotify       = $sophos_av::params::prefer_fanotify,
  $email_target          = $sophos_av::params::email_target,
  $email_demand_summary  = $sophos_av::params::email_demand_summary,
  $email_language        = $sophos_av::params::email_language,
  $email_notifier        = $sophos_av::params::email_notifier,
  $email_server          = $sophos_av::params::email_server,
  $enable_on_start       = $sophos_av::params::enable_on_start,
  $log_max_size          = $sophos_av::params::log_max_size,
  $notify_on_update      = $sophos_av::params::notify_on_update,
  $upload_samples        = $sophos_av::params::upload_samples,
  $send_error_email      = $sophos_av::params::send_error_email,
  $send_threat_email     = $sophos_av::params::send_threat_email,
  $ui_notifier           = $sophos_av::params::ui_notifier,
  $ui_popup_notification = $sophos_av::params::ui_popup_notification,
  $ui_tty_notification   = $sophos_av::params::ui_tty_notification,
  $update_period         = $sophos_av::params::update_period,
  $scan_archives         = $sophos_av::params::scan_archives,
  $exclusion_encodings   = $sophos_av::params::exclusion_encodings,
  $exclude_file_paths    = $sophos_av::params::exclude_file_paths,
  $exclude_file_on_glob  = $sophos_av::params::exclude_file_on_glob,
  $exclude_filesystems   = $sophos_av::params::exclude_filesystems,
)inherits sophos_av::params {
  anchor{'sophos_av::begin':}
  ->class{'::sophos_av::install':}
  ->class{'::sophos_av::config':}
  ~>class{'::sophos_av::service':}
  ->anchor{'sophos_av::end':}
}
