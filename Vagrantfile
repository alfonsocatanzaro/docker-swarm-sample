# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.box = 'hashicorp/bionic64'

  # define manager nodes
  (1..5).each do |number|
    config.vm.define "node#{number}" do |node|
      node.vm.network 'private_network', ip: "192.168.99.20#{number}"
      node.vm.network 'forwarded_port', id: 'ssh', host: "820#{number}", guest: "22"
      node.vm.hostname = "node#{number}"
    end
  end
  
  # tweak vm settings to optimize for your machine:
  config.vm.provider 'virtualbox' do |vb|
    vb.memory = '4096'
    vb.cpus = 2
  end
  
  # install docker:
  config.vm.provision 'docker'

end
