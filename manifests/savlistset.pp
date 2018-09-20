# Sets a SAV config setting that is a list (adds and removes entries)
# The current list is retrieved from a fact.
define sophos_av::savlistset(
  $list,
) {

  # We can't operate on this until we know something about the local install
  if defined('$::sophos_av_settings') {

    $removelist = difference($::sophos_av_settings[$name], $list)
    $removelist.each |String $setting| {
      exec { "savconfig remove ${setting} from ${name}":
        path    => ["${sophos_av::install_dir}/bin",'/usr/sbin','/sbin','/usr/bin','/bin'],
        command => "savconfig remove ${name} '${setting}'",
        notify  => Service['sav-protect'],
      }
    }

    $addlist = difference($list, $::sophos_av_settings[$name])
    $addlist.each |String $setting| {
      exec { "savconfig add ${setting} to ${name}":
        path    => ["${sophos_av::install_dir}/bin",'/usr/sbin','/sbin','/usr/bin','/bin'],
        command => "savconfig add ${name} '${setting}'",
        notify  => Service['sav-protect'],
      }
    }
  }

}
