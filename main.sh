#!/bin/bash

function fetchConfig {
    git clone https://github.com/KirioXX/AppDepInstaller.git ./config > /dev/null 2>&1
}

function installAnsible {
    curl -L https://github.com/ownport/portable-ansible/releases/download/v0.4.2/portable-ansible-v0.4.2-py3.tar.bz2 | tar -xz
    for l in config console doc galaxy inventory playbook pull vault;do
        ln -s ansible ansible-$l
    done
    python3 ansible localhost -m ping
}

function cleanUp {
    rm -rf ./ansible*
    rm -rf ./config
}

function installRequirements {
    python3 ansible-galaxy install -r ./config/requirements.yml
}

function installDependencies {
    python3 ansible-playbook ./config/main.yml -i ./config/hosts.ini -K
}

if command -v python3 &> /dev/null
then
    fetchConfig
    installAnsible
    installRequirements
    installDependencies
    cleanUp
else
    echo "Please install python 3"
fi
