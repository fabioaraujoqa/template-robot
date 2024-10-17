*** Settings ***
Documentation    Ações e elementos da pagina de login

Library           Browser
Resource    ../resources/base.resource

*** Variables ***
${USUARIO}    id=Username
${SENHA}    id=Password
${BOTAO_LOGIN}    id=login-button

*** Keywords ***
Preencher login
    [Arguments]    ${user}    ${senha}
    Fill Text    ${USUARIO}    ${user}
    Fill Text    ${SENHA}    ${senha}
    Click     ${BOTAO_LOGIN}