# This module manages CoreOS components.
class coreos {
include '::coreos::systemctl::daemon-reload'
}
