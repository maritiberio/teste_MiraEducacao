#1- Saber quais caps queremos na nossa sessao (appium.txt)
caps_path = File.join(File.dirname(__FILE__), '..','..','caps', ENV['QA'], "#{ENV['PLATFORM']}.txt")
caps = Appium.load_appium_txt file: caps_path, verbose: true

# 2- Criar um cliente e usar as caps
Appium::Driver.new caps, true

class AppiumWorld
end

Appium.promote_appium_methods AppiumWorld

World do
    AppiumWorld.new
end

FeatureMemory = Struct.new(:feature).new

#3- Iniciar a sessao
Before do |scenario|
    Appium::Driver.new caps, true
    $driver.start_driver

end

#4- Fechar a sessao
After do |scenario|

    nome_funcionalidade = scenario.feature.name.tr(' ', '').downcase!
    nome_cenario = scenario.name.tr(' ', '').downcase!
    nome_funcionalidade = nome_funcionalidade.gsub(/([_@#!%()\-=;><,{}\~\[\]\.\/\?\"\*\ˆ\$\+\-]+)/,'')
    nome_cenario = nome_cenario.gsub(/([_@#!%()\-=;><,{}\~\[\]\.\/\?\"\*\ˆ\$\+\-]+)/,'')
    file_name = "reports/screenshot/#{nome_funcionalidade} - #{nome_cenario}.png"
    $driver.screenshot(file_name)
    embed(file_name, 'image/png', 'Clique aqui para ver a evidência!')   

    $driver.driver_quit 
end
