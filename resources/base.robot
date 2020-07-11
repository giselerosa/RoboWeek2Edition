*** Settings ***

Documentation    Aqui temos a estrutura básica do projeto, o Selenium é importado aqui 

Library    SeleniumLibrary

Resource    kws.robot

*** Keywords ***

Open Session
    Open Browser    about:blank    chrome

Close Session
    Close Browser