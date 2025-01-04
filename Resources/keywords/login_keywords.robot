*** Settings ***
Library    AppiumLibrary
Library    ../data_generator.py
Library    ImageHorizonLibrary
Resource    ../variables/variables.robot   # Referência ao arquivo de variáveis
Resource    ../locators/login_locators.robot   # Referência ao arquivo de locators


*** Keywords ***
Abrir App
    Open Application    ${REMOTE_URL}    platformName=Android    appPackage=${APP_PACKAGE}    appActivity=${APP_ACTIVITY}       noReset=true

Login - Validar tela
    Wait Until Element Is Visible       xpath=${LOGIN_TEXT_XPATH}       timeout=5

Login - Informar Email
    [Arguments]    ${email}
    Input Text    id=${logUSERNAME_FIELD_ID}    ${email}

Login - Informar Password
    [Arguments]    ${password}
    Input Text    id=${logPASSWORD_FIELD_ID}    ${password}

Login - Clicar no botão Login
    Wait Until Element Is Visible    id=${logLOGIN_BUTTON}
    Click Element    id=${logLOGIN_BUTTON}

Login - Clicar Registar Conta
    Wait Until Element Is Visible    id=${logCREATE_NEW_ACCOUNT_TV}
    Click Element    id=${logCREATE_NEW_ACCOUNT_TV}

Login - Validar Toast Enter_Your_Data
    Wait Until Page Contains Element    xpath=//*[contains(@text, "${TOAST_MESSAGE_ENTER_YOURS_DATA}")]    timeout=10

Login - Validar Toast Login_Error
    Wait Until Page Contains Element    xpath=//*[contains(@text, "${TOAST_MESSAGE_LOGIN_ERROR}")]    timeout=10

Login - Validar Login
    Wait Until Page Contains Element   xpath=${LOGIN_SUCESSFUL_TV}    timeout=15

Fechar App
    Close Application