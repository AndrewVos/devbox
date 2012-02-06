class headless-browsing {
  package { "xvfb":
    ensure => present
  }
  package { "firefox":
    ensure => present
  }
}
