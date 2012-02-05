group { "puppet":
  ensure => "present",
}

class basenode {
  include motd
  include git
  include tmux
  include vim
  include mongodb
  include ruby
}
include basenode

File { owner => 0, group => 0, mode => 0644 }

class motd {
  file { '/etc/motd':
    content => "Welcome to Vos's Dev Box"
  }
}

class git {
  package{ "git":
    ensure => present
  }
}

class tmux {
  package{ "tmux":
    ensure => present
  }
}

class vim {
  package{ "vim-nox":
    ensure => present
  }

  exec{ "vimrc":
    command => "/usr/bin/curl -s -o /home/vagrant/.vimrc https://raw.github.com/AndrewVos/vimfiles/master/.vimrc"
  }

  exec{ "clone-vundle":
    command => "/usr/bin/git clone http://github.com/gmarik/vundle.git /home/vagrant/.vim/bundle/vundle",
    creates => "/home/vagrant/.vim/bundle/vundle/README.md",
    require => Package["git"]
  }

  exec { "vundle-bundle-install":
    command => "/bin/su -l vagrant -c '/usr/bin/vim +BundleInstall +qall'",
    require => [
      Package["vim-nox"],
      Exec["clone-vundle"],
      Exec["vimrc"]
    ]
  }

  exec{ "compile-command-t":
    cwd => "/home/vagrant/.vim/bundle/Command-T/ruby/command-t",
    command => "/usr/bin/ruby extconf.rb && make",
    require => Exec["vundle-bundle-install"]
  }

  file{ "/home/vagrant/.vim":
    recurse => true,
    owner => "vagrant",
    group => "vagrant",
    mode => 644,
    require => Exec["clone-vundle"]
  }
}

class mongodb {
  package{ "mongodb":
    ensure => present
  }
}
