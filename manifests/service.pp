# == Class: sophos_av::service
class sophos_av::service inherits sophos_av {

  service { 'sav-protect':
    ensure => running,
    enable => true,
  }

}
