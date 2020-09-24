# Install Helper for Patchwork App

Requirements:
* python3

## Install
To start the installation process run this command:

```sh
curl --compressed -o- -L https://raw.githubusercontent.com/KirioXX/AppDepInstaller/main/main.sh | bash
```

It will ask you after the first setup for your user password.
So please keep an eye on your command line and provide your password.

## Manual Steps
Make zsh your default shell by running this command in your terminal:
```sh
chsh -s /bin/zsh
```

Please add the following lines to your `.zshrc` file:
```sh
# Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# JAVA
export JAVA_HOME="/Applications/Android Studio.app/Contents/jre/jdk/Contents/Home"
export PATH=$PATH:$JAVA_HOME/bin
```
