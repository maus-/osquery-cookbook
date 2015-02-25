# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = '2'
Vagrant.require_version '>= 1.5.0'
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  [
    %w{ centos6     chef/centos-6.5 },
    %w{ centos7     chef/centos-7.0 },
    %w{ ubuntu1204  chef/ubuntu-12.04},
    %w{ ubuntu1404  chef/ubuntu-14.04}
  ].each do |x|
    (name, box) = x
    config.vm.define name do |build|
      build.vm.box = box
      build.vm.hostname = name
      if Vagrant.has_plugin?("vagrant-omnibus")
        build.omnibus.chef_version = 'latest'
      end
      build.vm.network :private_network, type: 'dhcp'
      build.berkshelf.enabled = true
      build.vm.provision :chef_solo do |chef|
        chef.run_list = [
          'recipe[osquery::default]'
        ]
      end
    end
  end
end
