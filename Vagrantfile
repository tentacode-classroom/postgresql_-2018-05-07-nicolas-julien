Vagrant.configure("2") do |config|
    config.vm.box = "debian/stretch64"
    config.vm.network :forwarded_port, guest: 5432, host: 5432 #postgres
    config.vm.network :forwarded_port, guest: 8000, host: 8000 #couscous
    config.vm.network :private_network, ip: "192.168.33.55"

    config.vm.provider "virtualbox" do |vb|
        vb.customize ["modifyvm", :id, "--memory", 1024, "--natdnshostresolver1", "on"]
        vb.customize ["guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 1000]
    end

    config.ssh.forward_agent = true

    config.vm.synced_folder ".", "/vagrant", id: "postgresandbox",  :nfs => true, :mount_options => ['nolock','rw','vers=3','tcp','fsc','actimeo=1']

    config.vm.provision :shell, path: "./.provision/setup.sh"
    config.vm.provision :shell, path: "./.provision/reload.sh", run: "always"
end
