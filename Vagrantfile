# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "ubuntu-1104-server-amd64-with-puppet-support"
  config.vm.box_url = "https://github.com/downloads/divio/vagrant-boxes/vagrant-ubuntu-11.04-server-amd64-v1.box"

  # config.vm.boot_mode = :gui
  # config.vm.share_folder "v-data", "/vagrant_data", "../data"

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file  = "ubuntu-1104-server-amd64-with-puppet-support.pp"
  end
end
