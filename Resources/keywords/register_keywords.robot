*** Settings ***
Library    AppiumLibrary
Library    ImageHorizonLibrary
Resource    ../variables/variables.robot   # Referência ao arquivo de variáveis
Resource    ../locators/register_locators.robot   # Referência ao arquivo de locators


*** Keywords ***
Register - Validar tela
    Wait Until Element Is Visible       xpath=${REGISTRATION_TEXT_XPATH}       timeout=5

Register - Informar Nome
    [Arguments]    ${nome}
    Input Text    id=${RegNAME_FIELD_ID}    ${nome}

Register - Informar Phone Number
    [Arguments]    ${phone_number}
    Input Text    id=${RegPHONE_NUMBER_FIELD_ID}    ${phone_number}

Register - Informar Email
    [Arguments]    ${gmail}
    Input Text    id=${RegEMAIL_FIELD_ID}    ${gmail}

Register - Informar Password
    [Arguments]    ${password}
    Input Text    id=${RegPASSWORD_FIELD_ID}    ${password}

Register - Clicar no botão Register
    Click Element    id=${RegREGISTER_BUTTON}

Register - Clicar no botão Login
    Click Element    id=${RegLOGIN_BUTTON}

Register - Validar Toast Fill_All_Details
    Wait Until Page Contains Element    xpath=//*[contains(@text, "${TOAST_MESSAGE_FILL_ALL_DETAILS}")]    timeout=10

Register - Validar Toast Registration Successful
    Wait Until Page Contains Element    xpath=//*[contains(@text, "${TOAST_MESSAGE_REGISTRATION_SUCESSFUL}")]    timeout=10