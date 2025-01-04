# Projeto de Automação Mobile com Robot Framework e Appium

Este é um projeto de automação de testes para aplicações mobile utilizando o **Robot Framework** integrado ao **Appium**. O objetivo é validar funcionalidades de um aplicativo Android, incluindo processos como cadastro, login e verificação de mensagens exibidas.

## Estrutura do Projeto

O projeto segue uma estrutura baseada em **Page Objects** para facilitar a manutenção e reutilização de código.

```
automation-mobile-robot/
├── Tests/
│   ├── login_tests.robot
│   └── register_tests.robot
├── Resources/
│   ├── keywords/
│   │   ├── login_keywords.robot
│   │   └── register_keywords.robot
│   ├── locators/
│   │   ├── login_locators.robot
│   │   └── register_locators.py
│   ├── variables/
│   │   └── variables.robot
│   └── data_generator.py
├── baixar_criar_emulador.txt
└── README.md

```

### Descrição das Pastas

- **`tests/`**: Contém os arquivos de casos de teste escritos em Robot Framework.
- **`keywords/`**: Contém keywords reutilizáveis organizadas por tela.
- **`locators/`**: Contém os locators utilizados pelos testes, separados por tela.
- **`resources/`**: Inclui arquivos de configuração e funções personalizadas.


# Ferramentas e Bibliotecas

O projeto de automação utiliza as seguintes ferramentas e bibliotecas:
- **Robot Framework**: Framework de automação baseado em palavras-chave.
- **Appium**: Ferramenta para automação de testes em dispositivos móveis.
- **Python**: Linguagem utilizada para implementar funções auxiliares.
- **Android SDK**: Necessário para interação com dispositivos/emuladores Android.
- **Faker**: Biblioteca Python utilizada para gerar dados fictícios, como nomes, emails, telefones, entre outros.


## Configuração do Ambiente

1. Dispositivos utilizados:

   Devices Virtualizaods no Android Stdudio:
   - Nome:** Pixel4API33
   - Dispositivo:** Pixel 4
   - API Level:** 33 (Android 13)
   - Tipo de API:** Google APIs
   - Resolução de Tela:** 1080 x 2280
   - Tamanho de RAM:** 2048 MB
   - Armazenamento Interno:** 16 GB

   Devices Fisicos:
    - Samsung Galaxy S20 FE   (Android 14)
    - Samsung Galaxy A50      (Android 11) 

2. Download e criação do Emulador Pixel4 API-33 (Conforme o requisito)

   - Execute os comandos listados no arquivo baixar_criar_emulador.txt:
         sdkmanager "system-images;android-33;google_apis;x86_64"  
         avdmanager create avd -n Pixel4API33 -k "system-images;android-33;google_apis;x86_64" -d "pixel_4"

3. Configure o Appium:
   - Certifique-se de que o Appium está configurado e funcionando no `http://127.0.0.1:4723/wd/hub`.

4. Configure as variáveis no arquivo `resources/Variables.robot`:

```robot
*** Variables ***
${REMOTE_URL}       http://127.0.0.1:4723/wd/hub
${PLATFORM_NAME}    Android
${APP_PACKAGE}      com.example.vamsi.login
${APP_ACTIVITY}     .MainActivity
```

5. Configure o caminho do Android SDK no sistema operacional:

- Adicione o caminho do SDK à variável de ambiente `PATH`.
- Certifique-se de que o comando `adb` está funcionando no terminal.

## Executando os Testes

**Pré-requisito:** Certifique-se de que o emulador ou dispositivo físico está configurado e conectado antes de executar os testes.

1. Inicie o servidor Appium:

```bash
appium
```

2. Conecte um dispositivo ou inicie um emulador Android.

3. Execute os testes:

```bash
robot -d results tests/
robot --outputdir resultados/ tests/      #Para Gerar os relatorio na pasta #No Diretorio Resultados abra o arquivo report.html em qualquer navegador 


```

Os resultados serão gerados na pasta `results` com relatórios detalhados.

### Casos de Testes:

### Criar novo usuario 
    Abrir App
    Login - Clicar Registar Conta
    Register - Validar Tela
    Register - Informar Nome                    #Gerando um novo nome
    Register - Informar Phone Number            #Gerando um novo numero
    Register - Informar Email                   #Gerando um novo email
    Register - Informar Password                #Gerando um novo senha
    Register - Clicar no Botão Register
    Register - Validar Toast Registration Successful

### Login com o novo Usuário
    Abrir App
    Login - Validar Tela
    Login - Informar Email                     #Usando o email gerado no caso de teste anterior
    Login - Informar Password                  #Usando a senha gerado no caso de teste anterior
    Login - Clicar no Botão Login
    Login - Validar Login Bem-Sucedido


###  Login com usuario inexistente
    Abrir App
    Login - Validar Tela
    Login - Informar Email                    #Gerando um novo email
    Login - Informar Password                 #Gerando uma nova senha
    Login - Clicar no Botão Login
    Login - Validar Toast Login_Error





