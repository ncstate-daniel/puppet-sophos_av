# == Class: sophos_av::config
class sophos_av::config inherits sophos_av {

  # lint:ignore:quoted_booleans
  sophos_av::savconfig { 'Email':
    setting => $sophos_av::email_target,
  }

  if $sophos_av::email_demand_summary
    { $str_emaildemandsummaryifthreat = 'true' }
  else
    { $str_emaildemandsummaryifthreat = 'false' }
  sophos_av::savconfig { 'EmailDemandSummaryIfThreat':
    setting => $str_emaildemandsummaryifthreat,
  }

  sophos_av::savconfig { 'EmailLanguage':
    setting => $sophos_av::email_language,
  }

  if $sophos_av::email_notifier
    { $str_emailnotifier = 'true' }
  else
    { $str_emailnotifier = 'false' }
  sophos_av::savconfig { 'EmailNotifier':
    setting => $str_emailnotifier,
  }

  sophos_av::savconfig { 'EmailServer':
    setting => $sophos_av::email_server,
  }

  if $sophos_av::enable_on_start
    { $str_enableonstart = 'true' }
  else
    { $str_enableonstart = 'false' }
  sophos_av::savconfig { 'EnableOnStart':
    setting => $str_enableonstart,
  }

  sophos_av::savlistset { 'ExclusionEncodings':
    list => $sophos_av::exclusion_encodings,
  }

  sophos_av::savlistset { 'ExcludeFilePaths':
    list => $sophos_av::exclude_file_paths,
  }

  sophos_av::savlistset { 'ExcludeFileOnGlob':
    list => $sophos_av::exclude_file_on_glob,
  }

  sophos_av::savlistset { 'ExcludeFilesystems':
    list => $sophos_av::exclude_filesystems,
  }

  sophos_av::savconfig { 'LogMaxSizeMB':
    setting => $sophos_av::log_max_size,
  }

  if $sophos_av::notify_on_update
    { $str_notifyonupdate = 'true' }
  else
    { $str_notifyonupdate = 'false' }
  sophos_av::savconfig { 'NotifyOnUpdate':
    setting => $str_notifyonupdate,
  }

  if $sophos_av::upload_samples
    { $str_uploadsamples = 'true' }
  else
    { $str_uploadsamples = 'false' }
  sophos_av::savconfig { 'UploadSamples':
    setting => $str_uploadsamples,
  }

  if $sophos_av::send_error_email
    { $str_senderroremail = 'true' }
  else
    { $str_senderroremail = 'false' }
  sophos_av::savconfig { 'SendErrorEmail':
    setting => $str_senderroremail,
  }

  if $sophos_av::send_threat_email
    { $str_sendthreatemail = 'true' }
  else
    { $str_sendthreatemail = 'false' }
  sophos_av::savconfig { 'SendThreatEmail':
    setting => $str_sendthreatemail,
  }

  if $sophos_av::ui_notifier
    { $str_uinotifier = 'true' }
  else
    { $str_uinotifier = 'false' }
  sophos_av::savconfig { 'UINotifier':
    setting => $str_uinotifier,
  }

  if $sophos_av::ui_popup_notification
    { $str_uipopupnotification = 'true' }
  else
    { $str_uipopupnotification = 'false' }
  sophos_av::savconfig { 'UIpopupNotification':
    setting => $str_uipopupnotification,
  }

  if $sophos_av::ui_tty_notification
    { $str_uittynotification = 'true' }
  else
    { $str_uittynotification = 'false' }
  sophos_av::savconfig { 'UIttyNotification':
    setting => $str_uittynotification,
  }

  sophos_av::savconfig { 'UpdatePeriodMinutes':
    setting => $sophos_av::update_period,
  }

  if $sophos_av::live_protection
    { $str_liveprotection = 'enabled' }
  else
    { $str_liveprotection = 'disabled' }
  sophos_av::savconfig { 'LiveProtection':
    setting => $str_liveprotection,
  }

  sophos_av::savconfig { 'ScanArchives':
    setting => $sophos_av::scan_archives,
  }
  # lint:endignore

}
