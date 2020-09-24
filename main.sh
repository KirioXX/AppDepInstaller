#!/bin/bash

function fetchConfig {
    git clone https://github.com/KirioXX/AppDepInstaller.git ./config > /dev/null 2>&1
}

function installAnsible {
    wget https://github.com/ownport/portable-ansible/releases/download/v0.4.2/portable-ansible-v0.4.2-py3.tar.bz2 --no-verbose -O ansible.tar.bz2
    tar -xjf ansible.tar.bz2
    for l in config console doc galaxy inventory playbook pull vault;do
        ln -s ansible ansible-$l
    done
    python3 ansible -i ./config/inventory -m ping
}

function cleanUp {
    rm -rf ./ansible*
    rm -rf ./config
}

function installRequirements {
    python3 ansible-galaxy install -r ./config/requirements.yml
}

function installDependencies {
    python3 ansible-playbook ./config/main.yml -i ./config/inventory -K
}

fetchConfig
installAnsible
installRequirements
installDependencies
cleanUp
