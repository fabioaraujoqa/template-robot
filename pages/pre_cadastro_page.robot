*** Settings ***
Documentation    Ações e elementos da pagina de Pré-Cadastro Edukee
Resource         ../resources/Base.resource

*** Variables ***
${LABEL_BOAS_VINDAS}        [class="subnav-header"]
${CAMPO_NOME}               id=FirstName
${CAMPO_SOBRENOME}          id=LastName
${CAMPO_SENHA}              id=Password
${CAMPO_CONFIRMAR_SENHA}    id=ConfirmPassword
${CAMPO_FUSO_HORARIO}       id=TimeZone
${CAMPO_CULTURA}            id=Culture
${CAMPO_FORMATO_DATA}       id=DateFormat
${CAMPO_EMPRESA}            [id="CompanyName"]
${CAMPO_CARGO}              [id="JobTitle"]
${CAMPO_EMAIL}              id=Email
${CAMPO_SITE}               id=Website
${CAMPO_ENDERECO1}          id=Street1
${CAMPO_ENDERECO2}          id=Street2
${CAMPO_CIDADE}             id=City
${CAMPO_ESTADO}             id=State
${CAMPO_CEP}                id=Zip
${CAMPO_PAIS}               id=Country
${CAMPO_TEL_TRABALHO}       id=PhoneWork
${CAMPO_CELULAR}            id=PhoneMobile
${CAMPO_SKYPE}              id=Skype
${CAMPO_TWITTER}            id=Twitter
${BOTAO_CONTINUAR}          [value="Continuar"]

*** Keywords ***
Preencher Pre-cadastro
    [Documentation]    Realiza o pré-cadastro com sucesso utilizando os dados fornecidos.
    [Arguments]       ${nome}    ${sobrenome}    ${senha}    
    ...               ${confirmar_senha}    ${fuso_horario}    ${cultura}    
    ...               ${formato_data}    ${nome_empresa}    ${cargo}    
    ...               ${email}    ${site}    ${endereco1}    ${endereco2}    
    ...               ${cidade}    ${estado}    ${cep}    ${pais}    
    ...               ${tel_trabalho}    ${tel_celular}    ${skype}    ${twitter}
    
    Fill Text               ${CAMPO_NOME}               ${nome}     
    Fill Text               ${CAMPO_SOBRENOME}          ${sobrenome}
    Fill Text               ${CAMPO_SENHA}              ${senha}
    Fill Text               ${CAMPO_CONFIRMAR_SENHA}    ${confirmar_senha}    
    Select Options By       ${CAMPO_FUSO_HORARIO}       value    ${fuso_horario}       
    Select Options By       ${CAMPO_CULTURA}            text     ${cultura}
    Select Options By       ${CAMPO_FORMATO_DATA}       text     ${formato_data}
    Fill Text               ${CAMPO_EMPRESA}            ${nome_empresa}
    Fill Text               ${CAMPO_CARGO}              ${cargo}
    Fill Text               ${CAMPO_EMAIL}              ${email}
    Fill Text               ${CAMPO_SITE}               ${site}
    Fill Text               ${CAMPO_ENDERECO1}          ${endereco1}
    Fill Text               ${CAMPO_ENDERECO2}          ${endereco2}
    Fill Text               ${CAMPO_CIDADE}             ${cidade}
    Fill Text               ${CAMPO_ESTADO}             ${estado}
    Fill Text               ${CAMPO_CEP}                ${cep}
    Fill Text               ${CAMPO_PAIS}               ${pais}
    Fill Text               ${CAMPO_TEL_TRABALHO}       ${tel_trabalho}
    Fill Text               ${CAMPO_CELULAR}            ${tel_celular}
    Fill Text               ${CAMPO_SKYPE}              ${skype}
    Fill Text               ${CAMPO_TWITTER}            ${twitter}
    Click                   ${BOTAO_CONTINUAR}

Validar boas vindas
    [Documentation]    Valida a mensagem de boas vindas exibida na tela de pré-cadastro.
    [Arguments]        ${mensagem}
    Get Text    ${LABEL_BOAS_VINDAS}   contains    ${mensagem}             
    
