Dado("que eu já preenchi o meu e-mail") do
    email = Faker::Internet.email
    steps(%"
        E que já preenchi o meu CPF e a data de nascimento
        E eu informo o e-mail '#{email}'
        E quando eu repito o e-mail '#{email}'
        E eu toco no botão avançar")

    @endereco = EnderecoPage.new
end

Então("eu devo ver o campo para eu preencher a minha rua") do
    campoExist = @endereco.validarCampoRua
    expect(campoExist).to eql "true"
end

Então("eu devo ver o campo para eu preencher o número") do
    campoExist = @endereco.validarCampoNumero
    expect(campoExist).to eql "true"
end

Então("eu devo ver o campo para preencher o complemento") do
    campoExist = @endereco.validarCampoComplemento
    expect(campoExist).to eql "true"
end

Então("eu devo ver o campo para preencher o bairro") do
    campoExist = @endereco.validarCampoBairro
    expect(campoExist).to eql "true"
end

Então("eu devo ver o campo para preencher o Estado") do
    campoExist = @endereco.validarCampoEstado
    expect(campoExist).to eql "true"
end

Então("eu devo ver o campo para preencher a Cidade") do
       campoExist = @endereco.validarCampoCidade
    expect(campoExist).to eql "true"
end

Quando("eu informo o endereço:") do |table|
    endereco = table.rows_hash
    inserirRua(endereco['rua'])
    inserirNumero(endereco['numero'])
    inserirComplemento(endereco['complemento'])
    inserirBairro(endereco['bairro'])
    inserirEstado(endereco['estado'])
    inserirCidade(endereco['cidade'])
end

Então("eu devo ver a tela para preencher a minha senha") do
    @senha = SenhaPage.new
    @senha.validarCampos
end