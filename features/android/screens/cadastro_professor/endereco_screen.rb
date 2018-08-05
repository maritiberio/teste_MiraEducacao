class EnderecoPage < BaseScreen

    def validarCampos
        validarCampoRua
        validarCampoNumero
        validarCampoComplemento
        validarCampoBairro
        validarCampoEstado
        validarCampoCidade
    end

    def validarCampoRua
        validate_element("input_rua_text")
        campo = elementExists("input_rua_text")
        return campo
    end

    def validarCampoNumero
        validate_element("input_numero_text")
        campo = elementExists("input_numero_text")
        return campo
    end

    def validarCampoComplemento
        validate_element("input_complemento_text")
        campo = elementExists("input_complemento_text")
        return campo
    end

    def validarCampoBairro
        validate_element("input_bairro_text")
        campo = elementExists("input_bairro_text")
        return campo
    end

    def validarCampoEstado
        validate_element("input_estado_text")
        campo = elementExists("input_estado_text")
        return campo
    end

    def validarCampoCidade
        validate_element("input_cidade_text")
        campo = elementExists("input_cidade_text")
        return campo
    end

    def inserirRua(text)
        insert_text("input_rua_text", "#{text}")
        $driver.hide_keyboard
    end

    def inserirNumero(text)
        insert_text("input_numero_text", "#{text}")
        $driver.hide_keyboard
    end

    def inserirComplemento(text)
        insert_text("input_complemento_text", "#{text}")
        $driver.hide_keyboard
    end

    def inserirBairro(text)
        insert_text("input_bairro_text", "#{text}")
        $driver.hide_keyboard
    end

    def inserirEstado(text)
        insert_text("input_estado_text", "#{text}")
        $driver.hide_keyboard
    end

    def inserirCidade(text)
        insert_text("input_cidade_text", "#{text}")
        $driver.hide_keyboard
    end

end