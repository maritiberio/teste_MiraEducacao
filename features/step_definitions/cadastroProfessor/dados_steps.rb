Dado("que estou na tela de login") do
    @login = Login.new
    @login.validarCampos
end

Quando("eu toco no botão Meu Primeiro Acesso") do
    @login.clicarBtnPrimeiroAcesso
end

Então("eu devo ver o campo para eu preencher o meu CPF") do
    @dados = DadoPage.new
    resp = @dados.validarCampoCPF
    expect(resp).to eql "true"
end

Então("eu devo ver o campo para eu preencher a data de nascimento") do
    resp = @dados.validarCampoData
    expect(resp).to eql "true"
end

Então("o botão para avançar deve estar desabilitado") do
    btnEnable = @dados.btnAvancarEnable
    expect(btnEnable).to eql "false"
end

Dado("que estou na tela para preencher meus dados") do
    @dados = DadoPage.new
    @dados.validarCampos
end

Quando("eu informo o CPF {string}") do |string|
    @dados.inserirCPF(string)
end

Quando("eu informo a data de nascimento {string}") do |string|
    @dados.inserirData(string)
end

Então("eu devo ver a mensagem {string}") do |string|
    msg = @dados.validarMensagem
    expect(msg).to eql string
end

Quando("eu toco no botão avançar") do
    @dados.clicarBtnAvancar
end

Então("eu devo ver a tela para preencher o meu email") do
    @email = EmailPage.new
    @email.validarCampos
end