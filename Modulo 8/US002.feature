Feature: Tela de selecao de produtos
    Como cliente da EBAC-SHOP
    Quero fazer o login (autenticação) na plataforma
    Para visualizar meus pedidos

    Background:
        Given eu acessar a página de autenticação do portal EBAC

    Scenario: Ao inserir dados válidos
        When inserir o nome de <usuario> "joao@ebac.com.br"
        And a <senha> "ebac@123"
        And clicar no botão de login
        Then o usuário deve ser direcionado para a tela de checkout
        And uma mensagem de boas vindas deve ser exibida: "Olá, João"

    Scenario: Ao inserir um dos campos inválidos
        When inserir o nome de <usuario> "mariazinha@ebac.com.br"
        E a <senha> "123456"
        E clicar no botão de login
        Then uma mensagem de alerta deve ser exibida: "Usuário ou senha inválidos"

    Scenario Outline: Autenticação de múltiplos usuários
        When inserir o nome de <usuario>
        And a <senha>
        And clicar no botão de login
        Then uma <mensagem> deve ser exibida

        Examples:
            | usuario                     | senha             | mensagem                     |
            | "joao@ebac.com.br"          | "ebac@123"        | "Olá, João"                  |
            | "mariazinha@ebac.com.br"    | "teste@123"       | "Olá, Maria"                 |
            | "mariazinha@ebac.com.br"    | "123456"          | "Usuário ou senha inválidos" |
            | "fabio@ebac.com.br"         | "qa!!123"         | "Olá, Fábio"                 |
            | "weverton@ebac.com.br"      | "weverton@21"     | "Olá, Weverton"              |
            | "mayke@ebac.com.br"         | "mayke!!12"       | "Olá, Mayke"                 |
            | "ggomez@ebac.com.br"        | "p4r4?gu410"      | "Olá, Gustavo"               |
            | "luan@ebac.com.br"          | "luan13?"         | "Olá, Luan"                  |
            | "jpiquerez@ebac.com.br"     | "joaquin@123"     | "Olá, Joaquin"               |
            | "danilo@ebac.com.br"        | "cria@da@b4s3"    | "Olá, Danilo"                |
            | "zerafael@ebac.com.br"      | "zerafa123!!"     | "Olá, José"                  |
            | "raphaveiga@ebac.com.br"    | "raphav@123"      | "Olá, Raphael"               |
            | "dudu@ebac.com.br"          | "baixola4+3"      | "Olá, Eduardo"               |
            | "gscarpa@ebac.com.br"       | "gustavo321"      | "Olá, Gustavo"               |
            | "rony@ebac.com.br"          | "notificacao@123" | "Olá, Ronielson"             |
            | "gabigol@ebac.com.br"       | "perdiafinal"     | "Usuário ou senha inválidos" |
            | "andreas@ebac.com.br"       | "papainoel"       | "Usuário ou senha inválidos" |
            | "renatocarioca@ebac.com.br" | "futevolei"       | "Usuário ou senha inválidos" |
