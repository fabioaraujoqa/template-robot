*** Settings ***
Documentation    Arquivo que contém os hooks de inicialização e finalização de sessão

Resource        Base.resource

*** Keywords ***
Iniciar sessão
    New Browser    browser=webkit   headless=False  
    New Page    ${BASE_URL}
    Set Viewport Size    1920    1080

Finalizar sessão
    Take Screenshot
    Close Browser