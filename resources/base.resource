***Settings***
Documentation    Arquivo de configuração de variáveis e recursos genéricos

Library        Browser
Library        libs/usuario.py
Library        JSONLibrary
Resource       Hooks.resource
Resource       ../pages/login_page.robot
Resource       ../pages/pre_cadastro_page.robot
Resource       ../pages/dashboard_page.robot

*** Variables ***
${URL_BASE}        https://edukee.keeggo.com/


*** Keywords ***
get json data
    [Arguments]    ${file_name}
    ${data}    Load JSON From File        ${EXECDIR}/resources/data/${file_name}.json
    [return]    ${data}