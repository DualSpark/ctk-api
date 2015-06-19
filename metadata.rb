name             'ctk-api'
maintainer       'Patrick McClory'
maintainer_email 'patrick@dualspark.com'
license          'All rights reserved'
description      'Installs/Configures the DualSpark CTK API Demo'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'selinux_policy'
depends 'iptables'
depends 'rsyslog'
depends 'syslog-ng'
