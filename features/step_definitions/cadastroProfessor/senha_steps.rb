Dado("que eu já preenchi meu endereço") do
    steps(%"
        E que eu já preenchi o meu e-mail
        E eu informo o endereço:
            | rua         | Rua Pitinga |
            | numero      | 51          |
            | complemento | 32 A        |
            | bairro      | Vila Lucia  |
            | estado      | São Paulo   |
            | cidade      | São Paulo   |
        E eu toco no botão avançar")
    @senha = SenhaPage.new
end

Então("eu devo ver o campo para eu preencher minha senha") do
    campoExist = @senha.validarCampoSenha
    expect(campoExist).to eql "true"
end

Então("eu devo ver o campo para eu repetir a senha") do
    campoExist = @senha.validarCampoRepetirSenha
    expect(campoExist).to eql "true"
end

Quando("eu informo as senhas:") do |table|
    senha = table.rows_hash
    inserirSenha(senha['senha'])
    inserirSenhaRep(senha['senha2'])
end

Então("eu devo ver a força da senha {string}") do |string|
    msgForca = @senha.validarForcaSenha
    expect(msgForca).to eql string
end

Então("eu devo ver um modal com a descrição {string} e o botão {string}") do |descricao, botao|
    validacao = @senha.validarModal
    expect(validacao[0]).to eql descricao
    expect(validacao[1]).to eql botao
end
