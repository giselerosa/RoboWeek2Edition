*** Settings ***

Documentation    Aqui temos a estrutura básica do projeto, o Selenium é importado aqui 

Library    SeleniumLibrary
Library    RequestsLibrary
Library    OperatingSystem

Resource    kws.robot
Resource    helpers.robot
Resource    elements.robot

*** Variables ***

${base_url}    http://ninjachef-qaninja-io.umbler.net/ 
*** Keywords ***

Open Session
    Open Browser    about:blank    chrome

Close Session
    Capture Page Screenshot    
    Close Browser