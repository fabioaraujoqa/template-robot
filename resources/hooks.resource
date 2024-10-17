*** Settings ***
Library       Browser
Resource      ./base.resource

*** Keywords ***
Iniciar sessão
    New Browser    browser=webkit   headless=False  
    New Page    ${URL_BASE}

Finalizar sessão
    Close Browser