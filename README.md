# 🌱 ComposTech — Monitoramento Inteligente de Compostagem

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-Mobile-2ea44f?style=for-the-badge&logo=flutter&logoColor=white"/>
  <img src="https://img.shields.io/badge/Dart-Language-2ea44f?style=for-the-badge&logo=dart&logoColor=white"/>
  <img src="https://img.shields.io/badge/IoT-Sistemas%20Embarcados-2ea44f?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/Status-Concluído-2ea44f?style=for-the-badge"/>
</p>

---

## 🧠 Sobre o Projeto

O **ComposTech** é um aplicativo mobile desenvolvido como parte de uma **pesquisa de Iniciação Científica**, com foco no monitoramento inteligente de uma composteira e horta voltada para colégios.

O sistema integra **hardware e software**, coletando dados de sensores físicos e apresentando essas informações de forma clara para o usuário.

A aplicação recebe dados enviados por um sistema embarcado composto por **Arduino Uno** e **ESP32**, permitindo acompanhar em tempo real as condições ideais para o cultivo e manutenção da compostagem.

---

## 🎯 Objetivo

Facilitar o monitoramento de uma composteira e horta, auxiliando o usuário na tomada de decisões com base em dados como:

* 🌡️ Temperatura ambiente
* 💧 Umidade do solo
* 💧 Umidade e temperatura da área das minhocas

---

## ⚙️ Funcionamento do Sistema

O fluxo do projeto funciona da seguinte forma:

1. Sensores coletam os dados:

   * DHT11 → temperatura e umidade do ambiente
   * Higrômetro → umidade do solo

2. O Arduino Uno realiza a leitura dos sensores

3. A ESP32 recebe e transmite os dados

4. O aplicativo Flutter exibe as informações para o usuário

---

## 🚨 Sistema de Alertas

O aplicativo possui um sistema visual de alertas para a umidade do solo:

* 🟢 **Verde** → Solo ideal (regado)
* 🟠 **Laranja** → Solo parcialmente seco
* 🔴 **Vermelho** → Solo seco

Esses alertas ajudam o usuário a agir rapidamente na manutenção da horta.

---

## 📱 Telas do Aplicativo

* 🔐 **Tela de Entrada**
* 📊 **Tela de Monitoramento** (exibição dos dados em tempo real)
* ⚙️ **Tela de Configurações**

  * Informações sobre os autores da pesquisa
  * Alternância de modo claro/escuro

---

## 📱 Preview do App

<p align="center">
  <img src="https://github.com/asafemartins07/compostech/blob/main/imgs/TELA%20%2301.png" width="250"/>
  <img src="https://github.com/asafemartins07/compostech/blob/main/imgs/TELA%20%2302.png" width="250"/>
  <img src="https://github.com/asafemartins07/compostech/blob/main/imgs/TELA%20%2303.png" width="250"/>
</p>

---

## 🎨 Protótipo (Figma)

<p align="center">
  <a href="https://www.figma.com/design/HS71VfbNmRXfMnyeFgZ1We/ComposTECH?node-id=0-1&t=jKZwDYYrrkWWxzPG-1">
    <img src="https://img.shields.io/badge/Ver%20Protótipo-Figma-2ea44f?style=for-the-badge&logo=figma&logoColor=white"/>
  </a>
</p>

---

## 🛠️ Tecnologias Utilizadas

<p>
  <img src="https://img.shields.io/badge/Flutter-Framework-2ea44f?style=flat-square&logo=flutter&logoColor=white"/>
  <img src="https://img.shields.io/badge/Dart-Linguagem-2ea44f?style=flat-square&logo=dart&logoColor=white"/>
  <img src="https://img.shields.io/badge/Arduino-Hardware-2ea44f?style=flat-square&logo=arduino&logoColor=white"/>
  <img src="https://img.shields.io/badge/ESP32-IoT-2ea44f?style=flat-square"/>
</p>

---

## 🚀 Como executar o projeto

```bash
# Clone o repositório
git clone LINK_DO_REPOSITORIO

# Acesse a pasta
cd compostech

# Instale as dependências
flutter pub get

# Execute o app
flutter run
```

---

## 📅 Informações do Projeto

* 📆 Projeto desenvolvido em: 2025
* 🎓 Contexto: Iniciação Científica
* 👨‍💻 Codado por: Asafe Alves Martins, orientado pela profª Anna Flávia Fogaça

---

## 💡 Aprendizados

Durante o desenvolvimento deste projeto, foram trabalhados:

* Integração entre software mobile e hardware
* Comunicação entre microcontroladores
* Manipulação e exibição de dados em tempo real
* Desenvolvimento de interfaces com Flutter
* Aplicação prática de IoT em um contexto real

---

## 📌 Observações

Este projeto foi desenvolvido com fins acadêmicos, mas possui potencial de aplicação prática em agricultura doméstica e sustentável.

---

<p align="center">
  🌱 Tecnologia aplicada à sustentabilidade
</p>
