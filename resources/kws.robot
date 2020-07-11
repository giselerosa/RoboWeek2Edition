*** Settings ***

Documentation    Aqui teremos todas as palavras chaves de automação dos comportamentos

*** Keywords ***

Dado que acesso a página principal
    Go To    ${base_url} 

Quando submeto o meu email "${email}"
    Input Text       ${CAMPO_EMAIL}      ${email}
    Click Element    ${CAMPO_ENTRAR} 

Então devo ser autenticado
    Wait Until Page Contains Element    ${DIV_DASH} 
    Close Browser

Então devo ver a mensagem "${expected_message}"
    Wait Until Element Contains    ${DIV_ALERT}    ${expected_message}

### cadastro de pratos

Dado que "${produto}" é um dos meus pratos
    Set Test Variable    ${produto}

Quando faço o cadastro desse item
    Wait Until Element Is Visible       ${BOTAO_ADD}          timeout=5
    Click Element                       ${BOTAO_ADD}
    Wait Until Page Contains Element    ${CAMPO_FOTO}         5
    Choose File                         ${CAMPO_FOTO}         ${EXECDIR}/resources/images/${produto['img']}
    Input Text                          ${CAMPO_NOME}         ${produto['nome']}
    Input Text                          ${CAMPO_TIPO}         ${produto['tipo']}
    Input Text                          ${CAMPO_PRECO}        ${produto['preco']}
    Click Element                       ${BOTAO_CADASTRAR}    

Então devo ver este prato no meu dashboard
    Wait Until Element Contains    ${DIV_LISTA}    ${produto['nome']}    

