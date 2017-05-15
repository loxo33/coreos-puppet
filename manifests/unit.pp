# Create CoreOS unit files
define coreos::unit(
String           $description,
Optional[Array]  $after,
Optional[Array]  $requires,
Optional[Array]  $wants,
String           $execstart,
Optional[Array]  $execstartpre,
Optional[String] $execstop,
Optional[String] $restartsec,
Optional[String] $restart,
Optional[Array]  $wantedby,
){
  include ::coreos
  include ::stdlib
  file {"/etc/systemd/system/${name}.service":
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => epp('coreos/unit.template.epp'),
    notify  => Class['coreos::systemctl::daemon_reload'],
  }
}
