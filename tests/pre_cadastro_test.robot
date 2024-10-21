*** Settings ***
Documentation    Testes do pré cadastro no site edukee
Library        Browser
Resource        ../resources/Base.resource

Test Setup    Iniciar sessão
Test Teardown    Finalizar sessão

*** Test Cases ***
Pre cadastro com sucesso
    [Documentation]    Realiza o pré-cadastro com sucesso utilizando os dados fornecidos.
    [Tags]    cadastro
    Preencher login             teste-keeggo@keeggo.com        Keeggo@1234
    
    Fill Text       id=FirstName        Fabio 
    Fill Text       id=LastName         Araujo
    Fill Text       id=Password         Teste@123
    Fill Text       id=ConfirmPassword  ${EMPTY}
    Select Options By    id=TimeZone    value       Pacific Standard Time
    Select Options By    id=Culture     text        Inglês
    Select Options By    id=DateFormat  text        DD/MM/YYYY
    Fill Text       [id="CompanyName"]    Keeggo
    Fill Text       [id="JobTitle"]     QA
    Fill Text       id=Email            teste-keeggo@keeggo.com
    Fill Text       id=Website          https://keeggo.com
    Fill Text       id=Street1          Avenida Paulista 1001
    Fill Text       id=Street2          Jardins
    Fill Text       id=City             São Paulo
    Fill Text       id=State            SP
    Fill Text       id=Zip              01310-100
    Fill Text       id=Country          Brasil
    Fill Text       id=PhoneWork        1133333333
    Fill Text       id=PhoneMobile      11999999999
    Fill Text       id=Skype            fabio.araujo
    Fill Text       id=Twitter          fabio.araujo
    Click           [value="Continuar"]
    Sleep    5s

Preencher Pre-cadastro usando Page Objects
    [TAGS]    cadastro-page
    [Documentation]    Realiza o pré-cadastro com sucesso utilizando a keyword do Page Objects
    Preencher login             teste-keeggo@keeggo.com        Keeggo@1234
    Validar boas vindas     Olá, TESTE KEEGGO 
    Preencher Pre-cadastro
    ...    Fabio    Araujo    Teste@123    ${EMPTY}    
    ...    Pacific Standard Time    Inglês    DD/MM/YYYY    
    ...    Keeggo    QA    teste    https://keeggo.com       Avenida Paulista 1001
    ...    Jardins    São Paulo    SP    01310-100    Brasil
    ...    1133333333    11999999999    fabio.skype    fabio.twitter

Preencher Pre-cadastro usando Page Objectse massa de dados
    [TAGS]    dados
    [Documentation]    Realiza o pré-cadastro com sucesso utilizando a keyword do Page Objects e massa de dados em variáveis

   ${login}    Create Dictionary
   ...        email=teste-keeggo@keeggo.com
   ...        senha=Keeggo@1234
 
    Preencher login             ${login}[email]        ${login}[senha]
    Validar boas vindas     Olá, TESTE KEEGGO 
    Preencher Pre-cadastro
    ...    Fabio    Araujo    Teste@123    ${EMPTY}    
    ...    Pacific Standard Time    Inglês    DD/MM/YYYY    
    ...    Keeggo    QA    teste    https://keeggo.com       Avenida Paulista 1001
    ...    Jardins    São Paulo    SP    01310-100    Brasil
    ...    1133333333    11999999999    fabio.skype    fabio.twitter


Preencher Pre-cadastro usando Page Objects e data json
    [TAGS]    json
    [Documentation]    Realiza o pré-cadastro com sucesso utilizando a keyword do Page Objects e puxando dados de um json
    Preencher login             teste-keeggo@keeggo.com        Keeggo@1234
    Validar boas vindas     Olá, TESTE KEEGGO 
    
    ${data}    Get JSON Data        usuario
    Preencher Pre-cadastro
    ...    ${data}[nome]    ${data}[sobrenome]    ${data}[senha]    ${data}[confirma_senha]
    ...    ${data}[time_zone]    ${data}[idioma]    ${data}[formato_data]
    ...    ${data}[empresa]    ${data}[cargo]    ${data}[email]    ${data}[site]
    ...    ${data}[endereco1]    ${data}[endereco2]    ${data}[cidade]    ${data}[estado]
    ...    ${data}[cep]    ${data}[pais]    ${data}[tel_trabalho]    ${data}[tel_celular]
    ...    ${data}[skype]    ${data}[twitter]


 
 

    

    





    
    


