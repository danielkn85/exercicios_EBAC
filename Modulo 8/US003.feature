Feature: Tela de Cadastro - Checkout
    Como cliente da EBAC-SHOP
    Quero fazer concluir meu cadastro
    Para finalizar minha compra

    Background:
        Given que eu acesse a página de cadastro do portal EBAC

    Scenario: Cadastro com todos os dados obrigatórios
        When o usuário inclui no cadastro <nome> "José"
        And inclui <sobrenome> "Alencar"
        And <pais> "Brasil"
        And <endereco> "Rua dos Bobos, 0"
        And <CEP> "12345678"
        And <telefone> "+55419912345678"
        And <email> "zealencar@ebac.com.br"
        Then o cadastro é aceito pelo sistema e concluído
        And uma <mensagemcadastro> é exibida: "Cadastro concluído com sucesso!"

    Scenario: Cadastro não contém nome
        When o usuário inclui cadastro <sobrenome>, <pais>, <endereco>, <CEP>, <telefone>, <email>,
        But não inclui <nome>
        Then o cadastro é rejeitado pelo sistema
        And uma <mensagemcadastro> é exibida: "Por favor insira todos os campos obrigatórios (*)"

    Scenario: Cadastro não contém sobrenome
        When o usuário inclui cadastro <nome>, <pais>, <endereco>, <CEP>, <telefone>, <email>,
        But não inclui <sobrenome>
        Then o cadastro é rejeitado pelo sistema
        And uma <mensagemcadastro> é exibida: "Por favor insira todos os campos obrigatórios (*)"

    Scenario: Cadastro não contém país
        When o usuário inclui cadastro <nome>, <sobrenome>, <endereco>, <CEP>, <telefone>, <email>,
        But não inclui <pais>
        Then o cadastro é rejeitado pelo sistema
        And uma <mensagemcadastro> é exibida: "Por favor insira todos os campos obrigatórios (*)"

    Scenario: Cadastro não contém endereço
        When o usuário inclui cadastro <nome>, <sobrenome>, <pais>, <CEP>, <telefone>, <email>,
        But não inclui <endereco>
        Then o cadastro é rejeitado pelo sistema
        And uma <mensagemcadastro> é exibida: "Por favor insira todos os campos obrigatórios (*)"

    Scenario: Cadastro não contém CEP
        When o usuário inclui cadastro <nome>, <sobrenome>, <pais>, <endereco>, <telefone>, <email>,
        But não inclui <CEP>
        Then o cadastro é rejeitado pelo sistema
        And uma <mensagemcadastro> é exibida: "Por favor insira todos os campos obrigatórios (*)"

    Scenario: Cadastro não contém telefone
        When o usuário inclui cadastro <nome>, <sobrenome>, <pais>, <endereco>, <CEP>, <email>,
        But não inclui <telefone>
        Then o cadastro é rejeitado pelo sistema
        And uma <mensagemcadastro> é exibida: "Por favor insira todos os campos obrigatórios (*)"

    Scenario: Cadastro não contém email
        When o usuário inclui cadastro <nome>, <sobrenome>, <pais>, <endereco>, <CEP>, <telefone>,
        But não inclui <email>
        Then o cadastro é rejeitado pelo sistema
        And uma <mensagemcadastro> é exibida: "Por favor insira todos os campos obrigatórios (*)"

    Scenario: Cadastro não contém mais de um campo obrigatório
        When o usuário inclui no cadastro <nome> "Maria"
        And <telefone> "+55219123456789"
        And <pais> "Brasil"
        And <email> "mariazinha@ebac.com.br"
        But não inclui <sobrenome> ""
        And não inclui <endereco> ""
        And não inclui <CEP> ""
        Then o cadastro é rejeitado pelo sistema
        And uma <mensagemcadastro> é exibida: "Por favor insira todos os campos obrigatórios (*)"

    Scenario: Cadastro com formato inválido de e-mail
        When o usuário inclui no cadastro <nome> "João"
        And inclui <sobrenome> "Roberto"
        And <pais> "Brasil"
        And <endereco> "Rua dos Bobos, 01"
        And <CEP> "12345678"
        And <telefone> "+554184752682"
        And <email> "joaobob"
        Then o cadastro é rejeitado pelo sistema
        And uma <mensagemcadastro> é exibida: "Formato de e-mail inválido"

    Scenario Outline: Cadastro de Clientes da loja da EBAC
        When o usuário preenche no cadastro os dados obrigatórios
        And inclui <nome>, <sobrenome>, <pais>, <endereco>, <CEP>, <telefone>
        And o <email> contém o formato apropriado
        Then o cadastro é finalizado
        And uma <mensagemcadastro> é exibida

        Examples:
            | nome     | sobrenome  | pais     | endereco            | CEP        | telefone          | email                       | mensagemcadastro                                    |
            | "José"   | "Alencar"  | "Brasil" | "Rua dos Bobos, 0"  | "12345678" | "+55419912345678" | "zealencar@ebac.com.br"     | "Cadastro concluído com sucesso!"                   |
            | "Pedro"  | "Rocha"    | "Brasil" | "Rua dos Bobos, 02" | "12345678" | "+55419914523145" | "procha@ebac.com.br"        | "Cadastro concluído com sucesso!"                   |
            | ""       | "Coimbra"  | "Brasil" | "Rua dos Bobos, 03" | "12345678" | "+55419998765464" | "davic@ebac.com.br"         | "Por favor insira todos os campos obrigatórios (*)" |
            | "Luis"   | "Santos"   | ""       | "Rua dos Bobos, 04" | "12345678" | "+55419998734754" | "luisss@ebac.com.br"        | "Por favor insira todos os campos obrigatórios (*)" |
            | "Marina" | "Silva"    | "Brasil" | ""                  | "12345678" | "+55315474515475" | "silvamarina@ebac.com.br"   | "Por favor insira todos os campos obrigatórios (*)" |
            | "Cleber" | "Souza"    | "Brasil" | "Rua dos Bobos, 05" | ""         | "+55419998734754" | "clebinho@ebac.com.br"      | "Por favor insira todos os campos obrigatórios (*)" |
            | "Helena" | "Oliveira" | "Brasil" | "Rua dos Bobos, 06" | "12345678" | ""                | "helenoliveira@ebac.com.br" | "Por favor insira todos os campos obrigatórios (*)" |
            | "Joana"  | "Campos"   | "Brasil" | "Rua dos Bobos, 07" | "12345678" | "+55929123456783" | ""                          | "Por favor insira todos os campos obrigatórios (*)" |
            | "Maria"  | ""         | "Brasil" | ""                  | ""         | "+55219123456789" | "mariazinha@ebac.com.br"    | "Por favor insira todos os campos obrigatórios (*)" |
            | "João"   | "Roberto"  | "Brasil" | "Rua dos Bobos, 08" | "12345678" | "+554184752682"   | "joaobob"                   | "Formato de e-mail inválido"                        |
