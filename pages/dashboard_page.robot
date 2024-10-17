*** Settings ***
Documentation    Ações e elementos da pagina de login

Library           Browser
Resource    ../resources/base.resource

*** Variables ***
${H2_TITLE}    css=.text-left

*** Keywords ***
Validar texto de boas vindas
    Wait For Elements State    ${H2_TITLE}    visible    5s