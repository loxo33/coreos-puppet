# Create CoreOS unit files
define coreos::unit(
String           $unit_description,
Optional[Array]  $unit_after        = undef,
Optional[Array]  $unit_requires     = undef,
Optional[Array]  $unit_wants        = undef,
String           $execstart,
Optional[Array]  $execstartpre      = undef,
Optional[String] $execstop          = undef,
Optional[String] $restartsec        = undef,
Optional[String] $restart           = undef,
Optional[Array]  $unit_wantedby     = undef,
){
  include ::coreos
  include ::stdlib
  file {"/etc/systemd/system/${name}.service":
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => template('coreos/unit.template.erb'),
    notify  => Class['coreos::systemctl::daemon_reload'],
  }
}
