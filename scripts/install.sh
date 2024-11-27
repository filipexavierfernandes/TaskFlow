#!/bin/bash

# Acesse o diretório do projeto
cd TaskFlowApp

# Instalar CocoaPods (se ainda não estiver instalado)
if ! command -v pod &> /dev/null
then
    echo "CocoaPods not found, installing..."
    sudo gem install cocoapods
else
    echo "CocoaPods already installed."
fi

# Rodar XcodeGen para gerar o .xcodeproj e .xcworkspace
xcodegen generate

# Instalar dependências do CocoaPods
pod install

echo "Installation complete! You can now open the workspace and start developing."
