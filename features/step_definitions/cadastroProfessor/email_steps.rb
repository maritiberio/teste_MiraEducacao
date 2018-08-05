Dado("que já preenchi o meu CPF e a data de nascimento") do
    steps(%"
        E que estou na tela de login
        E eu toco no botão Meu Primeiro Acesso
        E eu informo o CPF '#{CPF.generate}'
        E eu informo a data de nascimento '27/08/1995'
        E eu toco no botão avançar")
end

Então("eu devo ver o campo para eu preencher meu e-mail") do
    @email = EmailPage.new
    campoExist = @email.validarCampoEmail
    expect(campoExist).to eql "true"
end

Então("eu devo ver o campo para eu repetir meu e-mail") do
    campoExist = @email.validarCampoRepetirEmail
    expect(campoExist).to eql "true"
end

Quando("eu informo o e-mail {string}") do |string|
    @email.inserirEmail(string)
end

Quando("quando eu repito o e-mail {string}") do |string|
    @email.inserirEmailRep(string)
end

Então("eu devo ver a tela para preencher meu endereço") do
    @endereco = EnderecoPage.new
    @endereco.validarCampos
end