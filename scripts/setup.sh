#!/bin/bash

# Definir nome do projeto
PROJECT_NAME="TaskFlowApp"

# Inicializa o repositório git
git init

# Cria o diretório principal do projeto
mkdir -p $PROJECT_NAME

# Cria o diretório para o módulo e o app
mkdir -p $PROJECT_NAME/Sources
mkdir -p $PROJECT_NAME/TaskFlowModule/Sources
mkdir -p $PROJECT_NAME/SettingsModule/Sources

# Cria o arquivo project.yml para o XcodeGen
cat <<EOT > $PROJECT_NAME/project.yml
name: TaskFlowApp
options:
  bundleIdPrefix: com.seuusuario
  deploymentTarget:
    iOS: '12.0'
workspace:
  name: TaskFlowApp
  projects:
    - TaskFlowApp.xcodeproj

packages:
  SnapKit:
    url: https://github.com/SnapKit/SnapKit.git
    from: 5.6.0

targets:
  TaskFlowApp:
    type: application
    platform: iOS
    sources: [TaskFlowApp/Sources]
    resources: [TaskFlowApp/Resources]
    dependencies:
      - target: TaskFlowModule
      - target: SettingsModule

  TaskFlowModule:
    type: framework
    platform: iOS
    sources: [TaskFlowModule/Sources]
    dependencies:
      - package: SnapKit

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

# Inicializa o repositório Git
cd $PROJECT_NAME
git add .
git commit -m "Initial project setup"

echo "Project setup complete!"

# Criar arquivos AppDelegate e módulos, se não existirem
echo "Criando arquivos básicos para o projeto..."

if [ ! -f TaskFlowApp/Sources/AppDelegate.swift ]; then
  mkdir -p TaskFlowApp/Sources
  cat <<EOT > TaskFlowApp/Sources/AppDelegate.swift
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
}
EOT
fi

if [ ! -f TaskFlowModule/Sources/TaskFlowModule.swift ]; then
  mkdir -p TaskFlowModule/Sources
  cat <<EOT > TaskFlowModule/Sources/TaskFlowModule.swift
import Foundation

public class TaskFlowModule {
    public init() {}
}
EOT
fi

if [ ! -f SettingsModule/Sources/SettingsModule.swift ]; then
  mkdir -p SettingsModule/Sources
  cat <<EOT > SettingsModule/Sources/SettingsModule.swift
import Foundation

public class SettingsModule {
    public init() {}
}
EOT
fi
