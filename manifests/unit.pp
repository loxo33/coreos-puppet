# Create CoreOS unit files
define coreos::unit(
String           $description  = $name,
Optional[Array]  $after        = undef,
Optional[Array]  $requires     = undef,
Optional[Array]  $wants        = undef,
String           $execstart    = undef,
Optional[Array]  $execstartpre = undef,
Optional[String] $execstop     = undef,
Optional[String] $restartsec   = undef,
Optional[String] $restart      = undef,
Optional[Array]  $wantedby     = undef
){
  include ::coreos

  file {"/etc/systemd/system/${name}.service":
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => template('coreos/unit.template.erb'),
    notify  => Class['coreos::systemctl::daemon_reload'],
  }
}
