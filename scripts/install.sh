#!/bin/bash

# Acesse o diretório onde o project.yml está localizado
cd "$(dirname "$0")/../TaskFlowApp"

# Verifica se o CocoaPods está instalado
if ! command -v pod &> /dev/null
then
    echo "CocoaPods not found, installing..."
    brew install cocoapods
else
    echo "CocoaPods already installed."
fi

# Rodar XcodeGen para gerar o .xcodeproj e .xcworkspace
if [ -f project.yml ]; then
    echo "Generating project with XcodeGen..."
    xcodegen generate
else
    echo "Error: project.yml not found in the TaskFlowApp directory!"
    exit 1
fi

# Instalar dependências do CocoaPods
if [ -f Podfile ]; then
    echo "Installing CocoaPods dependencies..."
    pod install
else
    echo "Error: Podfile not found in the TaskFlowApp directory!"
    exit 1
fi

echo "Installation complete! You can now open the workspace and start developing."
