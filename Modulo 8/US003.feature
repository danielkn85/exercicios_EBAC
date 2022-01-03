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

Scenario: Cadastro sem todos os dados obrigatórios
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



