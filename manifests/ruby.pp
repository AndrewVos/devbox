class ruby {
  exec { "rvm":
    command => "/bin/su -l vagrant -c '/bin/bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)'",
    require => Package["git"],
    creates => "/home/vagrant/.rvm/bin/rvm"
  }

  exec { "ruby-1.9.3":
    command => "/bin/su -l vagrant -c 'rvm install 1.9.3'",
    logoutput => true,
    timeout => 0,
    require => [Package["ruby-dependencies"], Exec["rvm"]],
    creates => "/home/vagrant/.rvm/rubies/ruby-1.9.3-p0/bin/ruby"
  }

  $ruby_dependencies = ["build-essential", "openssl", "libreadline6", "libreadline6-dev", "curl", "git-core", "zlib1g", "zlib1g-dev", "libssl-dev", "libyaml-dev", "libsqlite3-0", "libsqlite3-dev", "sqlite3", "libxml2-dev", "libxslt-dev", "autoconf", "libc6-dev", "ncurses-dev", "automake", "libtool", "bison", "subversion"]
  package { "ruby-dependencies":
    name => $ruby_dependencies,
    ensure => present
  }

  exec {"default-ruby":
    command => "/bin/su -l vagrant -c 'rvm use --default 1.9.3'",
    require => Exec["ruby-1.9.3"],
  }
}
