# language: pt
Funcionalidade: Cadastro de professor
Sendo um professor
Posso realizar o meu cadastro através do aplicativo
Para que eu possa facilitar a minha rotina dentro e fora da sala de aula.

   Cenário: Validação da tela Preencha com seus dados
        Dado que estou na tela de login
        Quando eu toco no botão Meu Primeiro Acesso
        Então eu devo ver o campo para eu preencher o meu CPF
        E eu devo ver o campo para eu preencher a data de nascimento
        E o botão para avançar deve estar desabilitado

    Cenário: CPF inválido
        Dado que estou na tela para preencher meus dados
        Quando eu informo o CPF "11111111111"
        E eu informo a data de nascimento "27/08/1995"
        Então eu devo ver a mensagem "CPF inválido"
        E o botão para avançar deve estar desabilitado

    Cenário: Data de nascimento inválido
        Dado que estou na tela para preencher meus dados
        Quando eu informo o CPF "43207985890"
        E eu informo a data de nascimento "31/02/2025"
        Então eu devo ver a mensagem "Data de nascimento inválida"
        E o botão para avançar deve estar desabilitado

    Cenário: Dados válidos
        Dado que estou na tela para preencher meus dados
        E eu informo o CPF "43207985890"
        E eu informo a data de nascimento "27/08/1995"
        Quando eu toco no botão avançar 
        Então eu devo ver a tela para preencher o meu email

    Cenário: Validação da tela Qual é o seu e-mail
        Dado que já preenchi o meu CPF e a data de nascimento
        Então eu devo ver o campo para eu preencher meu e-mail
        E eu devo ver o campo para eu repetir meu e-mail

    Esquema do Cenário: E-mail inválido
        Dado que já preenchi o meu CPF e a data de nascimento
        Quando eu informo o e-mail "<email>"
        E quando eu repito o e-mail "<confir_email>"
        Então eu devo ver a mensagem "<mensagem>" 
        E o botão para avançar deve estar desabilitado

    Exemplos: 
        | email               | confir_email           | mensagem                        |
        | teste.mira          | teste.mira             | E-mail inválido                 |
        | teste.mira@mira.com | teste.mira@mira.com.br | Os e-mails não coincidem        |
        |                     | teste.mira@mira.com.br | Favor preencher todos os campos |

    Cenário: E-mail válido
        Dado que já preenchi o meu CPF e a data de nascimento
        E eu informo o e-mail "teste.mira@mira.com"
        E quando eu repito o e-mail "teste.mira@mira.com"
        Quando eu toco no botão avançar
        Então eu devo ver a tela para preencher meu endereço

    Cenário: Validação da tela Preencha com seu endereço
        Dado que eu já preenchi o meu e-mail
        Então eu devo ver o campo para eu preencher a minha rua
        E eu devo ver o campo para eu preencher o número
        E eu devo ver o campo para preencher o complemento
        E eu devo ver o campo para preencher o bairro
        E eu devo ver o campo para preencher o Estado
        E eu devo ver o campo para preencher a Cidade
        E o botão para avançar deve estar desabilitado

    Esquema do Cenário: Validação dos campos do endereço
        Dado que eu já preenchi o meu e-mail
        Quando eu informo o endereço:
            | rua         | <rua>    |
            | numero      | <num>    |
            | complemento | <comp>   |
            | bairro      | <bairro> |
            | estado      | <estado> |
            | cidade      | <cidade> |
        Então eu devo ver a mensagem "<mensagem>"
        E o botão para avançar deve estar desabilitado

    Exemplos: 
        | rua         | num | comp | bairro     | estado    | cidade    | mensagem                               |
        |             | 51  | 32 A | Vila Lucia | São Paulo | São Paulo | Favor preencher os campos obrigatórios |
        | Rua Pitinga |     | 32 A | Vila Lucia | São Paulo | São Paulo | Favor preencher os campos obrigatórios |
        | Rua Pitinga | 51  | 32 A |            | São Paulo | São Paulo | Favor preencher os campos obrigatórios |
        | Rua Pitinga | 51  | 32 A | Vila Lucia |           | São Paulo | Favor preencher os campos obrigatórios |
        | Rua Pitinga | 51  | 32 A | Vila Lucia | São Paulo |           | Favor preencher os campos obrigatórios |

    Cenário: Endereço válido
        Dado que eu já preenchi o meu e-mail
        Quando eu informo o endereço:
            | rua         | Rua Pitinga |
            | numero      | 51          |
            | complemento | 32 A        |
            | bairro      | Vila Lucia  |
            | estado      | São Paulo   |
            | cidade      | São Paulo   |
        E eu toco no botão avançar
        Então eu devo ver a tela para preencher a minha senha

    Cenário: Validação da tela Criar uma senha
        Dado que eu já preenchi meu endereço
        Então eu devo ver o campo para eu preencher minha senha
        E eu devo ver o campo para eu repetir a senha
        E o botão para avançar deve estar desabilitado

    Esquema do Cenário: Validação de senha
        Dado que eu já preenchi meu endereço
        Quando eu informo as senhas:
            | senha  | <senha>  |
            | senha2 | <senha2> |
        Então eu devo ver a mensagem "<mensagem>"
        E o botão para avançar deve estar desabilitado

    Exemplos: 
            | senha | senha2 | mensagem                              |
            | 123   | 123    | A senha deve ter 4 caracteres ou mais |
            | 12345 | 12346  | As senhas não coincidem               |
            | 12345 |        | Favor preencher todos os campos       |
            |       | 12345  | Favor preencher todos os campos       |

    Esquema do Cenário: Força da senha
        Dado que eu já preenchi meu endereço
        Quando eu informo as senhas:
            | senha  | <senha>  |
            | senha2 | <senha2> |
        Então eu devo ver a força da senha "<mensagem>"

    Exemplos: 
            | senha | senha2 | mensagem    |
            | 1234  | 1234   | Senha fraca |
            | abcd  | abcd   | Senha fraca |
            | 12ab  | 12ab   | Senha média |
            | 1@$a  | 1@$a   | Senha forte |

    Cenário: Senha válida
        Dado que eu já preenchi meu endereço
        Quando eu informo as senhas:
            | senha  | 1@$a |
            | senha2 | 1@$a |
        E eu toco no botão avançar
        Então eu devo ver um modal com a descrição "Seus dados foram cadastrados com sucesso!" e o botão "Continuar"