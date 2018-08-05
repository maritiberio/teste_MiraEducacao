class EmailPage < BaseScreen

    def validarCampos
        validarCampoEmail
        validarCampoRepetirEmail
    end

    def validarCampoEmail
        validate_element("input_email_text")
        campo = elementExists("input_email_text")
        return campo
    end

    def validarCampoRepetirEmail
        validate_element("input_repEmail_text")
        campo = elementExists("input_repemail_text")
        return campo
    end

    def inserirEmail(text)
        insert_text("input_email_text", "#{text}")
        $driver.hide_keyboard
    end

    def inserirEmailRep(text)
        insert_text("input_repEmail_text", "#{text}")
        $driver.hide_keyboard
    end

end