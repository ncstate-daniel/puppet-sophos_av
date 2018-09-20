# sophos_av

[![Build Status](https://travis-ci.org/jadestorm/puppet-sophos_av.png?branch=master)](https://travis-ci.org/jadestorm/puppet-sophos_av)
[![Code Coverage](https://coveralls.io/repos/github/jadestorm/puppet-sophos_av/badge.svg?branch=master)](https://coveralls.io/github/jadestorm/puppet-sophos_av?branch=master)
[![Puppet Forge](https://img.shields.io/puppetforge/v/jadestorm/sophos_av.svg)](https://forge.puppetlabs.com/jadestorm/sophos_av)
[![Puppet Forge - downloads](https://img.shields.io/puppetforge/dt/jadestorm/sophos_av.svg)](https://forge.puppetlabs.com/jadestorm/sophos_av)
[![Puppet Forge - endorsement](https://img.shields.io/puppetforge/e/jadestorm/sophos_av.svg)](https://forge.puppetlabs.com/jadestorm/sophos_av)
[![Puppet Forge - scores](https://img.shields.io/puppetforge/f/jadestorm/sophos_av.svg)](https://forge.puppetlabs.com/jadestorm/sophos_av)

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with sophos_av](#setup)
    * [What sophos_av affects](#what-sophos_av-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with sophos_av](#beginning-with-sophos_av)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)

## Description

Installs and manages Sophos Antivirus for Linux (free edition).

## Setup

### What sophos_av affects

* /opt/sophos-av
* systemd components

### Beginning with sophos_av

Basically just: `include sophos_av`

## Usage

I'm not writing out what the options actually do right now, so take
a look at init.pp/params.pp to get a list of what options there are.

At a minimum, you -must- set source_package to a location where the module can retrieve the install tarball.  ie:

```puppet
class { '::sophos_av':
  source_package => 'http://mypackages.example.org/sav-linux-free-9.tgz',
}
```

## Reference

Options you can pass to the class mostly map directory to SAV options.
For configuration assistance and help figuring out what options mean:
[Sophos Anti-Virus for Linux configuration guide](https://www.sophos.com/en-us/medialibrary/PDFs/documentation/savl_9_cgeng.pdf)

The available options are as follows:

* `source_package`: Where to get the package from.  You can get the package from Sophos's own site and then place it somewhere your hosts can get to.
  *Required*
  *Type*: String

* `install_dir`: Controls where Sophos AV is installed.  It is highly
  recommended that you leave this as default.
  *Default*: '/opt/sophos-av'
  *Type*: String

* `auto_start`: Controls whether Sophos AV is started immediately after install.  It is highly recommended you leave this as default.
  *Default*: `false`
  *Options*: `false`, `true`
  *Type*: Boolean

* `enable_on_boot`: Start SAV on boot?
  *Default*: `true`
  *Options*: `false`, `true`
  *Type*: Boolean

* `live_protection`: Should SAV scan and block files on read/write?
  *Default*: `true`
  *Options*: `false`, `true`
  *Type*: Boolean

* `update_source_type`: Where does SAV get it's updates from?  Leave default unless you know what you are doing.
  *Default*: `sophos`
  *Options*: `sophos`, `local`, `disable`
  *Type*: String

* `prefer_fanotify`: Prefer to use the Fanotify functionality?
  *Default*: `true` (on RedHat family, `false` on others)
  *Options*: `false`, `true`
  *Type*: Boolean

* `email_target`: Where to email reports/notifications to.
  *Default*: `root@localhost`
  *Type*: String

* `email_demand_summary`: Should we email the demand summary?
  *Default*: `true`
  *Options*: `false`, `true`
  *Type*: Boolean

* `email_language`: What language the email should be in.
  *Default*: `English`
  *Type*: String

* `email_notifier`: Should we notify via email?
  *Default*: `true`
  *Options*: `false`, `true`
  *Type*: Boolean

* `email_server`: What email server to use for notifications.
  *Default*: `localhost:25`
  *Type*: String

* `enable_on_start`: Should we enable SAV on startup?
  *Default*: `true`
  *Options*: `false`, `true`
  *Type*: Boolean

* `log_max_size`:  Max size of log files.
  *Default*: `100`
  *Type*: Numeric

* `notify_on_update`: Should we send an update when we perform an update?
  *Default*: `false`
  *Options*: `false`, `true`
  *Type*: Boolean

* `upload_samples`: Should we upload samples of files to Sophos?
  *Default*: `false`
  *Options*: `false`, `true`
  *Type*: Boolean

* `send_error_email`: Should we send emails on errors?
  *Default*: `true`
  *Options*: `false`, `true`
  *Type*: Boolean

* `send_threat_email`: Should we send emails on threats found?
  *Default*: `true`
  *Options*: `false`, `true`
  *Type*: Boolean

* `ui_notifier`: Activate the UI notifier?
  *Default*: `true`
  *Options*: `false`, `true`
  *Type*: Boolean

* `ui_popup_notification`: Should the UI notifier use GUI popups?
  *Default*: `true`
  *Options*: `false`, `true`
  *Type*: Boolean

* `ui_tty_notification`: Should the UI notifier use TTY notifications?
  *Default*: `true`
  *Options*: `false`, `true`
  *Type*: Boolean

* `update_period`: How often should we update our definitions (in minutes)?
  *Default*: `60`
  *Type*: Numeric

* `scan_archives`: Should we scan inside archives?
  *Default*: `mixed`
  *Options*: `mixed`, `enabled`, `disabled`
  *Type*: String

* `exclusion_encodings`: Encodings to use for exclusion checking.
  *Default*: `['UTF-8','EUC-JP','ISO-8859-1']`
  *Type*: Array

* `exclude_file_paths`: Exclude files at or under these paths.
  *Default*: `[]`
  *Type*: Array

* `exclude_file_on_glob`: Exclude files matching these glob patterns.
  *Default*: `[]`
  *Type*: Array

* `exclude_filesystems`: Exclude these file systems.
  *Default*: `[]`
  *Type*: Array
