#!/bin/bash

# Caminho absoluto para o diretório do script
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_DIR="$SCRIPT_DIR/../TaskFlowApp"

# Exibir caminhos para depuração
echo "Script directory: $SCRIPT_DIR"
echo "Project directory: $PROJECT_DIR"

# Verifica se o diretório do projeto existe
if [ ! -d "$PROJECT_DIR" ]; then
    echo "Error: Project directory $PROJECT_DIR does not exist!"
    exit 1
fi

# Acesse o diretório do projeto
cd "$PROJECT_DIR" || { echo "Error: Unable to navigate to $PROJECT_DIR"; exit 1; }

# Verifica se o arquivo project.yml existe
if [ ! -f "$PROJECT_DIR/project.yml" ]; then
    echo "Error: project.yml not found in $PROJECT_DIR!"
    exit 1
else
    echo "Found project.yml. Running XcodeGen..."
    xcodegen generate
fi

# Verifica se o Podfile existe antes de rodar pod install
if [ ! -f "$PROJECT_DIR/Podfile" ]; then
    echo "Error: Podfile not found in $PROJECT_DIR!"
    exit 1
else
    echo "Found Podfile. Installing dependencies..."
    pod install
fi

echo "Installation complete! You can now open the workspace and start developing."
