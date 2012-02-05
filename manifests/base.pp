group { "puppet":
  ensure => "present",
}

class basenode {
  include aptitude_update
  include git
  include tmux
  include vim
  include mongodb
  include ruby
}
include basenode

Package {
  require => Class[aptitude_update]
}

File { owner => 0, group => 0, mode => 0644 }
