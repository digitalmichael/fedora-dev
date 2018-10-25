# vagrant-devbox
Fedora Development workstation

**Purpose:** desire a consistent workstation for working on code and accessing systems in environment.

**Prerequisites:** You need to have virtualbox and Vagrant installed on your computer. VNC client if you want a gui (I like TigerVNC)

**Instructions:** From a terminal navigate to this repo and run 'vagrant up'

Once the box is up you can access in two ways:

1. run 'vagrant ssh' to ssh into the box (aka vm)
2. using vnc client connect to '127.0.0.1:5901'. As with any vagrant box the login is vagrant/vagrant OR root/vagrant

**TODO**

1. too much to list to make this as automated as possible. The dream is if the system is corrupt you vagrant destroy and vagrant up a new system and can continue working with as little rework as possible.


