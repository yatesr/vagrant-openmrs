vagrant-openmrs
===============

Vagrant file that deploys openmrs using puppet.

## Requirements
* Vagrant 1.5+
* Virtualbox

## Configuration
`Vagrantfile`
Adjust vagrant settings such as memory and cpus for vm.

`servers.yaml`
Controls number of vms deployed and their ip.

`puppet/manifests/site.pp`
Contains variables such as db passwords and which release of openmrs to use.

## How to use this
* clone this repo and change into the vagrant-openmrs directory
* vagrant up
* Access openmrs1 at localhost:8081/openmrs, openmrs2 at localhost:8082/openmrs
