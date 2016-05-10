Vagrant.configure(2) do |config|
  config.vm.box = "bento/centos-7.1"
  config.vm.network "forwarded_port", guest: 80, host: 8080, auto_correct: true

  # config.omnibus.chef_version = :latest
  # config.berkshelf.berksfile_path = "./chef-repo/site-cookbooks/netcommons/Berksfile"
  # config.berkshelf.enabled = true

  config.vm.provision "chef_zero" do |chef|
    chef.version = '12.10.24'   # https://github.com/chef/chef/issues/4905
    chef.cookbooks_path = "./chef-repo/cookbooks"
    chef.nodes_path = "./chef-repo/nodes"  # https://github.com/mitchellh/vagrant/issues/6862
    # chef.roles_path = "./chef-repo/roles"
    chef.add_recipe "netcommons"

    node.vm.synced_folder './NetCommons3', '/var/www/html/NetCommons3'
  end
end
