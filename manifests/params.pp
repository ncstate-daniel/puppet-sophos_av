# == Class: sophos_av::params
class sophos_av::params {
  $install_dir        = '/opt/sophos-av'
  $auto_start         = false
  $enable_on_boot     = true
  $live_protection    = true
  $update_source_type = 'sophos'

  case $::osfamily {
    'RedHat': {
      $prefer_fanotify = true
    }
    'Debian': {
      $prefer_fanotify = false
    }
    default: {
      $prefer_fanotify = false
    }
  }

  $email_target = 'root@localhost'
  $email_demand_summary = true
  $email_language = 'English'
  $email_notifier = true
  $email_server = 'localhost:25'

  $enable_on_start = true

  $exclusion_encodings = [
    'UTF-8',
    'EUC-JP',
    'ISO-8859-1',
  ]
  $exclude_file_paths = [
  ]
  $exclude_file_on_glob = [
  ]
  $exclude_filesystems = [
  ]

  $log_max_size = 100
  $notify_on_update = false
  $upload_samples = false
  $send_error_email = true
  $send_threat_email = true
  $ui_notifier = true
  $ui_popup_notification = true
  $ui_tty_notification = true
  $update_period = 60
  $scan_archives = 'mixed'

}
