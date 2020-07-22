*** Settings ***

Documentation    Testes de Login no NinjaChef Mobile

Resource    ../resources/base.robot

Test Setup       Open Session
Test Teardown    Close Session

*** Test Cases ***

Acessar o cardápio
    Dado que desejo comer "Massas"
    Quando submeto meu email "giselefominha@gmail.com"
    Então devo ver a lista de pratos por tipo


*** Keywords ***

Dado que desejo comer "${prato}"
    Set Test Variable    ${prato}

Quando submeto meu email "${email}"
    Wait Until Page Contains    Buscar Prato                   10
    Input Text                  accessibility_id=emailInput    ${email}
    Input Text                  accessibility_id=plateInput    ${prato}
    Click Text                  Buscar Prato

Então devo ver a lista de pratos por tipo
    Wait Until Page Contains    Fome de ${prato}

