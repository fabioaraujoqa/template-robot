*** Settings ***
Documentation    Testes de login no site edukee
Library        Browser
Resource        ../resources/Base.resource

Test Setup    Iniciar sessão
Test Teardown    Finalizar sessão

*** Variables ***
${email}        fabio.araujo@keeggo.com
${senha}        Fff@2020

*** Test Cases ***
Login com sucesso sem reaproveitamento
    [Tags]    pos
    Fill Text        id=Username        ${USUARIO}
    Fill Text       id=Password        ${SENHA}
    Click       id=login-button
    Wait For Elements State    css=.text-left    visible    5s  
    Get Text    css=.text-left   contains    Olá, TESTE KEEGGO

Login usando keyword customizado e variável de ambiente
    [Tags]    key     
    Preencher login             ${USUARIO}        ${SENHA}  
    Validar boas vindas    Conquistas recentes
    
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




