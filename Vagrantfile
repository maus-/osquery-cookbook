Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |v|
    v.memory = 512
    v.cpus = 2
  end
  config.vm.define "centos" do |box|
    box.vm.box = "chef/centos-6.5"
    box.vm.provision "chef_solo" do |chef|
      chef.cookbooks_path = "chef/cookbooks"
      chef.roles_path     = "chef/roles"
      chef.data_bags_path = "chef/data_bags"
      chef.add_role('osquery')
    end
  end

end
