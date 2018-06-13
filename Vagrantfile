Vagrant.configure("2") do |config|
  config.vm.box = "trombik/ansible-freebsd-11.1-amd64"
  category = "devel"
  portname = "tool-mkspiffs"
  config.vm.provision "shell",
    inline: "
    sudo pkg install -y git
    if [ ! -d /usr/ports ]; then
      fetch -o - https://github.com/freebsd/freebsd-ports/archive/master.tar.gz | sudo tar -C /usr -xf - -s '/^freebsd-ports-master/ports/'
    fi
    (cd /usr/ports/#{category} && sudo git clone https://github.com/trombik/#{portname}.git)
    sudo make -C /usr/ports/#{category}/#{portname} -DPACKAGE_BUILDING
    sudo make -C /usr/ports/#{category}/#{portname} install clean
    find /usr/local/share/#{portname}
    "
end
