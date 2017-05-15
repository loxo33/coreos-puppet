# Create CoreOS unit files
define coreos::unit(
String           $description,
Optional[Array[String]]  $after,
Optional[Array[String]]  $requires,
Optional[Array[String]]  $wants,
String           $execstart,
Optional[Array[String]]  $execstartpre,
Optional[String] $execstop,
Optional[String] $restartsec,
Optional[String] $restart,
Optional[Array[String]]  $wantedby,
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
