# Create CoreOS unit files
define coreos::unit(
String           $description,
Optional[Array]  $after        = undef,
Optional[Array]  $requires     = undef,
Optional[Array]  $wants        = undef,
String           $execstart,
Optional[Array]  $execstartpre = undef,
Optional[String] $execstop     = undef,
Optional[String] $restartsec   = undef,
Optional[String] $restart      = undef,
Optional[Array]  $wantedby     = undef,
){
#  include ::coreos
#  include ::stdlib
  file {"/etc/systemd/system/${name}.service":
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => epp('coreos/unit.template.erb'),
    notify  => Class['coreos::systemctl::daemon_reload'],
  }
}
