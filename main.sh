#!/bin/bash

function installAnsible {
    wget https://github.com/ownport/portable-ansible/releases/download/v0.4.2/portable-ansible-v0.4.2-py3.tar.bz2 -O ansible.tar.bz2
    tar -xjf ansible.tar.bz2
    for l in config console doc galaxy inventory playbook pull vault;do
        ln -s ansible ansible-$l
    done
    python3 ansible localhost -m ping
}

function cleanUpAnsible {
    rm -rf ./ansible*
}

function installRequirements {
    python3 ansible-galaxy install -r ./requirements.yml
}

function installDependencies {
    python3 ansible-playbook ./main.yml -i inventory -K
}

installAnsible
installRequirements
installDependencies
cleanUpAnsible
