# == Class: sophos_av::install
class sophos_av::install inherits sophos_av {

  file { '/opt/sophos-av-install':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }
  ->archive { '/opt/sophos-av-install/sav-linux-free-9.tgz':
    source       => $sophos_av::source_package,
    extract      => true,
    extract_path => '/opt/sophos-av-install',
    creates      => '/opt/sophos-av-install/sophos-av/sav.tar',
    cleanup      => false,
  }

  # Variable prep
  if $sophos_av::auto_start { $str_autostart = 'True' }
  else                            { $str_autostart = 'False' }

  if $sophos_av::enable_on_boot { $str_enableonboot = 'True' }
  else                                { $str_enableonboot = 'False' }

  if $sophos_av::live_protection { $str_liveprotection = 'True' }
  else                                 { $str_liveprotection = 'False' }

  if $sophos_av::prefer_fanotify { $str_preferfanotify = 'True' }
  else                                 { $str_preferfanotify = 'False' }

  case $sophos_av::update_source_type {
    'sophos','s': {
      $str_updatesourcetype = 's'
    }
    'local','own','o': {
      $str_updatesourcetype = 'o'
    }
    'none','disable','n': {
      $str_updatesourcetype = 'n'
    }
    default: {
      $str_updatesourcetype = 's'
    }
  }

  # lint:ignore:140chars
  $exec_command = "bash ./install.sh ${sophos_av::install_dir} --automatic --acceptlicense --autostart=${str_autostart} --enableOnBoot=${str_enableonboot} --live-protect=${str_liveprotection} --update_source_type=${str_updatesourcetype} --preferFanotify=${str_preferfanotify}"
  exec { 'install SAV for Linux Free Edition':
    path    => ['/usr/sbin','/sbin','/usr/bin','/bin'],
    command => $exec_command,
    cwd     => '/opt/sophos-av-install/sophos-av',
    unless  => "test -x ${sophos_av::install_dir}/bin/savdctl",
    require => Archive['/opt/sophos-av-install/sav-linux-free-9.tgz'],
  }
  # lint:endignore

}
