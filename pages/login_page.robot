*** Settings ***
Documentation    Ações e elementos da pagina de login

Resource    ../resources/Base.resource

*** Variables ***
${CAMPO_USUARIO}    id=Username
${CAMPO_SENHA}    id=Password
${BOTAO_LOGIN}    id=login-button

*** Keywords ***
Navegar para login
    Go To    ${BASE_URL}account/login

Preencher login
    [Arguments]    ${usuario}    ${senha}
    Fill Text    ${CAMPO_USUARIO}    ${usuario}
    Fill Text    ${CAMPO_SENHA}    ${senha}
    Click     ${BOTAO_LOGIN}