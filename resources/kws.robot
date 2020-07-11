*** Settings ***

Documentation    Aqui teremos todas as palavras chaves de automação dos comportamentos

*** Keywords ***

Dado que acesso a página principal
    Go To    http://ninjachef-qaninja-io.umbler.net/    

Quando submeto o meu email "${email}"
    Input Text       id:email                   ${email}
    Click Element    css:button[type=submit]

Então devo ser autenticado
    Wait Until Page Contains Element    class:dashboard
    Close Browser

Então devo ver a mensagem "{expected_message}"
    Wait Until Element Contains    class:alert    {expected_message}

### cadastro de pratos

Dado que "${produto}" é um dos meus pratos
    Set Test Variable    ${produto}

Quando faço o cadastro desse item
    Wait Until Element Is Visible       class:btn-add              timeout=5
    Click Element                       class:btn-add
    Wait Until Page Contains Element    css:input[id=thumbnail]    5
    Choose File                         css:input[id=thumbnail]    ${EXECDIR}/resources/images/${produto['img']}
    Input Text                          id:name                    ${produto['nome']}
    Input Text                          id:plate                   ${produto['tipo']}
    Input Text                          id:price                   ${produto['preco']}
    Click Element                       class:btn-cadastrar        

Então devo ver este prato no meu dashboard
    Wait Until Element Contains    class:product-list    ${produto['nome']}    

