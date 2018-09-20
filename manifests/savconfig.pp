# Sets a SAV config setting
define sophos_av::savconfig(
  $setting
) {

  exec { "savconfig: ${name} = ${setting}":
    path    => ["${sophos_av::install_dir}/bin",'/usr/sbin','/sbin','/usr/bin','/bin'],
    command => "savconfig set ${name} '${setting}'",
    unless  => "test `savconfig query ${name}` == '${setting}'",
    notify  => Service['sav-protect'],
  }

}
