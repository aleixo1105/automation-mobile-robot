*** Settings ***
Library    AppiumLibrary
Resource    ../Resources/keywords/login_keywords.robot   # Referência ao arquivo de variáveis
Resource    ../Resources/keywords/register_keywords.robot   # Referência ao arquivo de variáveis

*** Test Cases ***

Criar um cadastro
    #Gerar Dados Aleatorios para cadastro
    ${nome} =        Gerar Nome
    ${telefone} =    Gerar Telefone
    ${email} =       Gerar Email
    ${senha} =       Gerar Senha

    # Armazenar os dados nas variáveis globais
    Set Suite Variable    ${NOME}       ${nome}
    Set Suite Variable    ${SENHA}      ${senha}
    Set Suite Variable    ${EMAIL}      ${email}
    Set Suite Variable    ${TELEFONE}   ${telefone}

    Abrir App
    Login - Clicar Registar Conta
    Register - Validar tela
    Register - Informar Nome                ${nome}
    Register - Informar Phone Number        ${telefone}
    Register - Informar Email               ${email}
    Register - Informar Password            ${senha}
    Register - Clicar no botão Register
    Register - Validar Toast Registration Successful

Realizar Login com um novo cadastro
    Abrir App
    Login - Validar tela
    Login - Informar Email          ${email}
    Login - Informar Password       ${senha}
    Login - Clicar no botão Login
    Login - Validar Login
    Fechar App


Realizar Login com um cadastro inexistente
    #Gerar Dados Aleatorios
    ${email} =       Gerar Email
    ${senha} =       Gerar Senha

    Abrir App
    Login - Validar tela
    Login - Informar Email                ${email}
    Login - Informar Password             ${senha}
    Login - Clicar no botão Login
    Login - Validar Toast Login_Error
    Fechar App