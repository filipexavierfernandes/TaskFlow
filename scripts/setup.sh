#!/bin/bash

# Definir nome do projeto
PROJECT_NAME="TaskFlowApp"

# Inicializa o repositório git
git init

# Cria o diretório principal do projeto
mkdir -p $PROJECT_NAME

# Cria o diretório para o módulo e o app
mkdir -p $PROJECT_NAME/TaskFlowApp/Sources
mkdir -p $PROJECT_NAME/TaskFlowModule/Sources
mkdir -p $PROJECT_NAME/SettingsModule/Sources

# Cria o arquivo project.yml para o XcodeGen
cat <<EOT > $PROJECT_NAME/project.yml
name: TaskFlowApp
options:
  bundleIdPrefix: com.seuusuario
  deploymentTarget:
    iOS: '12.0'
workspace: $PROJECT_NAME.xcworkspace
targets:
  TaskFlowApp:
    type: application
    platform: iOS
    sources: [TaskFlowApp/Sources]
    resources: [TaskFlowApp/Resources]

  TaskFlowModule:
    type: framework
    platform: iOS
    sources: [TaskFlowModule/Sources]
    dependencies:
      - package: https://github.com/SnapKit/SnapKit.git

  SettingsModule:
    type: framework
    platform: iOS
    sources: [SettingsModule/Sources]
EOT

# Cria o arquivo Podfile
cat <<EOT > $PROJECT_NAME/Podfile
platform :ios, '12.0'
use_frameworks!

target 'TaskFlowApp' do
  pod 'SnapKit'
end
EOT

# Cria arquivos iniciais do README.md e CONTRIBUTING.md
cat <<EOT > $PROJECT_NAME/README.md
# TaskFlowApp
A sample app to demonstrate modularization and different architectures in Swift.
EOT

cat <<EOT > $PROJECT_NAME/CONTRIBUTING.md
# Contributing
Feel free to submit a pull request! Please make sure to follow the Git Flow guidelines.
EOT

# Inicializa o repositório Git
cd $PROJECT_NAME
git add .
git commit -m "Initial project setup"

echo "Project setup complete!"
