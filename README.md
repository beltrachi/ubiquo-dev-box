# A virtual machine for Ubiquo development and testing

## Introduction

This project automates the setup to develop or build a project with Ubiquo.

## Requirements

* [VirtualBox](https://www.virtualbox.org)

* [Vagrant](http://vagrantup.com)

## How To Build The Virtual Machine

Building the virtual machine is this easy:

    host $ git clone https://github.com/beltrachi/ubiquo-dev-box.git
    host $ cd ubiquo-dev-box
    host $ vagrant up

That's it.

The process will last some minutes.

After that you can:

    host $ vagrant ssh
    Welcome to Ubuntu 12.04 LTS (GNU/Linux 3.2.0-23-generic-pae i686)

    vagrant@ubiquo-dev-box:~$ cd /vagrant
    vagrant@ubiquo-dev-box:~$ ./scripts/ubiquo_devel_bootstrap.sh

This will make a clone of the ubiquo repo in local and create a project that uses 
the local code to build a project. This way you can make changes and push them to
your fork to do a pull request.

    /vagrant/gems/ubiquo # Contains the cloned repo that the project will be using.

In the file ./scripts/ubiquo_devel_bootstrap.sh you have a sample of how to create
a project.



Thanks to the project https://github.com/rails/rails-dev-box where we've taken the idea
and probably will copy the puppet provisioning someday.

