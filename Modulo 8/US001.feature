Feature: Tela de seleção de produtos
    Como cliente da EBAC-SHOP
    Quero configurar meu produto de acordo com meu tamanho e gosto
    E escolher a quantidade
    Para depois inserir no carrinho

    Background:
        Given que eu acesse área de configuração de produto da Loja da EBAC

    Scenario: Ao clicar no botão “Limpar” deve voltar ao estado original
        When o usuário clicar no botao Limpar
        Then qualquer seleção de cor, tamanho e/ou quantidade deve ser retirada
        And a seleção retorna ao estado inicial

    Scenario: Ao clicar no botão “Limpar” a seleção não retorna ao estado original
        When o usuário clicar no botao Limpar
        And a seleção de cor, tamanho e/ou quantidade não e modificada
        Then a seleção é mantida e não retorna ao estado original


    Scenario: A seleção não contém a cor do produto
        When a cor do produto não é informada
        Then a compra não deve ser adicionada ao carrinho
        And uma mensagem de alerta deve ser exibida: "Por favor selecione a cor do produto"

    Scenario: A seleção não contém o tamanho do produto
        When o tamanho do produto não é informada
        Then a compra não deve ser adicionada ao carrinho
        And uma mensagem de alerta deve ser exibida: "Por favor selecione o tamanho do produto"

    Scenario: A seleção não contém a quantidade do produto
        When o quantidade do produto não é informada
        Then a compra não deve ser adicionada ao carrinho
        And uma mensagem de alerta deve ser exibida: "Por favor selecione a quantidade do produto"

    Scenario: Deve permitir apenas 10 produtos por venda
        When o quantidade do produto for informada
        And a quantidade informada é maior que zero
        And a quantidade informada é menor ou igual a 10
        Then a compra deve ser adicionada ao carrinho

    Scenario: Mais de 10 produtos sao adicionados ao carrinho
        When o quantidade do produto for informada
        And a quantidade informada é maior a 10
        Then a compra não deve ser adicionada ao carrinho
        And uma mensagem de alerta deve ser exibida: "Limite de produto excedido (max. 10 itens)"

    Scenario Outline: Seleções de cor, tamanho e quantidade devem ser obrigatórios
        When eu selecionar a <cor> do produto
        And selecionar o <tamanho> do produto
        And selecionar a <quantidade> do produto
        Then a compra do produto deve ser confirmada
        And o produto deve ser adicionado ao carrinho
        And uma <mensagem> de confirmação deve ser exibida: "Produto adicionado ao carrinho com sucesso!"
        But em caso falha uma <mensagem> de erro específica deve ser exibida

        Examples:
            | cor    | tamanho | quantidade | mensagem                                      |
            | 0      | XS      | 0          | "Por favor selecione a cor do produto"        |
            | 0      | XS      | 1          | "Por favor selecione a cor do produto"        |
            | 0      | XS      | 2          | "Por favor selecione a cor do produto"        |
            | 0      | XS      | 3          | "Por favor selecione a cor do produto"        |
            | 0      | XS      | 4          | "Por favor selecione a cor do produto"        |
            | 0      | XS      | 5          | "Por favor selecione a cor do produto"        |
            | 0      | XS      | 6          | "Por favor selecione a cor do produto""       |
            | 0      | XS      | 7          | "Por favor selecione a cor do produto"        |
            | 0      | XS      | 8          | "Por favor selecione a cor do produto"        |
            | 0      | XS      | 9          | "Por favor selecione a cor do produto"        |
            | 0      | XS      | 10         | "Por favor selecione a cor do produto"        |
            | 0      | XS      | 11         | "Limite de produto excedido (max. 10 itens)"  |
            | 0      | S       | 0          | "Por favor selecione a cor do produto"        |
            | 0      | S       | 1          | "Por favor selecione a cor do produto"        |
            | 0      | S       | 2          | "Por favor selecione a cor do produto"        |
            | 0      | S       | 3          | "Por favor selecione a cor do produto"        |
            | 0      | S       | 4          | "Por favor selecione a cor do produto"        |
            | 0      | S       | 5          | "Por favor selecione a cor do produto"        |
            | 0      | S       | 6          | "Por favor selecione a cor do produto"        |
            | 0      | S       | 7          | "Por favor selecione a cor do produto"        |
            | 0      | S       | 8          | "Por favor selecione a cor do produto"        |
            | 0      | S       | 9          | "Por favor selecione a cor do produto"        |
            | 0      | S       | 10         | "Por favor selecione a cor do produto"        |
            | 0      | S       | 11         | "Limite de produto excedido (max. 10 itens)"  |
            | 0      | M       | 0          | "Por favor selecione a cor do produto"        |
            | 0      | M       | 1          | "Por favor selecione a cor do produto"        |
            | 0      | M       | 2          | "Por favor selecione a cor do produto"        |
            | 0      | M       | 3          | "Por favor selecione a cor do produto"        |
            | 0      | M       | 4          | "Por favor selecione a cor do produto"        |
            | 0      | M       | 5          | "Por favor selecione a cor do produto"        |
            | 0      | M       | 6          | "Por favor selecione a cor do produto"        |
            | 0      | M       | 7          | "Por favor selecione a cor do produto"        |
            | 0      | M       | 8          | "Por favor selecione a cor do produto"        |
            | 0      | M       | 9          | "Por favor selecione a cor do produto"        |
            | 0      | M       | 10         | "Por favor selecione a cor do produto"        |
            | 0      | M       | 11         | "Limite de produto excedido (max. 10 itens)"  |
            | 0      | L       | 0          | "Por favor selecione a cor do produto"        |
            | 0      | L       | 1          | "Por favor selecione a cor do produto"        |
            | 0      | L       | 2          | "Por favor selecione a cor do produto"        |
            | 0      | L       | 3          | "Por favor selecione a cor do produto"        |
            | 0      | L       | 4          | "Por favor selecione a cor do produto"        |
            | 0      | L       | 5          | "Por favor selecione a cor do produto"        |
            | 0      | L       | 6          | "Por favor selecione a cor do produto"        |
            | 0      | L       | 7          | "Por favor selecione a cor do produto"        |
            | 0      | L       | 8          | "Por favor selecione a cor do produto"        |
            | 0      | L       | 9          | "Por favor selecione a cor do produto"        |
            | 0      | L       | 10         | "Por favor selecione a cor do produto"        |
            | 0      | L       | 11         | "Limite de produto excedido (max. 10 itens)"  |
            | 0      | XL      | 0          | "Por favor selecione a cor do produto"        |
            | 0      | XL      | 1          | "Por favor selecione a cor do produto"        |
            | 0      | XL      | 2          | "Por favor selecione a cor do produto"        |
            | 0      | XL      | 3          | "Por favor selecione a cor do produto"        |
            | 0      | XL      | 4          | "Por favor selecione a cor do produto"        |
            | 0      | XL      | 5          | "Por favor selecione a cor do produto"        |
            | 0      | XL      | 6          | "Por favor selecione a cor do produto"        |
            | 0      | XL      | 7          | "Por favor selecione a cor do produto"        |
            | 0      | XL      | 8          | "Por favor selecione a cor do produto"        |
            | 0      | XL      | 9          | "Por favor selecione a cor do produto"        |
            | 0      | XL      | 10         | "Por favor selecione a cor do produto"        |
            | 0      | XL      | 11         | "Limite de produto excedido (max. 10 itens)"  |
            | BLUE   | 0       | 0          | "Por favor selecione o tamanho do produto"    |
            | BLUE   | 0       | 1          | "Por favor selecione o tamanho do produto"    |
            | BLUE   | 0       | 2          | "Por favor selecione o tamanho do produto"    |
            | BLUE   | 0       | 3          | "Por favor selecione o tamanho do produto"    |
            | BLUE   | 0       | 4          | "Por favor selecione o tamanho do produto"    |
            | BLUE   | 0       | 5          | "Por favor selecione o tamanho do produto"    |
            | BLUE   | 0       | 6          | "Por favor selecione o tamanho do produto"    |
            | BLUE   | 0       | 7          | "Por favor selecione o tamanho do produto"    |
            | BLUE   | 0       | 8          | "Por favor selecione o tamanho do produto"    |
            | BLUE   | 0       | 9          | "Por favor selecione o tamanho do produto"    |
            | BLUE   | 0       | 10         | "Por favor selecione o tamanho do produto"    |
            | BLUE   | 0       | 11         | "Por favor selecione o tamanho do produto"    |
            | ORANGE | 0       | 0          | "Por favor selecione o tamanho do produto"    |
            | ORANGE | 0       | 1          | "Por favor selecione o tamanho do produto"    |
            | ORANGE | 0       | 2          | "Por favor selecione o tamanho do produto"    |
            | ORANGE | 0       | 3          | "Por favor selecione o tamanho do produto"    |
            | ORANGE | 0       | 4          | "Por favor selecione o tamanho do produto"    |
            | ORANGE | 0       | 5          | "Por favor selecione o tamanho do produto"    |
            | ORANGE | 0       | 6          | "Por favor selecione o tamanho do produto"    |
            | ORANGE | 0       | 7          | "Por favor selecione o tamanho do produto"    |
            | ORANGE | 0       | 8          | "Por favor selecione o tamanho do produto"    |
            | ORANGE | 0       | 9          | "Por favor selecione o tamanho do produto"    |
            | ORANGE | 0       | 10         | "Por favor selecione o tamanho do produto"    |
            | ORANGE | 0       | 11         | "Por favor selecione o tamanho do produto"    |
            | RED    | 0       | 0          | "Por favor selecione o tamanho do produto"    |
            | RED    | 0       | 1          | "Por favor selecione o tamanho do produto"    |
            | RED    | 0       | 2          | "Por favor selecione o tamanho do produto"    |
            | RED    | 0       | 3          | "Por favor selecione o tamanho do produto"    |
            | RED    | 0       | 4          | "Por favor selecione o tamanho do produto"    |
            | RED    | 0       | 5          | "Por favor selecione o tamanho do produto"    |
            | RED    | 0       | 6          | "Por favor selecione o tamanho do produto"    |
            | RED    | 0       | 7          | "Por favor selecione o tamanho do produto"    |
            | RED    | 0       | 8          | "Por favor selecione o tamanho do produto"    |
            | RED    | 0       | 9          | "Por favor selecione o tamanho do produto"    |
            | RED    | 0       | 10         | "Por favor selecione o tamanho do produto"    |
            | RED    | 0       | 11         | "Por favor selecione o tamanho do produto"    |
            | BLUE   | XS      | 0          | "Por favor selecione a quantidade do produto" |
            | BLUE   | XS      | 1          | "Produto adicionado ao carrinho com sucesso!" |
            | BLUE   | XS      | 2          | "Produto adicionado ao carrinho com sucesso!" |
            | BLUE   | XS      | 3          | "Produto adicionado ao carrinho com sucesso!" |
            | BLUE   | XS      | 4          | "Produto adicionado ao carrinho com sucesso!" |
            | BLUE   | XS      | 5          | "Produto adicionado ao carrinho com sucesso!" |
            | BLUE   | XS      | 6          | "Produto adicionado ao carrinho com sucesso!" |
            | BLUE   | XS      | 7          | "Produto adicionado ao carrinho com sucesso!" |
            | BLUE   | XS      | 8          | "Produto adicionado ao carrinho com sucesso!" |
            | BLUE   | XS      | 9          | "Produto adicionado ao carrinho com sucesso!" |
            | BLUE   | XS      | 10         | "Produto adicionado ao carrinho com sucesso!" |
            | BLUE   | XS      | 11         | "Limite de produto excedido (max. 10 itens)"  |
            | BLUE   | S       | 0          | "Por favor selecione a quantidade do produto" |
            | BLUE   | S       | 1          | "Produto adicionado ao carrinho com sucesso!" |
            | BLUE   | S       | 2          | "Produto adicionado ao carrinho com sucesso!" |
            | BLUE   | S       | 3          | "Produto adicionado ao carrinho com sucesso!" |
            | BLUE   | S       | 4          | "Produto adicionado ao carrinho com sucesso!" |
            | BLUE   | S       | 5          | "Produto adicionado ao carrinho com sucesso!" |
            | BLUE   | S       | 6          | "Produto adicionado ao carrinho com sucesso!" |
            | BLUE   | S       | 7          | "Produto adicionado ao carrinho com sucesso!" |
            | BLUE   | S       | 8          | "Produto adicionado ao carrinho com sucesso!" |
            | BLUE   | S       | 9          | "Produto adicionado ao carrinho com sucesso!" |
            | BLUE   | S       | 10         | "Produto adicionado ao carrinho com sucesso!" |
            | BLUE   | S       | 11         | "Limite de produto excedido (max. 10 itens)"  |
            | BLUE   | M       | 0          | "Por favor selecione a quantidade do produto" |
            | BLUE   | M       | 1          | "Produto adicionado ao carrinho com sucesso!" |
            | BLUE   | M       | 2          | "Produto adicionado ao carrinho com sucesso!" |
            | BLUE   | M       | 3          | "Produto adicionado ao carrinho com sucesso!" |
            | BLUE   | M       | 4          | "Produto adicionado ao carrinho com sucesso!" |
            | BLUE   | M       | 5          | "Produto adicionado ao carrinho com sucesso!" |
            | BLUE   | M       | 6          | "Produto adicionado ao carrinho com sucesso!" |
            | BLUE   | M       | 7          | "Produto adicionado ao carrinho com sucesso!" |
            | BLUE   | M       | 8          | "Produto adicionado ao carrinho com sucesso!" |
            | BLUE   | M       | 9          | "Produto adicionado ao carrinho com sucesso!" |
            | BLUE   | M       | 10         | "Produto adicionado ao carrinho com sucesso!" |
            | BLUE   | M       | 11         | "Limite de produto excedido (max. 10 itens)"  |
            | BLUE   | L       | 0          | "Por favor selecione a quantidade do produto" |
            | BLUE   | L       | 1          | "Produto adicionado ao carrinho com sucesso!" |
            | BLUE   | L       | 2          | "Produto adicionado ao carrinho com sucesso!" |
            | BLUE   | L       | 3          | "Produto adicionado ao carrinho com sucesso!" |
            | BLUE   | L       | 4          | "Produto adicionado ao carrinho com sucesso!" |
            | BLUE   | L       | 5          | "Produto adicionado ao carrinho com sucesso!" |
            | BLUE   | L       | 6          | "Produto adicionado ao carrinho com sucesso!" |
            | BLUE   | L       | 7          | "Produto adicionado ao carrinho com sucesso!" |
            | BLUE   | L       | 8          | "Produto adicionado ao carrinho com sucesso!" |
            | BLUE   | L       | 9          | "Produto adicionado ao carrinho com sucesso!" |
            | BLUE   | L       | 10         | "Produto adicionado ao carrinho com sucesso!" |
            | BLUE   | L       | 11         | "Limite de produto excedido (max. 10 itens)"  |
            | BLUE   | XL      | 0          | "Por favor selecione a quantidade do produto" |
            | BLUE   | XL      | 1          | "Produto adicionado ao carrinho com sucesso!" |
            | BLUE   | XL      | 2          | "Produto adicionado ao carrinho com sucesso!" |
            | BLUE   | XL      | 3          | "Produto adicionado ao carrinho com sucesso!" |
            | BLUE   | XL      | 4          | "Produto adicionado ao carrinho com sucesso!" |
            | BLUE   | XL      | 5          | "Produto adicionado ao carrinho com sucesso!" |
            | BLUE   | XL      | 6          | "Produto adicionado ao carrinho com sucesso!" |
            | BLUE   | XL      | 7          | "Produto adicionado ao carrinho com sucesso!" |
            | BLUE   | XL      | 8          | "Produto adicionado ao carrinho com sucesso!" |
            | BLUE   | XL      | 9          | "Produto adicionado ao carrinho com sucesso!" |
            | BLUE   | XL      | 10         | "Produto adicionado ao carrinho com sucesso!" |
            | BLUE   | XL      | 11         | "Limite de produto excedido (max. 10 itens)"  |
            | ORANGE | XS      | 0          | "Por favor selecione a quantidade do produto" |
            | ORANGE | XS      | 0          | "Por favor selecione a quantidade do produto" |
            | ORANGE | XS      | 1          | "Produto adicionado ao carrinho com sucesso!" |
            | ORANGE | XS      | 2          | "Produto adicionado ao carrinho com sucesso!" |
            | ORANGE | XS      | 3          | "Produto adicionado ao carrinho com sucesso!" |
            | ORANGE | XS      | 4          | "Produto adicionado ao carrinho com sucesso!" |
            | ORANGE | XS      | 5          | "Produto adicionado ao carrinho com sucesso!" |
            | ORANGE | XS      | 6          | "Produto adicionado ao carrinho com sucesso!" |
            | ORANGE | XS      | 7          | "Produto adicionado ao carrinho com sucesso!" |
            | ORANGE | XS      | 8          | "Produto adicionado ao carrinho com sucesso!" |
            | ORANGE | XS      | 9          | "Produto adicionado ao carrinho com sucesso!" |
            | ORANGE | XS      | 10         | "Produto adicionado ao carrinho com sucesso!" |
            | ORANGE | XS      | 11         | "Limite de produto excedido (max. 10 itens)"  |
            | ORANGE | S       | 0          | "Por favor selecione a quantidade do produto" |
            | ORANGE | S       | 1          | "Produto adicionado ao carrinho com sucesso!" |
            | ORANGE | S       | 2          | "Produto adicionado ao carrinho com sucesso!" |
            | ORANGE | S       | 3          | "Produto adicionado ao carrinho com sucesso!" |
            | ORANGE | S       | 4          | "Produto adicionado ao carrinho com sucesso!" |
            | ORANGE | S       | 5          | "Produto adicionado ao carrinho com sucesso!" |
            | ORANGE | S       | 6          | "Produto adicionado ao carrinho com sucesso!" |
            | ORANGE | S       | 7          | "Produto adicionado ao carrinho com sucesso!" |
            | ORANGE | S       | 8          | "Produto adicionado ao carrinho com sucesso!" |
            | ORANGE | S       | 9          | "Produto adicionado ao carrinho com sucesso!" |
            | ORANGE | S       | 10         | "Produto adicionado ao carrinho com sucesso!" |
            | ORANGE | S       | 11         | "Limite de produto excedido (max. 10 itens)"  |
            | ORANGE | M       | 0          | "Por favor selecione a quantidade do produto" |
            | ORANGE | M       | 1          | "Produto adicionado ao carrinho com sucesso!" |
            | ORANGE | M       | 2          | "Produto adicionado ao carrinho com sucesso!" |
            | ORANGE | M       | 3          | "Produto adicionado ao carrinho com sucesso!" |
            | ORANGE | M       | 4          | "Produto adicionado ao carrinho com sucesso!" |
            | ORANGE | M       | 5          | "Produto adicionado ao carrinho com sucesso!" |
            | ORANGE | M       | 6          | "Produto adicionado ao carrinho com sucesso!" |
            | ORANGE | M       | 7          | "Produto adicionado ao carrinho com sucesso!" |
            | ORANGE | M       | 8          | "Produto adicionado ao carrinho com sucesso!" |
            | ORANGE | M       | 9          | "Produto adicionado ao carrinho com sucesso!" |
            | ORANGE | M       | 10         | "Produto adicionado ao carrinho com sucesso!" |
            | ORANGE | M       | 11         | "Limite de produto excedido (max. 10 itens)"  |
            | ORANGE | L       | 0          | "Por favor selecione a quantidade do produto" |
            | ORANGE | L       | 1          | "Produto adicionado ao carrinho com sucesso!" |
            | ORANGE | L       | 2          | "Produto adicionado ao carrinho com sucesso!" |
            | ORANGE | L       | 3          | "Produto adicionado ao carrinho com sucesso!" |
            | ORANGE | L       | 4          | "Produto adicionado ao carrinho com sucesso!" |
            | ORANGE | L       | 5          | "Produto adicionado ao carrinho com sucesso!" |
            | ORANGE | L       | 6          | "Produto adicionado ao carrinho com sucesso!" |
            | ORANGE | L       | 7          | "Produto adicionado ao carrinho com sucesso!" |
            | ORANGE | L       | 8          | "Produto adicionado ao carrinho com sucesso!" |
            | ORANGE | L       | 9          | "Produto adicionado ao carrinho com sucesso!" |
            | ORANGE | L       | 10         | "Produto adicionado ao carrinho com sucesso!" |
            | ORANGE | L       | 11         | "Limite de produto excedido (max. 10 itens)"  |
            | ORANGE | XL      | 0          | "Por favor selecione a quantidade do produto" |
            | ORANGE | XL      | 1          | "Produto adicionado ao carrinho com sucesso!" |
            | ORANGE | XL      | 2          | "Produto adicionado ao carrinho com sucesso!" |
            | ORANGE | XL      | 3          | "Produto adicionado ao carrinho com sucesso!" |
            | ORANGE | XL      | 4          | "Produto adicionado ao carrinho com sucesso!" |
            | ORANGE | XL      | 5          | "Produto adicionado ao carrinho com sucesso!" |
            | ORANGE | XL      | 6          | "Produto adicionado ao carrinho com sucesso!" |
            | ORANGE | XL      | 7          | "Produto adicionado ao carrinho com sucesso!" |
            | ORANGE | XL      | 8          | "Produto adicionado ao carrinho com sucesso!" |
            | ORANGE | XL      | 9          | "Produto adicionado ao carrinho com sucesso!" |
            | ORANGE | XL      | 10         | "Produto adicionado ao carrinho com sucesso!" |
            | ORANGE | XL      | 11         | "Limite de produto excedido (max. 10 itens)"  |
            | RED    | XS      | 0          | "Por favor selecione a quantidade do produto" |
            | RED    | XS      | 1          | "Produto adicionado ao carrinho com sucesso!" |
            | RED    | XS      | 2          | "Produto adicionado ao carrinho com sucesso!" |
            | RED    | XS      | 3          | "Produto adicionado ao carrinho com sucesso!" |
            | RED    | XS      | 4          | "Produto adicionado ao carrinho com sucesso!" |
            | RED    | XS      | 5          | "Produto adicionado ao carrinho com sucesso!" |
            | RED    | XS      | 6          | "Produto adicionado ao carrinho com sucesso!" |
            | RED    | XS      | 7          | "Produto adicionado ao carrinho com sucesso!" |
            | RED    | XS      | 8          | "Produto adicionado ao carrinho com sucesso!" |
            | RED    | XS      | 9          | "Produto adicionado ao carrinho com sucesso!" |
            | RED    | XS      | 10         | "Produto adicionado ao carrinho com sucesso!" |
            | RED    | XS      | 11         | "Limite de produto excedido (max. 10 itens)"  |
            | RED    | S       | 0          | "Por favor selecione a quantidade do produto" |
            | RED    | S       | 1          | "Produto adicionado ao carrinho com sucesso!" |
            | RED    | S       | 2          | "Produto adicionado ao carrinho com sucesso!" |
            | RED    | S       | 3          | "Produto adicionado ao carrinho com sucesso!" |
            | RED    | S       | 4          | "Produto adicionado ao carrinho com sucesso!" |
            | RED    | S       | 5          | "Produto adicionado ao carrinho com sucesso!" |
            | RED    | S       | 6          | "Produto adicionado ao carrinho com sucesso!" |
            | RED    | S       | 7          | "Produto adicionado ao carrinho com sucesso!" |
            | RED    | S       | 8          | "Produto adicionado ao carrinho com sucesso!" |
            | RED    | S       | 9          | "Produto adicionado ao carrinho com sucesso!" |
            | RED    | S       | 10         | "Produto adicionado ao carrinho com sucesso!" |
            | RED    | S       | 11         | "Limite de produto excedido (max. 10 itens)"  |
            | RED    | M       | 0          | "Por favor selecione a quantidade do produto" |
            | RED    | M       | 1          | "Produto adicionado ao carrinho com sucesso!" |
            | RED    | M       | 2          | "Produto adicionado ao carrinho com sucesso!" |
            | RED    | M       | 3          | "Produto adicionado ao carrinho com sucesso!" |
            | RED    | M       | 4          | "Produto adicionado ao carrinho com sucesso!" |
            | RED    | M       | 5          | "Produto adicionado ao carrinho com sucesso!" |
            | RED    | M       | 6          | "Produto adicionado ao carrinho com sucesso!" |
            | RED    | M       | 7          | "Produto adicionado ao carrinho com sucesso!" |
            | RED    | M       | 8          | "Produto adicionado ao carrinho com sucesso!" |
            | RED    | M       | 9          | "Produto adicionado ao carrinho com sucesso!" |
            | RED    | M       | 10         | "Produto adicionado ao carrinho com sucesso!" |
            | RED    | M       | 11         | "Limite de produto excedido (max. 10 itens)"  |
            | RED    | L       | 0          | "Por favor selecione a quantidade do produto" |
            | RED    | L       | 1          | "Produto adicionado ao carrinho com sucesso!" |
            | RED    | L       | 2          | "Produto adicionado ao carrinho com sucesso!" |
            | RED    | L       | 3          | "Produto adicionado ao carrinho com sucesso!" |
            | RED    | L       | 4          | "Produto adicionado ao carrinho com sucesso!" |
            | RED    | L       | 5          | "Produto adicionado ao carrinho com sucesso!" |
            | RED    | L       | 6          | "Produto adicionado ao carrinho com sucesso!" |
            | RED    | L       | 7          | "Produto adicionado ao carrinho com sucesso!" |
            | RED    | L       | 8          | "Produto adicionado ao carrinho com sucesso!" |
            | RED    | L       | 9          | "Produto adicionado ao carrinho com sucesso!" |
            | RED    | L       | 10         | "Produto adicionado ao carrinho com sucesso!" |
            | RED    | L       | 11         | "Limite de produto excedido (max. 10 itens)"  |
            | RED    | XL      | 0          | "Por favor selecione a quantidade do produto" |
            | RED    | XL      | 1          | "Produto adicionado ao carrinho com sucesso!" |
            | RED    | XL      | 2          | "Produto adicionado ao carrinho com sucesso!" |
            | RED    | XL      | 3          | "Produto adicionado ao carrinho com sucesso!" |
            | RED    | XL      | 4          | "Produto adicionado ao carrinho com sucesso!" |
            | RED    | XL      | 5          | "Produto adicionado ao carrinho com sucesso!" |
            | RED    | XL      | 6          | "Produto adicionado ao carrinho com sucesso!" |
            | RED    | XL      | 7          | "Produto adicionado ao carrinho com sucesso!" |
            | RED    | XL      | 8          | "Produto adicionado ao carrinho com sucesso!" |
            | RED    | XL      | 9          | "Produto adicionado ao carrinho com sucesso!" |
            | RED    | XL      | 10         | "Produto adicionado ao carrinho com sucesso!" |
            | RED    | XL      | 11         | "Limite de produto excedido (max. 10 itens)"  |
