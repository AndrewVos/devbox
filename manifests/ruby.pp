class ruby {
  exec { "rvm":
    command => "/bin/su -l vagrant -c '/bin/bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)'",
    require => Package["git"],
    creates => "/home/vagrant/.rvm/bin/rvm"
  }

  exec { "ruby-1.9.3":
    command => "/bin/su -l vagrant -c 'rvm install 1.9.3'",
    require => Exec["rvm"],
    creates => "/home/vagrant/.rvm/rubies/ruby-1.9.3-p0/bin/ruby"
  }

  exec {"default-ruby":
    command => "/bin/su -l vagrant -c 'rvm use --default 1.9.3'",
    require => Exec["ruby-1.9.3"],
  }
}
