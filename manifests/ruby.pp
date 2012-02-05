class ruby {
  exec { "rvm":
    command => "/bin/su -l vagrant -c '/bin/bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)'",
    require => [
      Package["git"]
    ],
    creates => "/home/vagrant/.rvm/bin/rvm"
  }
}
