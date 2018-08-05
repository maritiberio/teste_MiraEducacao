class SenhaPage < BaseScreen

    def validarCampos
        validarCampoSenha
        validarCampoRepetirSenha
    end

    def validarCampoSenha
        validate_element("input_senha_text")
        campo = elementExists("input_senha_text")
        return campo
    end

    def validarCampoRepetirSenha
        validate_element("input_repSenha_text")
        campo = elementExists("input_repSenha_text")
        return campo
    end

    def inserirSenha(text)
        insert_text("input_senha_text", "#{text}")
        $driver.hide_keyboard
    end

    def inserirSenhaRep(text)
        insert_text("input_repSenha_text", "#{text}")
        $driver.hide_keyboard
    end

    def validarForcaSenha
        resp = getElementText("message_status_password")
        return resp
    end

    def validarModal
        mensagem = getElementText('dialog_alert_description')
        botao = getElementText('dialog_alert_button')
        resp = [mensagem, botao]
        return resp
    end

end