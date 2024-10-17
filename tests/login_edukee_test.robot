*** Settings ***
Documentation    Testes de login no site edukee
Library     Browser
Resource    ../resources/base.resource
Resource    ../pages/login_page.robot

*** Test Cases ***
Login com sucesso sem reaproveitamento
    [Tags]    positivo
    New Page    https://edukee.keeggo.com/
    Fill Text    id=Username    fabio.araujo@keeggo.com
    Fill Text    id=Password       Fff@2020
    Click     id=login-button
    Wait For Elements State    css=.text-left    visible    5s  
    Get Text    css=.text-left   contains    Conquistas recentes

Login usando keyword customizado
    [Tags]    key
    Iniciar sessão
    Sleep      10s
    Preencher login    user=fabio.araujo@keeggo.com    senha=Fff@2020    
    Get Text    css=.text-left   contains    Conquistas recentes
    
Login com sucesso usando massa de dados
    [Tags]    positivo
    ${user}      Usuario
    Iniciar sessão
    Fill Text    id=Username    ${user}[email]
    Fill Text    id=Password       ${user}[senha]
    Click     id=login-button
    Wait For Elements State    css=.text-left    visible    5s  
    Get Text    css=.text-left   contains    Conquistas recentes

Login com dados inválidos
    [Tags]    negativo
    Iniciar sessão
    Fill Text    id=Username    fabio@araujo.com
    Fill Text    id=Password       teste@123
    Click     id=login-button  
    Get Text    css=.login-failed   contains    Logon falhado, tente novamente

Login com campos vazios
    [Tags]    vazio
    Iniciar sessão
    Fill Text    id=Username    ${EMPTY}
    Fill Text    id=Password       teste@123
    Click     id=login-button  
    #Get Text    css=[action="/account/Login"]    contains    Invalid entry, required



