class coreos::systemctl::daemon_reload {
  exec { 'daemon_reload':
    command     => 'systemctl daemon-reload',
    path        => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/opt/bin',
    user        => 0,
    refreshonly => true
  }
}
