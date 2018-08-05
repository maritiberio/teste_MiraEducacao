class BaseScreen

    def getElementText(elementId)
        validate_element(elementId)
        txt = $driver.find_element(:id, elementId).attribute("text")
        txt = txt.tr("\n", ' ')
        return txt
    end

    def elementExists(elementId)
        resp = $driver.exists { $driver.find_element(:id, elementId)}
        return resp
    end

    def getElementEnable(elementId)
        validate_element(elementId)
        enable = $driver.find_element(:id, elementId).attribute("enabled")
        return enable
    end

    def validate_element(elementId)
        $driver.wait_true(timeout:15) { $driver.exists { $driver.find_element(:id, elementId)}}
    end

    def touch_element(elementId)
        validate_element(elementId)
        btn = $driver.find_element(:id, elementId)
        btn.click
    end

    def insert_text(elementId, text)
        validate_element(elementId)
        txtBox = $driver.find_element(:id, elementId)
        txtBox.click
        txtBox.send_keys(text)
    end

end