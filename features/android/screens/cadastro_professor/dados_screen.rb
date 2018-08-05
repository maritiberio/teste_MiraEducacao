class DadoPage < BaseScreen

    def validarCampos
        validarCampoCPF
        validarCampoData
    end

    def validarCampoCPF
        validate_element("input_cpf_text")
        campo = elementExists("input_cpf_text")
        return campo
    end

    def validarCampoData
        validate_element("input_nascimento_text")
        campo = elementExists("input_nascimento_text")
        return campo
    end

    def btnAvancarEnable
        btn = getElementEnable("button_avancar")
        return btn
    end

    def inserirCPF(text)
        insert_text("input_cpf_text", "#{text}")
        $driver.hide_keyboard
    end

    def inserirData(text)
        insert_text("input_nascimento_text", "#{text}")
        $driver.hide_keyboard
    end

    def validarMensagem
        msg = getElementText("alert_description")
        return msg
    end

    def clicarBtnAvancar
        touch_element("button_avancar")
    end

end