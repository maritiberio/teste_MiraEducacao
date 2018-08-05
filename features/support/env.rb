require 'appium_lib'
require 'pry'
require 'capybara'
require 'capybara/cucumber'
require 'faker'
require 'cpf_cnpj'

Faker::Config.locale = 'pt-BR'

Capybara.default_max_wait_time = 10