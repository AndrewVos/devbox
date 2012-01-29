group { "puppet":
  ensure => "present",
}

File { owner => 0, group => 0, mode => 0644 }

file { '/etc/motd':
  content => "Welcome to Vos's Dev Box"
}

package{ "vim-nox":
  ensure => "present"
}

package{ "git":
  ensure => "present"
}

package{ "tmux":
  ensure => "present"
}
