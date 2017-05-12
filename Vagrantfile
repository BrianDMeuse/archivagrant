# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "anandbitra/redhat-6.5"

  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.network "forwarded_port", guest: 3306, host: 3306
  config.vm.network "forwarded_port", guest: 4567, host: 4567
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.network "forwarded_port", guest: 8081, host: 8081
  config.vm.network "forwarded_port", guest: 8089, host: 8089
  config.vm.network "forwarded_port", guest: 8443, host: 8443
  config.vm.network "forwarded_port", guest: 8983, host: 8983

  config.vm.provider "virtualbox" do |vb|
     vb.cpus = "2"
     vb.memory = "4096"
  end

  config.vm.provision "shell", path:"setup_repos.sh"
  config.vm.provision "shell", path:"setup_python.sh"
  #config.vm.provision "shell", path:"setup_mysql.sh"
  #config.vm.provision "shell", path:"setup_archivesspace.sh"

end
