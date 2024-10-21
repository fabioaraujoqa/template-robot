*** Settings ***
Documentation    Testes de login no site edukee
Library        Browser
Resource        ../resources/Base.resource

Test Setup    Iniciar sessão
Test Teardown    Finalizar sessão

*** Test Cases ***
Login com sucesso sem reaproveitamento
    [Tags]    positivo
    New Page    https://edukee.keeggo.com/
    Fill Text        id=Username        fabio.araujo@keeggo.com
    Fill Text       id=Password        Fff@2020
    Click       id=login-button
    Wait For Elements State    css=.text-left    visible    5s  
    Get Text    css=.text-left   contains    Conquistas recentes

Login usando keyword customizado
    [Tags]    key     
    Preencher login             fabio.araujo@keeggo.com        Fff@2020   
    Get Text    css=.text-left   contains    Conquistas recentes
    
Login com sucesso usando massa de dados
    [Tags]    positivo
    ${user}      Usuario
    Fill Text    id=Username    ${user}[email]
    Fill Text    id=Password       ${user}[senha]
    Click     id=login-button
    Wait For Elements State    css=.text-left    visible    5s  
    Get Text    css=.text-left   contains    Conquistas recentes

Login com usuário inexistente
    [Tags]    negativo
    ${user}      Usuario
    Fill Text    id=Username    ${user}[email]
    Fill Text    id=Password       teste@123
    Click     id=login-button  
    Get Text    css=.login-failed   contains    Logon falhado, tente novamente

Login com campos vazios
    [Tags]    vazio
    Fill Text    id=Username    ${EMPTY}
    Fill Text    id=Password       teste@123
    Click     id=login-button  
    #Get Text    css=[action="/account/Login"]    contains    Invalid entry, required

Tentativa de login com dados inválidos
    [Tags]   massivo
    [Template]    Login com dados inválidos
    ${empty}               ${empty}        #dois campos vazios    
    fabio@gmail.com        ${empty}        #senha vazia
    ${empty}               teste@123       #email vazio
    Fabio.araujo           Fff@2020        #email com formato invalido
    fabio@teste.com        teste           #senha invalida
    fabio@teste.com        teste@123       #email e senha invalidos


***Keywords***

Login com dados inválidos
    [Arguments]    ${email}    ${senha}   
    Fill Text    id=Username    ${email}
    Fill Text    id=Password       ${senha}
    Click     id=login-button  
    #Get Text    css=.login-failed   contains    ${mensagem}
    Take Screenshot




