*** Settings ***
Library    AndroidUiAutomation
Library    OperatingSystem
Library    String

*** Variables ***
${ARQUIVO}    mensagenzinhas.txt
${PACKAGE}    com.whatsapp

*** Keywords ***
Conectar com dispositivo
    Connect Device   RQCWB00CSZH

Abrir whastapp
    Open App    ${PACKAGE}

Selecionar o contato
    [Arguments]     ${nome}
    Tap By Text        ${nome}


Spamar um txt completo
    ${conteudo}=    Get File          ${ARQUIVO}
    @{linhas}=      Split To Lines    ${conteudo}

    FOR    ${linha}    IN    @{linhas}
        # Ignora linhas vazias (opcional)
        Run Keyword Unless    '${linha}' == ''    Enviar mensagem    ${linha}
    END
    
Enviar mensagem
    [Arguments]     ${mensagem}
    Tap Element     //android.widget.EditText[@resource-id="com.whatsapp:id/entry"]
    Input Text      //android.widget.EditText[@resource-id="com.whatsapp:id/entry"]     ${mensagem}
    Tap Element     //android.widget.ImageButton[@content-desc="Enviar"]

*** Test Cases ***
Spamar um txt inteiro no whatsapp do meu amigo viado
    Conectar com dispositivo
    Abrir whastapp
    Selecionar o contato  Pedro All Risk
    Spamar um txt completo
